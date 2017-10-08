<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_sub.master" AutoEventWireup="true" CodeFile="Event.aspx.cs" Inherits="Event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
    <style type="text/css">
        .auto-style1 {
            width:100%;
            height:30px;
            margin-left:10px
        }
        .auto-style2{
            width:25px;
            height:29px;
            margin:auto;
            padding-right:15px;
        }
        .auto-style4 {
            height: 17px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="article_wrap">
        <div class="e_article">
            <div class="event">
                <div class ="e_banner_wrap">
                    <ul class ="bxslider">
                        <li class="event_01"></li>
                        <li class="event_02"></li>
                        <li class="event_03"></li>
                    </ul>
            </div>   
        </div>  
        <div class="tabmenuWrap">	
            <div class="tabmenu">  
                    <ul class="menu1">
                        <li><div id="tab0" runat="server" style="padding:0 20px 0 10px;cursor: pointer;">
                            <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Images/all.png" />
                            </div>
                        </li>
                        <li><div id="tab1"  style="padding:0 20px 0 10px;cursor: pointer;">
                            <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/Images/medical.png" OnClick="ImageButton3_Click" />
                            </div>
                        </li>
                        <li><div id="tab2" style="padding:0 20px 0 10px;cursor: pointer;">
                             <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/Images/beauty.png" OnClick="ImageButton4_Click" />
                            </div>
                        </li>
                        <li><div id="tab3" style="padding:0 20px 0 10px;cursor: pointer;">
                            <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl="~/Images/goods.png" OnClick="ImageButton5_Click" />
                            </div></li>
                        <li><div id="tab4" style="padding:0 20px 0 10px;cursor: pointer;">
                            <asp:ImageButton ID="ImageButton6" runat="server" ImageUrl="~/Images/hotel.png" OnClick="ImageButton6_Click" />
                            </div>
                        </li>       
                    </ul>
            </div>
            <div class="tab_content">
                 <div id="tab_0" style="width: 100%; display: block;">
                     <asp:DataList ID="DataList1" runat="server" DataKeyField="seq" RepeatColumns="3" CellSpacing="15" BackColor="White">
                         <ItemTemplate>
                             <div class="main_wrap">
                          <a href="hot_detail.aspx?seq=<%#Eval("seq")%>">
                                 <div id="main_image">
                                     <asp:Image ID="Image1" runat="server" Height="310px" Width="310px" ImageUrl='<%# "~/Event/" + Eval("fName") %>' />
                                 </div>
                             </a>
                             <br />
                             <table class="auto-style1">
                                 <tr>
                                     <td>
                                         <asp:Label ID="title1Label" runat="server" Text='<%# Eval("title1") %>' style="font-size: 10pt; color: #999999;" />
                                     </td>
                                     <td rowspan="2" class="auto-style2">
                                         <asp:ImageButton ID="rec_btn" runat="server" ImageUrl="~/Coupon/heart_1.png" OnClick="rec_btnClick" />
                                     </td>
                                 </tr>
                                 <tr>
                                     <td class="auto-style4">
                                         <asp:Label ID="title2Label" runat="server" Text='<%# Eval("title2") %>' style="font-size: 11pt; font-weight: 700;" />
                                     </td>
                                 </tr>
                             </table>
                             <div id="coupon">
                                 <div id="cName">
                                    <asp:Label ID="cNameLabel" runat="server" style="font-weight: 700; font-size: 11pt" Text='<%# Eval("cName") %>' />
                                 </div>
                             </div>
                             </div>
                         </ItemTemplate>
                     </asp:DataList>
                    
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>"
                         SelectCommand="SELECT * FROM [Hotdeal] join [pfile] on Hotdeal.seq = pfile.tseq"></asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" SelectCommand="select * from Hotdeal join [pfile] on Hotdeal.seq = pfile.tseq where category='진료비';"></asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" SelectCommand="select * from Hotdeal join [pfile] on Hotdeal.seq = pfile.tseq where category='미용';"></asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" SelectCommand="select * from Hotdeal join [pfile] on Hotdeal.seq = pfile.tseq where category='용품';"></asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" SelectCommand="select * from Hotdeal join [pfile] on Hotdeal.seq = pfile.tseq where category='호텔';"></asp:SqlDataSource>
                    
                 </div>
            </div>
        </div>
        </div>
        </div>
</asp:Content>

