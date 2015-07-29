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
    public partial class food_tracker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //call the GetFood function to populate the grid.
            if (!IsPostBack)
            {
                GetFood();
            }
        }

        protected void GetFood() {
            //using entity framework to connect and get the list of food.
            using (DefaultConnection1 db = new DefaultConnection1())
            {
                //old query that shows all the food in the database.
                //var fd = from f in db.foods
                //         select f;

                //new query filtered for logged in user only.
                Int32 user_id = Convert.ToInt32(Session["user_id"]);
                var fd = from f in db.foods
                         where f.user_id == user_id
                         select f;

                //bind the fd query result to the grid
                grdFood.DataSource = fd.ToList();
                grdFood.DataBind();
            }
    
        }

        protected void grdFood_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
          //indentify the food ID to be deleted from the row the user seleted from.
            Int32 food_id = Convert.ToInt32(grdFood.DataKeys[e.RowIndex].Values["food_id"]);

            //connect
            using (DefaultConnection1 db = new DefaultConnection1())
            {
                food fd = (from f in db.foods
                           where f.food_id == food_id
                           select f).FirstOrDefault();

                //delete
                db.foods.Remove(fd);
                db.SaveChanges();

                //refresh
                GetFood();
            }
        }
    }
}