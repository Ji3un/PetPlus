<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_comu.master" AutoEventWireup="true" CodeFile="Hello.aspx.cs" Inherits="Community" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="comu_wrap" style="height:897px; background-color:#ffffff; text-align:left;">
        <div class="content" style="border-style: none; border-color: inherit; border-width: medium; width:996px; height:931px; text-align:left; ">

            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/check.png" />
            <br />
            <br />
&nbsp;&nbsp;<br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <br />

            <asp:Label ID="Label2" runat="server" style="font-weight: 700"></asp:Label>
            <br />
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/list_btn.png" />
&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/write_btn.png" />

        </div>
    </div>
</asp:Content>

