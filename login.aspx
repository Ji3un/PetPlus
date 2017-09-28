<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/Login.css" type="text/css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrap">
            <!--header 시작-->       
            <div class="header">       
                <a href="/Home.aspx"><div class="logo"></div></a>
            </div>
            <hr class="nt_line" />
            <!--header 끝-->
           
            <!--article 시작-->
            <div class="article" >
                 <div class="Login">
                   
                     <asp:TextBox ID="UserID" runat="server" placeholder="아이디"></asp:TextBox>
                     
                     <asp:TextBox ID="Password" runat="server" placeholder="비밀번호" TextMode="Password"></asp:TextBox>
                    
                     <asp:Button ID="lbtn" runat="server" Text="로그인" OnClick="lbtn_Click" />

                     <div class="lcheck">
                         <asp:CheckBox ID="idsave" runat="server"  />아이디 저장
                         <asp:CheckBox ID="idkeep" runat="server" />로그인상태유지
                     </div>
                     
                     <hr class="nf_line" />
                    
                     <div class="Login_txt">
                         <a href="join1.aspx" class="Login_txt_join">회원가입&nbsp; |&nbsp;  </a>
                         <a href="#"> 아이디찾기&nbsp; |&nbsp;  </a>
                         <a href="#">비밀번호찾기 </a>
                     </div>
                         
                          
                     
                 </div>
                    <div class="ad">
                    <a href="#"><img src="Images/login_ad.png" /></a>
                    </div>
            
                
            </div>
            <!--article 끝-->
            <!--footer 시작-->
            <hr class="nt_line" />
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
                       ㈜ 펫플러스(Pet_Plus) COPYRIGHT ⓒ 2017  PETAH ALL RIGHTS RESERVED.
                    </p>
                </div>
            </div>
            <!--footer 끝-->
        </div>
    </form>
</body>
</html>
