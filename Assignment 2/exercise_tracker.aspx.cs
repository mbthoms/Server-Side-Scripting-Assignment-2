using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//add a reference so we can use the database.
using Assignment_2.Models;

namespace Assignment_2
{
    public partial class exercise_tracker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //call the GetExercise function to populate.
            if (!IsPostBack)
            {
                GetExercise();
            }
        }

        protected void GetExercise()
        {
            //using entity framework to connect and get the list of food. 
            using (DefaultConnection1 db = new DefaultConnection1())
            {
                Int32 user_id = Convert.ToInt32(Session["user_id"]);
                var ex = from x in db.exercises
                         where x.user_id == user_id
                         select x;

                // bind the ex query result to the grid
                grdExercise.DataSource = ex.ToList();
                grdExercise.DataBind();
            }
        }

        protected void grdExercise_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //Identify the excercise ID to be deleted from the row that the user selected from
            Int32 exercise_id = Convert.ToInt32(grdExercise.DataKeys[e.RowIndex].Values["exercise_id"]);

            //Connect
            using (DefaultConnection1 db = new DefaultConnection1())
            {
                exercise ex = (from x in db.exercises
                               where x.exercise_id == exercise_id
                               select x).FirstOrDefault();
                //delete
                db.exercises.Remove(ex);
                db.SaveChanges();

                //refresh
                GetExercise();
            }
        }
    }
}