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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String isbn = Request.QueryString["isbn"];

            string book = "select * from Books where ISBN='" + isbn + "'";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand com = new SqlCommand(book, conn);
            conn.Open();
            using (SqlDataReader oReader = com.ExecuteReader())
            {
                while (oReader.Read())
                {
                    LblAuthor.Text = oReader["Author"].ToString();
                    LblBookName.Text = oReader["Title"].ToString();
                    LblCategory.Text = oReader["Category"].ToString();
                    LblISBN.Text = oReader["ISBN"].ToString();
                    LblPrice.Text = oReader["Price"].ToString();
                }
                conn.Close();
            }
            Image1.ImageUrl = "/Images/"+ LblBookName.Text+".jpg";
        }

        protected void BtnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["LoggedUser"] != null)
            {
                Book toCart = new Book(LblAuthor.Text, LblISBN.Text, LblBookName.Text, Convert.ToInt32(LblPrice.Text));
                ((List<Book>)Session["ShoppingCart"]).Add(toCart);
                
                int price = Int32.Parse(Session["TotalValue"].ToString());
                price = price + toCart.Price;
                Session["TotalValue"] = price;
                Response.Redirect("~/BookDetails?isbn="+ LblISBN.Text);
            }
            else
            {
                Response.Write("You have to login first.");
            }
            
        }
    }
}