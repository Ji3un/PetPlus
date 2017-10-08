<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_comu.master" AutoEventWireup="true" CodeFile="Send.aspx.cs" Inherits="Community" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../css/Send.css" />
    <style type="text/css">
        .auto-style1 {
            width: 344px;
            height: 184px;
        }
        .auto-style6 {            width: 172px;
        }
        .auto-style8 {
            height: 10px;
            width: 172px;
        }
        .auto-style9 {
            height: 32px;
            width: 172px;
        }
        .auto-style13 {
            height: 20px;
            width: 172px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="comu_wrap" style="height:600px;background-color:#ffffff; text-align:left;">
                    <div class="content" style="width:996px; height:auto; text-align:left; border:none;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Message_img/send.png" />
            <br />
            <div class="menu_bar" style="height:500px; width: 250px;">

                <br />
&nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/send_1.png" PostBackUrl="~/MemberOnly/Send.aspx" />
&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/check_1.png" PostBackUrl="~/MemberOnly/List.aspx" />
            </div>
            <div class="table1">
                <table class="auto-style1" style="border: medium none #ffffff; " border="0" aria-required="False">
                    <tr>
                        <td class="auto-style13">
                            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/send_img.png" Height="30px" Width="100px" />
                        </td>
                        <td class="auto-style8">
                            <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" BorderWidth="1px" Width="70%" Wrap="False" Height="20px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style13">
                            <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/receive_img.png" Height="30px" Width="100px" />
                        </td>
                        <td class="auto-style9">
                            <asp:TextBox ID="TextBox2" runat="server" BorderStyle="Solid" BorderWidth="1px" Width="69%" Height="20px" ></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style13">
                            <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/content_img.png" Height="30px" Width="100px" />
                        </td>
                        <td class="auto-style13">
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Height="78px" Width="240px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style13" style="height:10px">
                            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/list_btn.png" Height="20px" Width="49px" PostBackUrl="~/MemberOnly/List.aspx" />
                        </td>
                        <td class="auto-style6" style="height:10px">
                            <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/send_btn.png" Height="20px" Width="50px" OnClick="ImageButton4_Click" />
                        </td>
                    </tr>
                    </table>

                <br />
                <asp:Label ID="Label1" runat="server"></asp:Label>

            </div>
        </div>
    </div>
</asp:Content>

