<%@ Page Title="" Language="C#" MasterPageFile="/MasterPage_main.master" AutoEventWireup="true" CodeFile="noticeList.aspx.cs" Inherits="noticeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="/css/notice.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="notice_background">
        <div class="notice_contain">
            <h2>공지사항</h2>
            <hr />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"  AutoGenerateColumns="False" DataKeyNames="seq" DataSourceID="SqlDataSource1" CssClass="Grid">
            <Columns>
                <asp:BoundField DataField="seq" HeaderText="번호" InsertVisible="False" ReadOnly="True" SortExpression="seq">
                    <HeaderStyle Width="60px" CssClass="gHeader" />
                </asp:BoundField>
                <asp:BoundField DataField="title" HeaderText="제목" SortExpression="title">
                    <HeaderStyle Width="120px" CssClass="gHeader" />
                </asp:BoundField>
                <asp:BoundField DataField="userID" HeaderText="작성자" SortExpression="userID">
                    <HeaderStyle Width="80px" CssClass="gHeader" />
                </asp:BoundField>
                <asp:BoundField DataField="wDate" HeaderText="작성일" SortExpression="wDate">
                    <HeaderStyle Width="80px" CssClass="gHeader" />
                </asp:BoundField>
                <asp:BoundField DataField="hit" HeaderText="조회" SortExpression="hit">
                    <HeaderStyle Width="60px" CssClass="gHeader" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" 
                SelectCommand="SELECT [seq], [userID], [title], [body], [hit], [wDate] FROM [notice]">
            </asp:SqlDataSource>
            <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" ImageUrl="~/Images/btn_write.png" PostBackUrl="~/MasterOnly/noticeWrite.aspx" />
            <br />
        </div>
    </div>
</asp:Content>

