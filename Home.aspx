<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_main.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="/css/Main.css"/>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="advert_wrap">
       <ul class="bxslider2">
          <li class="banner_01"></li>
          <li class="banner_02"></li>
          <li class="banner_03"></li>
        </ul>
    </div>
    <div class="h_wrap">
        <table class="quick_btn">
            <tr>
                <th colspan="2">
                    <span class="btn_title">병원찾기</span>
                </th>
            </tr>
            <tr>
                <td><asp:ImageButton ID="beauty_btn" runat="server" onclick="beauty_btn_ServerClick" ImageUrl="~/Images/beauty_btn.png" Height="40px" ImageAlign="Middle" PostBackUrl="~/H_Search.aspx" Width="40px"/><p>애완미용</p></td>
                <td class="auto-style1"><asp:ImageButton id="hotel_btn" runat="server" onclick="hotel_btn_ServerClick" ImageUrl="~/Images/hotel_btn.png" Height="40px" ImageAlign="Middle" PostBackUrl="~/H_Search.aspx" Width="40px"/><p>애완호텔</p></td>
            </tr>
            <tr>
                <td><asp:ImageButton id="cat_btn" runat="server" onclick="cat_btn_ServerClick" ImageUrl="~/Images/cat_btn.png" Height="40px" ImageAlign="Middle" PostBackUrl="~/H_Search.aspx" Width="40px"/><p>고양이전문</p></td>
                <td class="auto-style1"><asp:ImageButton id="extra_btn" runat="server" onclick="extra_btn_ServerClick" ImageUrl="~/Images/extra_btn.png" Height="40px" ImageAlign="Middle" PostBackUrl="~/H_Search.aspx" Width="40px"/><p>특수동물</p></td>
            </tr>
            <tr>
                <td><asp:ImageButton id="t24_btn" runat="server" onclick="t24_btn_ServerClick" ImageUrl="~/Images/T24_btn.png" Height="40px" ImageAlign="Middle" PostBackUrl="~/H_Search.aspx" Width="40px"/><p>24시</p></td>
                <td class="auto-style1"><asp:ImageButton id="emergency_btn" runat="server" onclick="emergency_btn_ServerClick" ImageUrl="~/Images/emergency_btn.png" Height="40px" ImageAlign="Middle" PostBackUrl="~/H_Search.aspx" Width="40px"/><p>응급실</p></td>
            </tr>
            <tr>
                <td><asp:ImageButton id="prevention_btn" runat="server" onclick="prevention_btn_ServerClick" ImageUrl="~/Images/prevention_btn.png" Height="40px" ImageAlign="Middle" PostBackUrl="~/H_Search.aspx" Width="40px"/><p>예방과</p></td>
                <td class="auto-style1"><asp:ImageButton id="pregnancy_btn" runat="server" onclick="pregnancy_btn_ServerClick" ImageUrl="~/Images/pregnancy_btn.png" Height="40px" ImageAlign="Middle" PostBackUrl="~/H_Search.aspx" Width="40px"/><p>산과</p></td>
            </tr>
         </table>
        <!--weekly start-->        
         <div class="Weekly">	
            <div class="tabmenu">  
                    <ul class="menu1">
                        <li>주간펫+</li>
                        <li><asp:Button ID="Button6" runat="server" Text="의학" BackColor="#FFFFFF" BorderStyle="None" Font-Bold="True" OnClick="Button6_Click" /></li>
                        <li><asp:Button ID="Button7" runat="server" Text="생활" BackColor="#FFFFFF" BorderStyle="None" Font-Bold="True" OnClick="Button7_Click" style="height: 17px" /></li>    
                    </ul>
            </div>
            <div class="tab_content">
                 <div id="tab_0" style="width: 100%; margin-top:10px; display: block;">
                     <a id="wcon1" runat="server">
                         <div class="w_con_1" >
                             <asp:Image ID="Image2" runat="server"  />
                             <div class="w_title">
                                 <p class="title_1">
                                     <asp:Label ID="Label2" runat="server" ></asp:Label></p>
                             </div>
                         </div>
                     </a>
                     <div class="wconwrap">
                        <asp:DataList ID="DataList2" runat="server" DataKeyField="seq" RepeatColumns="3" CssClass="DataLIst_wrap2" EditItemStyle-Wrap="False">
                         <AlternatingItemStyle BorderStyle="None" />  
                         <EditItemStyle Wrap="False" BorderStyle="None"></EditItemStyle>
                         <ItemStyle BorderStyle="None" CssClass="ditem" />
                         <ItemTemplate>
                          <div class="main_wrap" style="margin: 0 11px; border:none;">
                            <a href="Weekly_detail.aspx?seq=<%#Eval("seq")%>">
                                 <div id="main_image" >
                                     <asp:Image ID="Image1" runat="server" Height="170px" Width="226px"  ImageUrl='<%# "~/Weekly/" + Eval("fName") %>' />
                                 </div>
                             </a>
                             <a href="Weekly_detail.aspx?seq=<%#Eval("seq")%>">
                                 <asp:Label ID="title1Label" runat="server" style="font-size: 12pt;  margin:15px 0;" Text='<%# Eval("title") %>' />
                             </a>
                             <br />
                            </div>
                         </ItemTemplate>
                         <SeparatorStyle BorderStyle="None" />
                     </asp:DataList>                         
                     <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>"
                         SelectCommand="select w.seq,title,hit,fname from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) and category = '예방' order by hit desc;"></asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" 
                         SelectCommand="select w.seq,title,hit,fname from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) and category = '뷰티' order by hit desc;"></asp:SqlDataSource>
                    </div>
                 </div>
                  
            </div>
        </div>
        <!--weekly end--> 
        <!--subcon start-->
        <!--subcon end--> 
        <!--hotdeal start-->        
         <div class="Hotdeal">	
            <div class="tabmenu">  
                    <ul class="menu2">
                        <li><asp:Button ID="Button1" runat="server" Text="핫딜" BackColor="#DEDCDC" BorderStyle="None" Font-Bold="True" OnClick="Button1_Click" /></li>
                        <li><asp:Button ID="Button2" runat="server" Text="진료비" BackColor="#FFFFFF" BorderStyle="None" Font-Bold="True" OnClick="Button2_Click" /></li>
                        <li><asp:Button ID="Button3" runat="server" Text="용품" BackColor="#FFFFFF" BorderStyle="None" Font-Bold="True" OnClick="Button3_Click" /></li>
                        <li><asp:Button ID="Button4" runat="server" Text="미용" BackColor="#FFFFFF" BorderStyle="None" Font-Bold="True" OnClick="Button4_Click" /></li>
                        <li><asp:Button ID="Button5" runat="server" Text="호텔" BackColor="#FFFFFF" BorderStyle="None" Font-Bold="True" OnClick="Button5_Click" /></li>       
                    </ul>
            </div>
            <div class="tab_content">
                <div class="tab_content">
                 <div id="tab_2" style="width: 100%;"">
                     <asp:DataList ID="DataList1" runat="server" DataKeyField="seq" RepeatColumns="4" style="margin-right: 2px; " CssClass="DataLIst_wrap" EditItemStyle-Wrap="False">
                         <AlternatingItemStyle BorderStyle="None" />                            
                         <ItemStyle BorderStyle="None" CssClass="ditem" />
                         <ItemTemplate>
                          <div class="main_wrap" style="margin: 0 14px; border:none;">
                            <a href="hot_detail.aspx?seq=<%#Eval("seq")%>">
                                 <div id="main_image">
                                     <asp:Image ID="Image1" runat="server" Height="170px" Width="220px"  ImageUrl='<%# "~/Event/" + Eval("fName") %>' />
                                 </div>
                             </a>
                             <a href="hot_detail.aspx?seq=<%#Eval("seq")%>">
                                 <asp:Label ID="title1Label" runat="server" style="font-size: 12pt;  margin:15px 0;" Text='<%# Eval("title1") %>' />
                             </a>
                             <br />
                            </div>
                         </ItemTemplate>
                         <SelectedItemStyle BorderStyle="None" />
                     </asp:DataList>                    
                     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>"
                         SelectCommand="select * from Hotdeal h join pfile p on h.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) order by hit desc;"></asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>"
                         SelectCommand="SELECT * FROM [Hotdeal] join [pfile] on Hotdeal.seq = pfile.tseq where Hotdeal.category='진료비';"></asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" 
                         SelectCommand="SELECT * FROM [Hotdeal] join [pfile] on Hotdeal.seq = pfile.tseq where category='미용';"></asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" 
                         SelectCommand="SELECT * FROM [Hotdeal] join [pfile] on Hotdeal.seq = pfile.tseq where category='용품';"></asp:SqlDataSource>
                     <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" 
                         SelectCommand="SELECT * FROM [Hotdeal] join [pfile] on Hotdeal.seq = pfile.tseq where category='호텔';"></asp:SqlDataSource>
                    
                 </div>
            </div>
                
                
                 
            </div>
        </div>
        <!--hotdeal end--> 

    </div>    
</asp:Content>
