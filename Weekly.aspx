<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_sub.master" AutoEventWireup="true" CodeFile="Weekly.aspx.cs" Inherits="Weekly" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="/css/Weekly.css"/>
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
               <div class="weeklybtn"> <asp:ImageButton ID="allbtn" runat="server" ImageUrl="~/Images/weekallbtn.png" /> </div>
               <div class="weeklybtn"> <asp:ImageButton ID="illbtn" runat="server" ImageUrl="~/Images/weekillbtn.png" /> </div>
               <div class="weeklybtn"> <asp:ImageButton ID="prevbtn" runat="server" ImageUrl="~/Images/weekillbtn.png" /> </div>
               <div class="weeklybtn"> <asp:ImageButton ID="healthbtn" runat="server" ImageUrl="~/Images/weekillbtn.png" /> </div>
               <div class="weeklybtn"> <asp:ImageButton ID="beautybtn" runat="server" ImageUrl="~/Images/weekillbtn.png" /> </div>
               <div class="weeklybtn"> <asp:ImageButton ID="newbtn" runat="server" ImageUrl="~/Images/weekillbtn.png" /> </div>
               <div class="weeklybtn"> <asp:ImageButton ID="bestbtn" runat="server" ImageUrl="~/Images/weekillbtn.png" /> </div>
               <div class="weeklybtn"><asp:ImageButton ID="recobtn" runat="server" ImageUrl="~/Images/weekillbtn.png" />  </div>
               
              
              
              
              
              
               
            </div><!--메뉴끝-->
       </div><!--주간펫 weekly_con 끝-->   
        <div class="weekly_content">
                <a href="#">
                 <div class="weekmain1" >
                     <a href="Weekly_detail.aspx?seq=<%# Eval("seq") %>">
                    <asp:Image ID="Image1" runat="server" Height="272px" Width="485px" />
                    <div class="week_title">
                        <asp:Label ID="Label1" runat="server" Text="고양이 건강 주의보"></asp:Label>   
                    </div>
                 </div> 
                </a>

                <div class="week1">
                    <asp:Image ID="Image2" runat="server" Height="190px" Width="236px" />
                    <div>
                        <asp:Label ID="Label2" runat="server" Text="고양이 건강 주의보"></asp:Label><br /><br /><br />
                        <asp:Label ID="Label17" runat="server"></asp:Label>명이 봤어요
                    </div>
                </div>

                <div class="week2">
                    <asp:Image ID="Image3" runat="server" Height="190px" Width="236px" />
                    <div>
                        <asp:Label ID="Label3" runat="server" Text="고양이 건강 주의보"></asp:Label><br /><br /><br />
                        <asp:Label ID="Label16" runat="server"></asp:Label>명이 봤어요
                    </div>
                </div>

               <div class="week3">
                    <asp:Image ID="Image4" runat="server" Height="190px" Width="236px" />
                    <div>
                        <asp:Label ID="Label4" runat="server" Text="고양이 건강 주의보"></asp:Label>
                    </div>
                </div>

               <div class="week4">
                    <asp:Image ID="Image5" runat="server" Height="190px" Width="236px" />
                    <div>
                        <asp:Label ID="Label5" runat="server" Text="고양이 건강 주의보"></asp:Label>
                    </div>
                </div>

                <div class="week5">
                    <asp:Image ID="Image6" runat="server" Height="190px" Width="236px" />
                    <div>
                        <asp:Label ID="Label6" runat="server" Text="고양이 건강 주의보"></asp:Label>
                    </div>
                </div>

                <div class="week6">
                    <asp:Image ID="Image7" runat="server" Height="190px" Width="236px" />
                    <div>
                        <asp:Label ID="Label7" runat="server" Text="고양이 건강 주의보"></asp:Label>
                    </div>
                </div>

                <div class="weekmain1">
                     <asp:Image ID="Image8" runat="server" Height="272px" Width="485px" />
                     <div class="week_title">
                         <asp:Label ID="Label15" runat="server" Text="고양이 건강 주의보"></asp:Label>
                     </div>
                </div>

                <div class="week1">
                     <asp:Image ID="Image9" runat="server" Height="190px" Width="236px" />
                     <div>
                        <asp:Label ID="Label9" runat="server" Text="고양이 건강 주의보"></asp:Label>
                     </div>
                </div>

                <div class="week2">
                    <asp:Image ID="Image10" runat="server" Height="190px" Width="236px" />
                    <div>
                        <asp:Label ID="Label10" runat="server" Text="고양이 건강 주의보"></asp:Label>
                    </div>
                </div>

               <div class="week3">
                    <asp:Image ID="Image11" runat="server" Height="190px" Width="236px" />
                    <div>
                        <asp:Label ID="Label11" runat="server" Text="고양이 건강 주의보"></asp:Label>
                    </div>
                </div>

               <div class="week4">
                     <asp:Image ID="Image12" runat="server" Height="190px" Width="236px" />
                    <div>
                        <asp:Label ID="Label12" runat="server" Text="고양이 건강 주의보"></asp:Label>
                    </div>
               </div>

               <div class="week5">
                    <asp:Image ID="Image13" runat="server" Height="190px" Width="236px" />
                    <div>
                        <asp:Label ID="Label13" runat="server" Text="고양이 건강 주의보"></asp:Label>
                    </div>
               </div>

               <div class="week6">
                   <asp:Image ID="Image14" runat="server" Height="190px" Width="236px" />
                   <div>
                      <asp:Label ID="Label14" runat="server" Text="고양이 건강 주의보"></asp:Label>
                   </div>
               </div>
  
        </div> <!--주간펫 컨텐츠 끝-->
    </div> <!--주간펫 wrap 끝-->   

</asp:Content>

