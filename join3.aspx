<%@ Page Language="C#" AutoEventWireup="true" CodeFile="join3.aspx.cs" Inherits="join3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/join3.css" type="text/css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="wrap">
         <div class="header">       
                <a href="#"><div class="logo"></div></a>
            </div>
            <hr class="nt_line" />
            <!--header 끝-->
       
           <!--article 시작-->
        <div class="article">
                <div class="tab">
            <span class="tabmenu_1">1 약관동의</span>&nbsp;
            <span class="tabmenu_2">2 정보입력</span>&nbsp;
            <span class="tabmenu_3">3 가입완료</span>
        </div>
        <br />
        <br />
        <div class="title">
             <h3 class="tit_join">회원 가입 완료</h3>
             <div class="tit_txt">회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능합니다. </div>
        </div>
            <hr class="j_hr" />
            <div class="joinend_content">
           <br />
                <br />
                <br />
                <h2 class="welcome">펫플러스의 회원이 되신 것을</h2>
                <h2 class="welcome">&nbsp;<span class="welcome2">환영합니다!</span></h2>
                <br />
                <br />
                <br />
                <br />
                <br />
            <br />
        </div><!--가입완료div끝-->
            <hr class="j_hr" />

             <div class="join_button">
                 <button runat="server" id="nextb" type="button" onserverclick="nextb_Click" >펫플러스 시작하기</button>
                 
             </div>

    </div><!--article 끝-->
            <hr class="nt_line" />


            <!--footer 시작-->
            <div class="footer" data-position="fixed">
                 <div class="footer_txt">
                    <img  src="Images/footerlogo.png" />
                    <ul>
                        <li><a href="#">웹소개 |</a></li>
                        <li><a href="#">공지사항 |</a></li>
                        <li><a href="#">이용약관 |</a></li>
                        <li><a href="#">고객센터 </a></li>
                    </ul>
                    <p class="f_txt">
                        서울특별시 종로구 필운대로 1길 34  ㈜ 펫플러스(Pet_Plus) COPYRIGHT ⓒ 2017  PETAH ALL RIGHTS RESERVED.
                    </p>
                </div>
            </div><!--footer 끝-->
            
        </div> <!--전체div 끝-->
    </form>
</body>
</html>
