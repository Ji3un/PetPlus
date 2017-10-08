<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_sub.master" AutoEventWireup="true" CodeFile="Weeklymain.aspx.cs" Inherits="Weekly" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/Weeklymail.css"/>
    <link rel="stylesheet" type="text/css" href="css/jquery.simplyscroll.css"/>
    <script type='text/javascript' src="js/jquery.marquee.min.js"></script>
 <script type='text/javascript' src="js/jquery.simplyscroll.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="w_wrap">
       <div class="weekly_con">
             <div class="marquee">
                 <ul id="scroller">
                  <li>강아지 비만도 검사 무료 실시중 입니다.|강아지 비만도 검사 무료 실시중 입니다.강아지 비만도 검사 무료 실시중 입니다. </li>
                 </ul>
                 <script>
                     $(function() {   
                         $('#scroller').simplyScroll();
                     });
                 </script>
             </div> <!--공지끝-->

          
           <div class="weekly_menu">
               <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/MasterOnly/mWrite.aspx">기글쓰</asp:LinkButton>
               <div class="weeklybtn"> <asp:ImageButton ID="allbtn" runat="server" ImageUrl="~/Images/weekallbtn.png" OnClick="allbtn_Click" /> </div>
               <div class="weeklybtn"> <asp:ImageButton ID="illbtn" runat="server" ImageUrl="~/Images/weekillbtn.png" OnClick="illbtn_Click" /> </div>
               <div class="weeklybtn"> <asp:ImageButton ID="prevbtn" runat="server" ImageUrl="~/Images/weekillbtn.png" OnClick="prevbtn_Click" /> </div>
               <div class="weeklybtn"> <asp:ImageButton ID="healthbtn" runat="server" ImageUrl="~/Images/weekillbtn.png" OnClick="healthbtn_Click" /> </div>
               <div class="weeklybtn"> <asp:ImageButton ID="beautybtn" runat="server" ImageUrl="~/Images/weekillbtn.png" OnClick="beautybtn_Click" /> </div>
               <div class="weeklybtn"> <asp:ImageButton ID="newbtn" runat="server" ImageUrl="~/Images/weekillbtn.png" OnClick="newbtn_Click" /> </div>
               <div class="weeklybtn"> <asp:ImageButton ID="bestbtn" runat="server" ImageUrl="~/Images/weekillbtn.png" OnClick="bestbtn_Click" /> </div>
               <div class="weeklybtn"><asp:ImageButton ID="recobtn" runat="server" ImageUrl="~/Images/weekillbtn.png" OnClick="recobtn_Click" />  </div>
               
              
              
               
               
              
               
            </div><!--메뉴끝-->
       </div><!--주간펫 weekly_con 끝-->   
        <div class="weekly_content">
               
                <asp:DataList ID="wcon1" runat="server" CellSpacing="10" DataKeyField="seq" DataSourceID="SqlDataSource1" RepeatColumns="4" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="weekdiv">
                        <a href="Weekly_detail.aspx?seq=<%# Eval("seq") %>">
                        <asp:Image ID="Image1" runat="server" Height="190px" Width="236px" ImageUrl='<%# "~/Weekly/" + Eval("fname") %>'/>
                        <br />                                                                                                                                                  
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' style="font-weight: 700" />
                        <br />
                        <br />
                        <asp:Label ID="hitLabel" runat="server" Text='<%# Eval("hit") %>' />
                        명이 봤어요<br />
                            </div>
                    </ItemTemplate>
                </asp:DataList>
                 
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="select w.seq,title,hit,fname from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) order by hit desc;">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="select w.seq,title,hit,fname from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) and category = '질병' order by hit desc;">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="select w.seq,title,hit,fname from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) and category = '예방' order by hit desc;">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="select w.seq,title,hit,fname from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) and category = '뷰티' order by hit desc;">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="select w.seq,title,hit,fname from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) and category = '헬스' order by hit desc;">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="select w.seq,title,hit,fname from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) order by hit desc;">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" OldValuesParameterFormatString="original_{0}" 
                    SelectCommand="select w.seq,title,hit,fname from Weekly w join pfile p on w.seq = p.tseq where p.seq in (select min(seq) from pfile group by tseq) order by hit desc;">
                </asp:SqlDataSource>

                 
                <br />
                 
        </div> <!--주간펫 컨텐츠 끝-->
    </div> <!--주간펫 wrap 끝-->   

</asp:Content>

