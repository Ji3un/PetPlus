<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_comu.master" AutoEventWireup="true" CodeFile="List.aspx.cs" Inherits="MemberOnly_List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
            <link rel="stylesheet" type="text/css" href="../css/List.css" />
    <style type="text/css">
        .auto-style1 {
            font-size: small;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="comu_wrap" style="height:700px; background-color:#ffffff; text-align:left; font-size: medium;">
        <div class="content" style="border-style: none; border-color: inherit; border-width: medium; width:996px; height:931px; text-align:left; ">
            <div class="pet_list">
                <img src="../Images/pet_list.jpg" style="width:400px; height:300px;"/>
            </div>
                     <div class="list_logo">
                           <img src="../Images/list.png" />
                     </div>
            <br />
            <div class="list_content">

            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/write_btn.png" PostBackUrl="~/MemberOnly/Send.aspx" />
            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/delete_btn.png" OnClick="ImageButton2_Click" />
            <br />
            <asp:DataList ID="DataList1" runat="server" Width="353px" DataKeyField="msgID" BorderStyle="None">
                <ItemTemplate>
                    보낸이 :&nbsp;<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Send.aspx?userID=" + Eval("fromUser") %>' Text='<%# Eval("fromUser") %>'></asp:HyperLink>
                    &nbsp;<span class="auto-style1">[<asp:Label ID="Label2" runat="server" Text='<%# Eval("sDate", "{0:yyyy-MM-dd HH:mm}") %>'></asp:Label>
                    </span>]<br />내용 :&nbsp;<asp:Label ID="Label3" runat="server" Text='<%# Eval("content") %>'></asp:Label>
                    <br />
                </ItemTemplate>
            </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>"
                     SelectCommand="SELECT * FROM [Message]">
                   
                </asp:SqlDataSource>
            <br />
            </div>
        </div>
    </div>
</asp:Content>

