<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="BookStores.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <h3>
            Cart content
        </h3>
        <div class="items">
            <asp:GridView ID="GridView1" runat="server" OnRowDeleting="GridView1_RowDeleting" >
                <Columns>
                    <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
        Total Price: <span> <%= Session["TotalValue"] %>  </span>
        Will be emailed to: <%= Session["LoggedUser"] %> and selected items will be sent to this address: ...
        <asp:Button ID="BtnConfirm" runat="server" Text="Confirm and Pay" OnClick="BtnConfirm_Click" />
    </div>
</asp:Content>
