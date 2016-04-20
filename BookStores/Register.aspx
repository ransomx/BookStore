<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookStores.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Registration</h2>
    <asp:Table ID="TableReg" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                Name
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtName" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtName"  ErrorMessage="RequiredFieldValidator" Display="None"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Email
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtEmail" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtEmail"  ErrorMessage="RequiredFieldValidator" Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegexEmail" runat="server" ErrorMessage="Allowed email format: name@domain.xx" Display="None" ValidationExpression="^[A-Za-z0-9](([_\.\-]?[a-zA-Z0-9]+)*)@([A-Za-z0-9]+)(([\.\-]?[a-zA-Z0-9]+)*)\.([A-Za-z]{2,})$" ControlToValidate="TxtEmail"></asp:RegularExpressionValidator>
             
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                Street
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="TxtStreet" runat="server" Text=""></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtStreet"  ErrorMessage="RequiredFieldValidator" Display="None"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="(\D+) (\d+)" runat="server" ErrorMessage="Street has to be in format [letter][space][number]" ControlToValidate="TxtStreet" Display="None" />          
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:Button ID="BtnRegister" runat="server" Text="Register" OnClick="Register"/>
</asp:Content>
