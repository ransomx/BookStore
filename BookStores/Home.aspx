<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BookStores.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="search">
        Search: <asp:TextBox ID="TxtSearch" runat="server" OnTextChanged="TxtSearch_TextChanged" ></asp:TextBox>
    </div>
    <div class="content">
        <h2>
            WELCOME to our book store!
        </h2>
    </div>
</asp:Content>
