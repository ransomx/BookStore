<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BookStores.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Log In</h2>
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                Email 
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtLogin" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="BtnLogin" runat="server" Text="Login"  OnClientClick="LoginUser" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
