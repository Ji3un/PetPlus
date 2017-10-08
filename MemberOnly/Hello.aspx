<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_comu.master" AutoEventWireup="true" CodeFile="Hello.aspx.cs" Inherits="Community" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../css/Hello.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="comu_wrap" style="height:492px; background-color:#ffffff; text-align:left;">
        <div class="content" style="border-style: none; border-color: inherit; border-width: medium; width:996px; height:500px; text-align:left; ">
            <div class="event_logo">
                <img src="../Images/pet_list.jpg" style="width:400px; height:300px" />
            </div>
            <div class="m_check_logo">
                <img src="../Images/check.png" style="width:210px; height:70px"/>
            </div>
            <div class="m_result">
                <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
                <br />
            <br />

            <asp:Label ID="Label2" runat="server" style="font-weight: 700"></asp:Label>
                <br />
            <br />
            <br />
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/list_btn.png" PostBackUrl="~/MemberOnly/List.aspx" />
&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/write_btn.png" PostBackUrl="~/MemberOnly/Send.aspx" />
            </div>

        </div>
    </div>
</asp:Content>

