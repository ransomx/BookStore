<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="BookStores.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="search">
        Search: <asp:TextBox ID="TxtSearch" runat="server" AutoPostBack="True"></asp:TextBox>
    </div>
    Category <asp:DropDownList ID="DropDownCat" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownCat_SelectedIndexChanged">
        <asp:ListItem Selected="True" Value="all">All</asp:ListItem>
        <asp:ListItem Value="Thriller">Thriller</asp:ListItem>
        <asp:ListItem>Romance</asp:ListItem>
        <asp:ListItem>Children</asp:ListItem>
        <asp:ListItem>Science</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [Title], [ISBN], [Author], [Category], [Price] FROM [Books] 
        WHERE [Category] LIKE
                CASE @Category WHEN 'all' THEN [Category] 
                ELSE '%' + @Category
                END
        AND 
        ((([Title] LIKE '%' + @Title + '%')) OR ([Author] LIKE '%' + @Title + '%'))
        ORDER BY [Id], [Title], [ISBN]">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownCat" Name="Category" PropertyName="SelectedValue" Type="String" ConvertEmptyStringToNull="False" />
            <asp:ControlParameter ControlID="TxtSearch" Name="Title" PropertyName="Text" Type="String" ConvertEmptyStringToNull="False" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="BookView" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="BookView_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
            <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
            <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
</asp:Content>
