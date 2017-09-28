<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_comu.master" AutoEventWireup="true" CodeFile="Livecha.aspx.cs" Inherits="MemberOnly_Livecha" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="/css/Livecha.css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="livecha_container">
        <div class="livecha_article">
            <div class="livecha_tit">
                <h2>한줄 채팅</h2>
            </div>
            <hr />

       

        <asp:DataList ID="DataList1" runat="server" DataKeyField="nID" DataSourceID="SqlDataSource1" Width="912px" OnDeleteCommand="DataList1_DeleteCommand" OnItemDataBound="DataList1_ItemDataBound" BorderStyle="Solid" BorderColor="White" BorderWidth="1px">
            <ItemTemplate>
                &nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="~/Images/bul1.gif" />
                &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                님:&nbsp; <asp:Label ID="Label2" runat="server" Text='<%# GetContent(Eval("content")) %>'></asp:Label>
                &nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("nDate", "{0:yy.MM.dd HH:mm}") %>' />
                &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" CommandArgument='<%# Eval("nID") %>'>삭제</asp:LinkButton>
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" SelectCommand="SELECT * FROM [petNote] ORDER BY [nID] DESC"></asp:SqlDataSource>
        <br />
        <hr />

       <div class="ccheck">
                    <asp:TextBox ID="TextBox1" runat="server" Width="786px" BackColor="White" BorderColor="Gray" BorderWidth="1px" Height="76px"></asp:TextBox>
                    &nbsp;<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/arrow.gif" OnClick="ImageButton1_Click" Height="20px" Width="30px" />
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="20px" ImageUrl="~/Images/save.gif" OnClick="ImageButton2_Click" Width="60px" />
        
       </div>
                    
        </div>
    </div>
</asp:Content>


