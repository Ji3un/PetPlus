<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_comu.master" AutoEventWireup="true" CodeFile="Mypage.aspx.cs" Inherits="Community" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link rel="stylesheet" type="text/css" href="../css/Send.css" />
    <style type="text/css">
        .auto-style1 {
            float: left;
            width: 379px;
            height: 265px;
            border-collapse: collapse;
            text-align: center;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="comu_wrap" style="height:287px; background-color:#ffffff; text-align:left;">
         <div class="content" style="border-style: none; border-color: inherit; border-width: medium; width:996px; height:294px; text-align:left; ">
             <br />
            <div class="auto-style1" style="width:996px; height: 255px; margin-bottom: 42;">
            <div class="mypage_logo" style="text-align:center;">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Mypage_btn/mypage.png" style="text-align: center" />
            </div>
                <hr />
                <br />
                <asp:ImageButton ID="ImageButton8" runat="server" ImageUrl="~/Mypage_btn/modify_btn.png" PostBackUrl="~/MemberOnly/Modify.aspx" />
                      &nbsp;<asp:ImageButton ID="ImageButton9" runat="server" ImageUrl="~/Mypage_btn/send_btn.png" PostBackUrl="~/MemberOnly/Send.aspx" />
                <br />
                <br />
                <asp:ImageButton ID="ImageButton10" runat="server" ImageUrl="~/Mypage_btn/calendar_btn.png" PostBackUrl="~/MemberOnly/Calendar.aspx" />
                <br />
                <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/Mypage_btn/received_btn.png" PostBackUrl="~/MemberOnly/Hello.aspx" />
                <br />
            </div>
        </div>
    </div>
</asp:Content>

