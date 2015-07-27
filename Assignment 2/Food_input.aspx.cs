using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//add a reference so we can use the database
using Assignment_2.Models;

namespace Assignment_2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if there is an id in the URL look up the selected record.
            if (!IsPostBack) { 
                if (!String.IsNullOrEmpty(Request.QueryString["food_id"])) {
                    GetFood();
                }
            }
        }

        protected void GetFood()
        {
            //look up the seleted food and fill the edit form.
            using (DefaultConnection1 db = new DefaultConnection1())
            {
                //store the id from the URL in a variable.
                Int32 food_id = Convert.ToInt32(Request.QueryString["food_id"]);

                //look up the food
                food fd = (from f in db.foods
                           where f.food_id == food_id
                           select f).FirstOrDefault();

                // pre populate the form fields 
                txtFoodName.Text = fd.food_name;
                txtCalories.Text =  Convert.ToString(fd.food_calories);
                txtDate.Text = Convert.ToString(fd.food_date);

            }
        }


        protected void btnAddFood_Click(object sender, EventArgs e)
        {
            //connect 
            using (DefaultConnection1 db = new DefaultConnection1()) 
            {

                //create a new food in memory
                food fd = new food();

                Int32 food_id = 0;

                //check for a url
                if (!String.IsNullOrEmpty(Request.QueryString["food_id"]))
                {
                    //get the id from the url
                    food_id = Convert.ToInt32(Request.QueryString["food_id"]);

                    //look up the food
                    fd = (from f in db.foods
                          where f.food_id == food_id
                          select f).FirstOrDefault();
                }

                //importing the user_id from the session object.
                Int32 user_id = Convert.ToInt32(Session["user_id"]);

                //fill the properties of the new food entry
                fd.food_name = txtFoodName.Text;
                fd.food_calories = Convert.ToInt32(txtCalories.Text);
                fd.food_date = Convert.ToDateTime(txtDate.Text);
                fd.user_id = user_id;

                if (food_id == 0)
                {
                    db.foods.Add(fd);
                }

                //Save the food to the database.
                db.SaveChanges();


                //redierect to the food list page.
                Response.Redirect("food_tracker.aspx");

            }
        }
    }
}