<%@ Page Title="" Language="C#" MasterPageFile="/MasterPage_main.master" AutoEventWireup="true" CodeFile="noticeList.aspx.cs" Inherits="noticeList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/notice.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="notice_background1">
        <div class="notice_contain1">
            <span class="notice_title2">공지사항</span>
            <hr class="notice_w_hr1"/>

            <div class="notice_gridV">
                <span class="notice_txt">전체글 <asp:Label ID="Label1" runat="server"></asp:Label></span>
                <div>
                    <asp:GridView ID="GridView21" runat="server" AllowPaging="True"  AutoGenerateColumns="False" DataKeyNames="seq" DataSourceID="SqlDataSource1" CssClass="GV1">
                        <Columns>
                            <asp:BoundField DataField="seq" HeaderText="번호" InsertVisible="False" ReadOnly="True" SortExpression="seq">
                                <HeaderStyle Width="30px" CssClass="gHeader" HorizontalAlign="Center" />
                                <ItemStyle Width="30px" HorizontalAlign="Center" Wrap="False"/>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="제목" SortExpression="title">
                                <ItemTemplate>
                                    <%# ShowTitle( Eval("seq").ToString(), Eval("title").ToString(), Eval("deleted").ToString()) %>
                                </ItemTemplate>
                                <HeaderStyle Width="200px" CssClass="gHeader" />
                                <ItemStyle Width="200px" HorizontalAlign="Left" Wrap="False"/>
                            </asp:TemplateField>
                            <asp:BoundField DataField="userID" HeaderText="작성자" SortExpression="userID">
                                <HeaderStyle Width="40px" CssClass="gHeader" />
                                <ItemStyle Width="40px" HorizontalAlign="Center" Wrap="False"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="wDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="작성일" SortExpression="wDate">
                                <HeaderStyle Width="40px" CssClass="gHeader" />
                                <ItemStyle Width="40px" HorizontalAlign="Center" Wrap="False"/>
                            </asp:BoundField>
                            <asp:BoundField DataField="hit" HeaderText="조회" SortExpression="hit">
                                <HeaderStyle Width="30px" CssClass="gHeader" />
                                <ItemStyle Width="30px" HorizontalAlign="Center" Wrap="False"/>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" 
                SelectCommand="SELECT [seq], [userID], [title], [body], [hit], [wDate], [deleted] FROM [notice] ORDER BY [seq] DESC">
            </asp:SqlDataSource>

            <div class="notice_w_btn2">
                    <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/write_bun.png" PostBackUrl="~/MasterOnly/noticeWrite.aspx" OnClick="ImageButton3_Click"  />
            </div>
        </div>
    </div>
</asp:Content>

