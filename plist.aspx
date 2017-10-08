<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_comu.master" AutoEventWireup="true" CodeFile="plist.aspx.cs" Inherits="plist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/plist.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="plist_wrap">
        <div class="phtoranking">
             <div class="phto_txt"><span class="phto_txt">포토랭킹 도전하세요!</span></div>
              
              <hr class="plist_line"/>
             <br />
            <div class="plist_datalist">
             <asp:DataList ID="plist_datalist" runat="server" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal" DataKeyField="seq" BackColor="White" BorderColor="White" BorderStyle="None" BorderWidth="2px" >
                 <ItemTemplate>
                     <a href="phoshow.aspx?seq=<%# Eval("seq") %>">
                     <asp:Image ID="Image1" runat="server" Height="200px" ImageUrl='<%# "~/photos/" + Eval("fName") %>' Width="240px" /><br />
                     <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' /><br />
                     <asp:Label ID="userIDLabel" runat="server" Text='<%# Eval("userID") %>' /><br />
                     <asp:Label ID="hitLabel" runat="server" Text='<%# Eval("hit") %>' />
                     <br />
                     <br />
                 </ItemTemplate>
             </asp:DataList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" SelectCommand="SELECT * FROM [petphoto]  "></asp:SqlDataSource>
                <div class="plist_btn">
                    <asp:ImageButton ID="wirte_btn" runat="server" ImageUrl="~/Images/write_bun.png"  PostBackUrl="~/MemberOnly/pwrite.aspx" />

                </div>
                
                <br />
        </div>

        </div>
    </div>
</asp:Content>

