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
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        private string bookIsbn = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoggedUser"] == null)
                {
                    PanelLogged.Visible = false;
                    PanelNoLoggin.Visible = true;
                }
                else
                {
                    LblLoggedUser.Text = ((User)Session["LoggedUser"]).Name;
                    PanelLogged.Visible = true;
                    PanelNoLoggin.Visible = false;
                    List<Book> cart;
                    cart = (List<Book>)Session["ShoppingCart"];
                    ShoppingCart.Items.Clear();
                    foreach (Book b in cart)
                    {
                        ShoppingCart.Items.Add(b.Title);
                    }

                    LblTotalValue.Text = Session["TotalValue"] != null ? (Session["TotalValue"].ToString()) : "0";
                    MenuSide.Items.Add(new MenuItem { NavigateUrl = "~/OrderHistory.aspx", Text = "Order history" });
                    MenuSide.Items.Add(new MenuItem { NavigateUrl = "~/Checkout.aspx", Text = "Check Out" });
                    MenuSide.Items.Add(new MenuItem { NavigateUrl = "~/Logout.aspx", Text = "Log Out" });
                }


            }

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            conn.Open();

            string checkBooks = "select count(*) from Books";
            SqlCommand com = new SqlCommand(checkBooks, conn);
            int count = Convert.ToInt32(com.ExecuteScalar().ToString());
            int rand = new Random().Next(0, count);
            com = new SqlCommand("select TOP 1 Title, ISBN from Books ORDER BY NEWID()", conn);
            using (SqlDataReader reader = com.ExecuteReader())
            {
                if (reader.Read())
                {
                    LBtnTitle.Text = reader["Title"].ToString();
                    ImageBook.ImageUrl = "/Images/" + reader["Title"].ToString() + ".jpg";
                    bookIsbn = reader["ISBN"].ToString();
                }
            }
            conn.Close();
        }

        protected void Logout(object sender, EventArgs e)
        {
            Response.Redirect("~/Logout.aspx");
        }

        protected void LBtnTitle_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/BookDetails?isbn=" + bookIsbn);
        }
    }
}