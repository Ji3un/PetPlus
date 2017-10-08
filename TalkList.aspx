<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_comu.master" AutoEventWireup="true" CodeFile="TalkList.aspx.cs" Inherits="TalkList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/TalkList.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="TalkWrap">
        <div class="Talk_Con">
             
        <br />
            <h2>게시판상세보기</h2>
            <hr />
            <br />
            <div ;="" class="textview_text1">
                전체글
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </div>
            <div ;="" class="textview_text2">
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="auto-style1" ForeColor="Black">최신순</asp:LinkButton>
                &nbsp;
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="auto-style1" ForeColor="Black">조회순</asp:LinkButton>
            </div>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True"  AutoGenerateColumns="False" DataKeyNames="seq" DataSourceID="SqlDataSource1" CssClass="Grid">
            <Columns>
                <asp:BoundField DataField="seq" HeaderText="번호" InsertVisible="False" ReadOnly="True" SortExpression="seq">
                <HeaderStyle Width="60px" CssClass="gHeader" HorizontalAlign="Center" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="제목" SortExpression="title">                    
                    <ItemTemplate>
                        <%# ShowDepth((int)Eval("depth")) %>
                        <%# ShowReplyIcon((int)Eval("inner_id")) %>
                        <%# ShowTitle( Eval("seq").ToString(), Eval("title").ToString(), Eval("deleted").ToString()) %>
                    </ItemTemplate>
                    <HeaderStyle Width="330px" CssClass="gHeader" />
                    <ItemStyle HorizontalAlign="Left"  />
                </asp:TemplateField>
                <asp:BoundField DataField="userID" HeaderText="작성자" SortExpression="userID">
                <HeaderStyle Width="120px" CssClass="gHeader" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="tDate" DataFormatString="{0:yyyy_MM-dd}" HeaderText="작성" SortExpression="tDate">
                <HeaderStyle Width="120px" CssClass="gHeader" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="hit" HeaderText="조회" SortExpression="hit">
                <HeaderStyle Width="40px" CssClass="gHeader" />
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" SelectCommand="SELECT [seq], [userID], [title], [body], [ref_id], [inner_id], [depth], [hit], [tDate], [deleted] FROM [Talk] ORDER BY [ref_id] DESC, [inner_id]"></asp:SqlDataSource>
            <br />
            <br />
            <br />
            <div class="textview_button">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/write_bun.png" PostBackUrl="~/MemberOnly/TalkWrite.aspx" />
            </div>
        <br />
            <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        
        </div>
    </div>
</asp:Content>

