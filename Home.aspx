<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_main.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
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
                        <li><span onclick="ShowTab1('0')" style="cursor: pointer;">의학</span></li>
                        <li><span onclick="ShowTab1('1')" style="cursor: pointer;">생활</span></li>    
                    </ul>
            </div>
            <div class="tab_content">
                 <div id="tab_0" style="width: 100%; margin-top:10px; display: block;">
                     <a href="Weekly.aspx"><div class="w_con_1" >
                         <img src="Images/w_con_1.png" style="width:650px"/>
                         <asp:Image ID="Image2" runat="server" />
                         <div class="w_title">
                             <p class="s_txt">우리집사님건강괜찮을까?</p>
                             <p class="title_1">고양이 건강 주의보 TOP10</p>
                         </div>
                     </div></a>

                     <a href="Weekly.aspx"><div class="w_con_wrap">
                         <div class="w_con_2">
                             <img src="Images/w_con_2.png" />                            
                         </div>
                         <p class="w_title_2">강아지 출산과 관련정보 TOP10</p>
                     </div></a>

                     <a href="Weekly.aspx"><div class="w_con_wrap_1">
                         <div class="w_con_3">
                             <asp:Image ID="Image1" runat="server" />
                             <!--<img src="Images/w_con_3.png" />   -->                       
                         </div>
                         <p class="w_title_3">반려동물 좋은 병원 고르는 방법</p>  
                    </div></a>
                 </div>
                 <div id="tab_1" style="width: 100%; display: none;">
                    <a href="Weekly.aspx"><div class="w_con_1">
                        <!--<asp:Image ID="Image4" runat="server" />  -->
                     <img src="Images/w_con_4.png" />
                     <div class="w_title">
                         <p class="s_txt">반려동물 들이 친구들과 친하게 지낼 수 있을까?</p>
                         <p class="title_1">올바른 개 친구 사귀는 법</p>
                     </div>
                 </div></a>
                    <a href="Weekly.aspx"><div class="w_con_wrap">
                     <div class="w_con_2">
                         <asp:Image ID="Image6" runat="server" />
                         <!--<img src="Images/w_con_5.png" /> -->                                
                     </div>
                     <p class="w_title_2">햄스터 배변통 악취 없애는 법</p>
                 </div></a>
                    <a href="Weekly.aspx"><div class="w_con_wrap_1">
                     <div class="w_con_3">
                         <asp:Image ID="Image5" runat="server" />
                         <img src="Images/w_con_6.png" />                                
                     </div>
                     <p class="w_title_3">반려동물별 사료 추천 BEST3</p>  
                </div></a>
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
                        <li>핫딜</li>
                        <li><span onclick="ShowTab('2')" style="cursor: pointer;">진료비</span></li>
                        <li><span onclick="ShowTab('3')" style="cursor: pointer;">용품</span></li>
                        <li><span onclick="ShowTab('4')" style="cursor: pointer;">미용</span></li>
                        <li><span onclick="ShowTab('5')" style="cursor: pointer;">호텔</span></li>       
                    </ul>
            </div>
            <div class="tab_content">
                <div id="tab_2" style="width: 100%; display: block;">
                     <a href="Event.aspx"><div class="h_con_wrap">
                         <div class="h_con_2">
                             <img src="Images/h_con_1.png" />                                
                         </div>
                         <p class="h_title_2">강아지 습진, 물집 발 치료</p>
                     </div></a>
                     <a href="Event.aspx"><div class="h_con_wrap_1">
                         <div class="h_con_2">
                             <img src="Images/h_con_2.png" />                                
                         </div>
                         <p class="h_title_2">관악구 고슴도치 치료전문</p>
                     </div></a>
                     <a href="Event.aspx"><div class="h_con_wrap_1">
                         <div class="h_con_2">
                             <img src="Images/h_con_3.png" />                                
                         </div>
                         <p class="h_title_2">강남 중성화 예약 10% 할인</p>
                     </div></a>
                     <a href="Event.aspx"><div class="h_con_wrap_1">
                         <div class="h_con_2">
                             <img src="Images/h_con_4.png" />                                
                         </div>
                         <p class="h_title_2">2개월 미만 무료 검진</p>
                     </div></a>
                 </div>
                <div id="tab_3" style="width: 100%; display: none;">
                     <a href="Event.aspx"><div class="h_con_wrap">
                         <div class="h_con_2">
                             <img src="Images/h_con_5.png" />                                
                         </div>
                         <p class="h_title_2">촬영모델시 무료파마</p>
                     </div></a>
                     <a href="Event.aspx"><div class="h_con_wrap_1">
                         <div class="h_con_2">
                             <img src="Images/h_con_6.png" />                                
                         </div>
                         <p class="h_title_2">유아견 상담시 발톱손질 무료</p>
                     </div><//a>
                     <a href="Event.aspx"><div class="h_con_wrap_1">
                         <div class="h_con_2">
                             <img src="Images/h_con_7.png" />                                
                         </div>
                         <p class="h_title_2">애견목욕 2만원</p>
                     </div></a>
                     <a href="Event.aspx"><div class="h_con_wrap_1">
                         <div class="h_con_2">
                             <img src="Images/h_con_8.png" />                                
                         </div>
                         <p class="h_title_2">마리 당 10%씩 추가 할인</p>
                     </div></a>
                 </div>
                <div id="tab_4" style="width: 100%; display: none;">
                     <a href="Event.aspx"><div class="h_con_wrap">
                         <div class="h_con_2">
                             <img src="Images/h_con_9.png" />                                
                         </div>
                         <p class="h_title_2">톱밥 5kg 구매시 + 2kg</p>
                     </div></a>
                     <a href="Event.aspx"><div class="h_con_wrap_1">
                         <div class="h_con_2">
                             <img src="Images/h_con_10.png" />                                
                         </div>
                         <p class="h_title_2">다이어트간식 10% 쿠폰 </p>
                     </div></a>
                     <a href="Event.aspx"><div class="h_con_wrap_1">
                         <div class="h_con_2">
                             <img src="Images/h_con_11.png" />                                
                         </div>
                         <p class="h_title_2">겨울 강아지옷 20% 쿠폰</p>
                     </div></a>
                     <a href="Event.aspx"><div class="h_con_wrap_1">
                         <div class="h_con_2">
                             <img src="Images/h_con_12.png" />                                
                         </div>
                         <p class="h_title_2">고양이 돌돌이 1+1</p>
                     </div></a>
                 </div>
                <div id="tab_5" style="width: 100%; display: none;">
                    <a href="Event.aspx"><div class="h_con_wrap">
                         <div class="h_con_2">
                             <img src="Images/h_con_13.png" />                                
                         </div>
                         <p class="h_title_2">초호화 애견호텔 명절할인</p>
                     </div></a>
                    <a href="Event.aspx"><div class="h_con_wrap_1">
                         <div class="h_con_2">
                             <img src="Images/h_con_14.png" />                                
                         </div>
                         <p class="h_title_2">강남구 호텔 두당 5%할인</p>
                     </div></a>
                    <a href="Event.aspx"><div class="h_con_wrap_1">
                         <div class="h_con_2">
                             <img src="Images/h_con_15.png" />                                
                         </div>
                         <p class="h_title_2">고양이 예약시 + 간식증정</p>
                     </div></a>
                    <a href="Event.aspx"><div class="h_con_wrap_1">
                         <div class="h_con_2">
                             <img src="Images/h_con_16.png" />                                
                         </div>
                         <p class="h_title_2">어플 예약시 8박 + 2박</p>
                     </div></a>
                 </div> 
            </div>
        </div>
        <!--hotdeal end--> 

    </div>    
</asp:Content>

