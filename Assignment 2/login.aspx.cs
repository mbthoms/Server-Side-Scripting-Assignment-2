using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//additional
using Assignment_2.Models;
using System.Security.Cryptography;

namespace Assignment_2
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //connect
            using (DefaultConnection1 db = new DefaultConnection1())
            {
                //create user object in memory
                user objI = new user();

                //first get the salt value for this username
                String email = txtEmailLogin.Text;

                objI = (from em in db.users
                        where em.email == email
                        select em).FirstOrDefault();

                //did the email find a match?
                if (objI != null)
                {
                    String salt = objI.salt;


                    //salt and hash the plan text password.
                    String password = txtPasswordLogin.Text;
                    String pass_and_salt = password + salt;

                    // Create a new instance of the hash crypto service provider.
                    HashAlgorithm hashAlg = new SHA256CryptoServiceProvider();

                    // Convert the data to hash to an array of Bytes.
                    byte[] bytValue = System.Text.Encoding.UTF8.GetBytes(pass_and_salt);

                    // Compute the Hash. This returns an array of Bytes.
                    byte[] bytHash = hashAlg.ComputeHash(bytValue);

                    // Optionally, represent the hash value as a base64-encoded string, 
                    // For example, if you need to display the value or transmit it over a network.
                    string base64 = Convert.ToBase64String(bytHash);

                    //check if the password that was just salted and hashed matches the password in the database.
                    if (objI.password == base64)
                    {
                        //lblError.Text = "Valid Login";
                        //store the identity in the session object 
                        Session["user_id"] = objI.user_id;
                        Session["user_name"] = objI.first_name = " " + objI.last_name;

                        //rediect to logged in homepage.
                        Response.Redirect("login_landing.aspx");
                    }
                    else
                    {
                        lblError.Text = "Invaild Login";
                    }
                }
                else
                {
                    lblError.Text = "Invalid Login";
                }
            }
        }
    }
}