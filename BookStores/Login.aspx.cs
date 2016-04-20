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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();

                string checkUser = "select Name, Email, Id from Customers where Email=@Email";
                SqlCommand com = new SqlCommand(checkUser, conn);
                com.Parameters.AddWithValue("@Email", TxtLogin.Text);
                User u = null;
                using (SqlDataReader oReader = com.ExecuteReader())
                {
                    while (oReader.Read())
                    {
                        if (oReader["Name"] == null) break;
                        u = new User();
                        u.Name = oReader["Name"].ToString();
                        u.Email = oReader["Email"].ToString();
                        u.Id = Int32.Parse(oReader["Id"].ToString());
                    }
                }
                conn.Close();
                
                if (u!=null)
                {
                    Session["LoggedUser"] = u;
                    List<Book> cart = new List<Book>();
                    Session["ShoppingCart"] = cart;
                    Session["TotalValue"] = 0;
                    Session["Id"] = u.Id;
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    Response.Write("User with this email doesnt exists");
                }
            }
        }

        protected void LoginUser(object sender, EventArgs e)
        {
            Session["TotalValue"] = 0;
        }


    }
}