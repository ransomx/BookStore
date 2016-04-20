using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStores
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        List<Book> cart;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            cart = (List<Book>)Session["ShoppingCart"];

            if (cart == null) 
            {
                cart = new List<Book>();
                cart.Add(new Book("4564", "asdas", "dasdasd", 4569));
                Session["ShoppingCart"] = cart;
            }
            
            GridView1.DataSource = cart;
            GridView1.DataBind();
        }

        protected void BtnConfirm_Click(object sender, EventArgs e)
        {
            cart.Clear();
            Session["ShoppingCart"] = cart;
            Session["TotalValue"] = 0;
            Response.Redirect("Home.aspx");
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Book b = cart.ElementAt(e.RowIndex);
            cart.Remove(b);
            int price = Int32.Parse(Session["TotalValue"].ToString());
            price = price - b.Price;
            Session["TotalValue"] = price;
            GridView1.DataSource = cart;
            GridView1.DataBind();
            Session["ShoppingCart"] = cart;
            Page.Response.Redirect(Page.Request.Url.ToString(), true);
        }
    }
}