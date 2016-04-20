using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStores
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }else

            
            TxtSearch.Text = Request.QueryString["search"]!=null? Request.QueryString["search"].ToString() : "";
            DropDownCat.SelectedValue = Request.QueryString["cat"]!=null? Request.QueryString["cat"].ToString() : DropDownCat.SelectedItem.Value;
        }

        protected void BookView_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("BookDetails.aspx?isbn="+BookView.SelectedRow.Cells[1].Text);
        }

        protected void DropDownCat_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}