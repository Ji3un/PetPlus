<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_main.master" AutoEventWireup="true" CodeFile="noticeRead.aspx.cs" Inherits="noticeRead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/notice.css"/>
    <style type="text/css">
        .auto-style3 {
            height: 24px;
        }
        .auto-style4 {
            height: 46px;
        }
        .auto-style5 {
            height: 24px;
            width: 120px;
        }
        .auto-style6 {
            height: 24px;
            width: 539px;
        }
        .auto-style9 {
            width: 996px;
            height: 700px;
            background-color: white;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="notice_background">
        <div class="auto-style9">
            <asp:FormView ID="notice_read_FV" runat="server" DataKeyNames="seq" DataSourceID="SqlDataSource1" Width="800px" BackColor="White" BorderColor="White" BorderWidth="2px" >
            <EditItemTemplate>
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                <asp:TextBox ID="wDateTextBox" runat="server" Text='<%# Bind("wDate") %>' />
                <asp:TextBox ID="hitTextBox" runat="server" Text='<%# Bind("hit") %>' />
                <asp:TextBox ID="bodyTextBox" runat="server" Text='<%# Bind("body") %>' />
            </EditItemTemplate>
            <InsertItemTemplate>
                userID:
                <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                <br />
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                body:
                <asp:TextBox ID="bodyTextBox" runat="server" Text='<%# Bind("body") %>' />
                <br />
                hit:
                <asp:TextBox ID="hitTextBox" runat="server" Text='<%# Bind("hit") %>' />
                <br />
                wDate:
                <asp:TextBox ID="wDateTextBox" runat="server" Text='<%# Bind("wDate") %>' />
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="notice_read_table">
                    <tr>
                        <td colspan="3" class="auto-style4" style="border-style: none">
                            <asp:Label ID="titleLabel" runat="server" style="font-weight: 700; font-size: x-large" Text='<%# Bind("title") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5" style="border-style: none">
                            <asp:Label ID="userIDLabel" runat="server" style="color: #808080" Text='<%# Bind("userID") %>' />
                        </td>
                        <td class="auto-style6" style="border-style: none">
                            &nbsp;
                            <asp:Label ID="wDateLabel" runat="server" style="color: #808080" Text='<%# Bind("wDate") %>' />
                        </td>
                        <td class="auto-style3" style="border-style: none"> 
                            &nbsp;&nbsp; 
                            <asp:Label ID="hitLabel" runat="server" Text='<%# Bind("hit") %>' style="color: #808080" />
                        </td>
                    </tr>
                </table>
                <hr class="not_hr1" />
                <asp:Label ID="bodyLabel" runat="server" Text='<%# Bind("body") %>' />
                <hr class="not_hr2" />
            </ItemTemplate>
        </asp:FormView>
            <br />
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" SelectCommand="SELECT * FROM [notice]"></asp:SqlDataSource>  
        </div>
    </div>
</asp:Content>

