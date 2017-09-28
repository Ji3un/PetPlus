<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindID.aspx.cs" Inherits="FindID" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <div style="text-align: center">
        <h2>::중복확인</h2>
        <hr />
        <br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button5" runat="server" Text="중복확인" OnClick="Button5_Click" />
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="*[아이디] 필수입력" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server"></asp:Label>
&nbsp;<asp:Button ID="Button6" runat="server" Text="사용" OnClick="Button6_Click" />
        <br />
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*영문,숫자 4~10자로 입력하세요." ForeColor="Red" ValidationExpression="[0-9a-zA-Z]{4,10}"></asp:RegularExpressionValidator>
        <br />
    </div>
    </form>
</body>
</html>
