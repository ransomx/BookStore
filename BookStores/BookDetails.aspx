<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="BookStores.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h2>Current book: <asp:Label ID="LblBookName" runat="server" Text="Book"/></h2>
    <asp:Image ID="Image1" CssClass="imageDetails" runat="server" />
    
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                ISBN
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LblISBN" runat="server" Text="Label"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Author
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LblAuthor" runat="server" Text="Label"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Category
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LblCategory" runat="server" Text="Label"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Price
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="LblPrice" runat="server" Text="Label"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <asp:Button ID="BtnAddToCart" runat="server" Text="Add to cart" OnClick="BtnAddToCart_Click" />
    <a href='javascript:history.go(-1)'>Go Back to Previous Page</a>
</asp:Content>
