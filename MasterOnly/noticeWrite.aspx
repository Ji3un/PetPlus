<%@ Page Title="" Language="C#" MasterPageFile="/MasterPage_main.master" AutoEventWireup="true" CodeFile="noticeWrite.aspx.cs" Inherits="noticeWrite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/notice.css"/>
    <style type="text/css">
        .auto-style2 {
            height: 262px;
            width: 60px;
            text-align: center;
        }
        .auto-style3 {
            width: 611px;
            height: 262px;
        }
        .auto-style5 {
            width: 611px;
            height: 30px;
        }
        .auto-style6 {
            height: 30px;
            width: 60px;
            text-align: center;
        }
        .auto-style7 {
            height: 4px;
            width: 60px;
        }
        .auto-style8 {
            width: 611px;
            height: 4px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="notice_background">
        <div class="notice_contain">
            <h2>공지사항 글쓰기</h2>
            <hr />
            <br />
            <div class="notice_write">
                <table>
                    <tr>
                        <td class="auto-style6">제목</td>
                        <td class="auto-style5" rowspan="1">
                            <asp:TextBox ID="TextBox1" runat="server" Width="600px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">내용</td>
                        <td class="auto-style3" rowspan="1">
                            <asp:TextBox ID="TextBox2" runat="server" Height="250px" TextMode="MultiLine" Width="600px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7"></td>
                        <td class="auto-style8">
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" ImageUrl="~/Images/btn_cancel.png" PostBackUrl="~/noticeList.aspx" />
&nbsp;<asp:ImageButton ID="ImageButton2" runat="server" Height="30px" ImageUrl="~/Images/btn_write.png" OnClick="ImageButton2_Click" />
                        </td>
                    </tr>
                    </table>
            </div>
        </div>
    </div>
</asp:Content>

