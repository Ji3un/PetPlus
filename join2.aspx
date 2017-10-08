<%@ Page Language="C#" AutoEventWireup="true" CodeFile="join2.aspx.cs" Inherits="join2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="css/join2.css"/>
    <link href="css/layout.css" type="text/css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 30px;
            background-color: white;
            width: 493px;
        }
        .auto-style2 {
            width: 493px;
        }
        .auto-style3 {
            background-color: white;
            width: 493px;
        }
        .auto-style4 {
            height: 30px;
            background-color: white;
            padding-top: 10px;
            width: 493px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrap"><!--전체div 시작-->

            <!--header 시작-->       
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
             <h3 class="tit_join">가입 정보 입력</h3>
             <div class="tit_txt">회원정보를 입력해주세요. 모두 입력하셔야 가입이 가능합니다. </div>
        </div>
        <hr class="j_hr" />
        <table class="join_table">

            <tr class="id_table">
                    <td  class="id_textstyle" >
                        펫플러스 ID</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="300px"></asp:TextBox>
                        <asp:Button ID="overlap" runat="server" Text="중복확인" OnClick="overlap_Click" Width="100px" CausesValidation="False" Height="33px" />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="[아이디] 필수"></asp:RequiredFieldValidator>
                        </td>
            </tr><!--아이디 끝-->

            <tr class="br" >
                <td> </td>
                <td class="auto-style2"></td>
            </tr>

            <tr class="pwd_table">
                    <td class="pwd_textstyle">
                        비밀번호<br />
                        비밀번호 확인
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="pwd_input" runat="server" TextMode="Password" Height="30px" Width="400px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="pwd_input" Display="None" ErrorMessage="[비밀번호] 필수입력"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="pwdcheck_input" runat="server" TextMode="Password" Height="30px" Width="400px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pwdcheck_input" Display="None" ErrorMessage="[비밀번호확인] 필수"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="pwd_input" ControlToValidate="pwdcheck_input" Display="None" ErrorMessage="비밀번호가 일치하지 않습니다."></asp:CompareValidator>
                     </td>

            </tr><!--비밀번호 끝-->

            <tr class="br">
                <td> </td>
                <td class="auto-style2"></td>
            </tr>

            <tr class="name_table">
                    <td  class="name_textstyle" >
                        이름</td>
                    <td class="auto-style1" >
                        <asp:TextBox ID="name_input" runat="server"></asp:TextBox>
                        
                        <br />
                        <br />
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="None" ErrorMessage="[이름] 필수입력" ControlToValidate="name_input"></asp:RequiredFieldValidator>
                    </td>
            </tr><!--이름 끝-->
       
            <tr class="br">
                <td> </td>
                <td class="auto-style2"></td>
            </tr>
            <tr class="rnumber_table">
                    <td  class="rnumber_textstyle">
                        주민번호 (앞자리+성별)
                    </td>
                    <td class="auto-style1">

                        <asp:TextBox ID="rnumber_input" runat="server" Height="30px" ValidationGroup="rnumber" Width="145px"></asp:TextBox>&nbsp;<p id="ㅡ">ㅡ</p>
                       <asp:TextBox ID="gender_input" runat="server" Height="30px" ValidationGroup="rnumber" Width="40px"></asp:TextBox>
                        <p id="f_rnumber">
                            
                            *&nbsp; *&nbsp; *&nbsp; *&nbsp; *&nbsp; *</p> 
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="rnumber_input" Display="None" ErrorMessage="[주민번호] 필수 입력"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="gender_input" Display="None" ValidationExpression="[1-4]{1,1}">성별 입력</asp:RegularExpressionValidator>
                        </td>
            </tr><!--주민번호 끝-->

            <tr class="br">
                <td> </td>
                <td class="auto-style2"></td>
            </tr>
            <tr class="pnumber_table">
                    <td  class="pnumber_textstyle">
                        휴대폰번호
                    </td>
                    <td class="auto-style3">
                       
                        <asp:DropDownList ID="phon_select" runat="server">
                            <asp:ListItem value="010">010</asp:ListItem>
                            <asp:ListItem value="011">011</asp:ListItem>
                            <asp:ListItem value="016">016</asp:ListItem>
                            <asp:ListItem value="017">017</asp:ListItem>
                            <asp:ListItem value="018">018</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="pnumber_input" runat="server" Width="310px" Height="30px"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="None" ErrorMessage="[휴대폰번호] 필수입력" ControlToValidate="pnumber_input"></asp:RequiredFieldValidator>

                    </td>
                    
             </tr><!--휴대폰번호 끝-->

            <tr class="br" >
                <td> </td>
                <td class="auto-style2"></td>
            </tr>
             <tr class="email_table">
                    <td  class="email_textstyle">
                        이메일
                    </td>
                    <td class="auto-style1">  
                        <asp:TextBox ID="email_input" runat="server" ValidationGroup="email" Height="25px"></asp:TextBox>
                        
                        <p id="atmark">
                           
                            @ </p>
                           
                        <asp:DropDownList ID="email_select" runat="server" ValidationGroup="email">
                            <asp:ListItem  > 직접입력</asp:ListItem>
                            <asp:ListItem value="naver.com" > 네이버</asp:ListItem>
                            <asp:ListItem value="daum.net" > 다음</asp:ListItem>
                            <asp:ListItem  value="hotmail.com" > MSN</asp:ListItem>
                            <asp:ListItem value="nate.com" > 네이트</asp:ListItem>
                            <asp:ListItem value="yahoo.co.kr" > 야후</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="email_input" Display="None" ErrorMessage="[이메일] 필수 입력"></asp:RequiredFieldValidator>
                        </td>
             </tr><!--이메일 끝-->

             <tr class="agree_table">
                    <td  class="agree_style">
                       
                    </td>
                    <td class="auto-style4"> 
                         
                         
                         <asp:CheckBox ID="CheckBox1" runat="server" Checked="true"/>이벤트/정보 SMS수신 동의
                         <span class="choice">(선택)<br />
                         </span>
                        
                        &nbsp;<br />
                         <asp:CheckBox ID="CheckBox2" runat="server" Checked="true"/>이벤트/정보 이메일수신 동의
                        <span class="choice">(선택)</span>
                        
                        </td>
             </tr><!--sms,이메일 수신동의끝-->
            <tr class="br" >
                <td> </td>
                <td class="auto-style2"></td>
            </tr>
             <tr class="animal_table">
                    <td class="animal_textstyle">
                        동물유무
                    </td>
                    <td class="auto-style1">
                        &nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server" BorderColor="White" BorderStyle="Solid" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="유"></asp:ListItem>
                            <asp:ListItem Value="무"></asp:ListItem>
                        </asp:RadioButtonList>
                        </td>
              </tr><!--동물유무 끝-->
            </table><!--회원가입테이블 끝-->

        <hr class="j_hr" />

             <div class="join_button">
                 <asp:Label ID="Label1" runat="server"></asp:Label>
                 <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                 
                 <asp:Button ID="nextb" runat="server" Text="다음" OnClick="nextb_Click1" />
                 
             </div>

    </div><!--article 끝-->
            <hr class="f_hr" />
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
