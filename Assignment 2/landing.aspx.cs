using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//cryptography
using System.Security.Cryptography;
// reference ef model
using Assignment_2.Models;


namespace Assignment_2
{
    public partial class landing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private static string CreateSalt(int size)
        {
            // Generate a cryptographic random number using the cryptographic 
            // service provider
            RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
            byte[] buff = new byte[size];
            rng.GetBytes(buff);
            // Return a Base64 string representation of the random number
            return Convert.ToBase64String(buff);
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            //connect
            using (DefaultConnection1 db = new DefaultConnection1())
            {
                //create a new user
                user objI = new user();

                //fill the properties from the form inputs
                objI.first_name = txtFName.Text;
                objI.last_name = txtLName.Text;
                objI.email = txtEmail.Text;

                //salt and hash the plan text password.
                String password = txtPassword.Text;
                String salt = CreateSalt(8);
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


                objI.password = base64;
                objI.salt = salt;

                //save
                db.users.Add(objI);
                db.SaveChanges();

            }
        }
    }
}