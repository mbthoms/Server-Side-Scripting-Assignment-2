using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Add a reference so we can use the database
using Assignment_2.Models;

namespace Assignment_2
{
    public partial class exercise_input : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if there is an id in the URL look up the selected record.
            if (!IsPostBack)
            {
                if (!String.IsNullOrEmpty(Request.QueryString["exercise_id"])){
                    GetExercise();
                }
            }
        }
        protected void GetExercise()
        {
            //look up the selected exercise and fill the exercise edit form.
            using (DefaultConnection1 db = new DefaultConnection1())
            {
                //Store the ID from the URL in the variable.
                Int32 exercise_id = Convert.ToInt32(Request.QueryString["exercise_id"]);
                //Look up the food
                exercise ex = (from x in db.exercises
                               where x.exercise_id == exercise_id
                               select x).FirstOrDefault();
                //pre populate the form feilds
                txtExerciseName.Text = ex.exercise_name;
                txtReps.Text = ex.exercise_rep;
                txtExerciseDate.Text = Convert.ToString(ex.exercise_date);
            }
        }

        protected void btnAddExercise_Click(object sender, EventArgs e)
        {
            //Connect
            using (DefaultConnection1 db = new DefaultConnection1())
            {
                //create new exercise in memory 
                exercise ex = new exercise();

                Int32 exercise_id = 0;

                //check for URL 
                if (!String.IsNullOrEmpty(Request.QueryString["exercise_id"])){

                    //get the id from the url
                    exercise_id = Convert.ToInt32(Request.QueryString["exercise_id"]);

                    //Look up the food
                    ex = (from x in db.exercises
                          where x.exercise_id == exercise_id
                          select x).FirstOrDefault();
                }

                //importing the user_id from the session object.
                Int32 user_id = Convert.ToInt32(Session["user_id"]);

                //fill the properties of the new Exercise
                ex.exercise_name = txtExerciseName.Text;
                ex.exercise_rep = txtReps.Text;
                ex.exercise_date = Convert.ToDateTime(txtExerciseDate.Text);
                ex.user_id = user_id;
                
                if(exercise_id == 0){
                    db.exercises.Add(ex);
                }
                //Save the exercise to the data base
                db.SaveChanges();
                //redirect to the exercise tracker page
                Response.Redirect("exercise_tracker.aspx");

            }
        }
    }
}