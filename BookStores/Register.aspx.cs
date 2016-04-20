using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStores
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                string insertQuery = "insert into Account (Namn,Email,Titel,Foretagsnamn) values (@Name, @Email, @Street)";
                SqlCommand com = new SqlCommand(insertQuery, conn);
                com.Parameters.AddWithValue("@Name", TxtName.Text);
                com.Parameters.AddWithValue("@Email", TxtEmail.Text);
                com.Parameters.AddWithValue("@Street", TxtStreet.Text);

                com.ExecuteNonQuery();

                conn.Close();
                Response.Redirect("Home.aspx");
                Response.Write("Registration was successfull.");
            }
            catch (Exception ex)
            {
                Response.Write("Error " + ex.ToString());
            }
        }
    }
}