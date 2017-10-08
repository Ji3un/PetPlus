<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Modify.aspx.cs" Inherits="Modify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="../css/join2.css"/>
    <link href="css/layout.css" type="text/css" rel="stylesheet" />
    <title></title>
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
        <br />
        <br />
        <div class="title">
             <h3 class="modify_tit">회원 정보 수정</h3>
            
        </div>
        <hr class="j_hr" />
        <table class="join_table">

            <tr class="id_table">
                    <td  class="id_textstyle" >
                        펫플러스 ID</td>
                    <td class="id_inputstyle">
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        <br />
                        </td>
            </tr><!--아이디 끝-->

            <tr class="br" >
                <td> </td>
                <td></td>
            </tr>

            <tr class="pwd_table">
                    <td class="pwd_textstyle">
                        비밀번호<br />
                        비밀번호 확인
                    </td>
                    <td class="pwd_inputstyle">
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
                <td></td>
            </tr>

            <tr class="name_table">
                    <td  class="name_textstyle" >
                        이름</td>
                    <td class="name_inputstyle" >
                        <asp:TextBox ID="name_input" runat="server"></asp:TextBox>
                        
                        <br />
                        <br />
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" Display="None" ErrorMessage="[이름] 필수입력" ControlToValidate="name_input"></asp:RequiredFieldValidator>
                    </td>
            </tr><!--이름 끝-->
       
            <tr class="br">
                <td> </td>
                <td></td>
            </tr>
            <tr class="rnumber_table">
                    <td  class="rnumber_textstyle">
                        주민번호 (앞자리+성별)
                    </td>
                    <td class="rnumber_inputstyle">

                        <asp:Label ID="Label3" runat="server"></asp:Label>&nbsp;&nbsp;&nbsp;
                        <p id="ㅡ">ㅡ</p>
                        <asp:Label ID="Label4" runat="server" Width="20px"></asp:Label>
                        <p id="f_rnumber">
                            
                            *&nbsp; *&nbsp; *&nbsp; *&nbsp; *&nbsp; *</p> 
                        </td>
            </tr><!--주민번호 끝-->

            <tr class="br">
                <td> </td>
                <td></td>
            </tr>
            <tr class="pnumber_table">
                    <td  class="pnumber_textstyle">
                        휴대폰번호
                    </td>
                    <td class="pnumber_inputstyle">
                       
                        <asp:TextBox ID="pnumber_input" runat="server" Width="400px" Height="30px"></asp:TextBox>

                        <br />
                        <br />

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="None" ErrorMessage="[휴대폰번호] 필수입력" ControlToValidate="pnumber_input"></asp:RequiredFieldValidator>

                    </td>
                    
             </tr><!--휴대폰번호 끝-->

            <tr class="br" >
                <td> </td>
                <td></td>
            </tr>
             <tr class="email_table">
                    <td  class="email_textstyle">
                        이메일
                    </td>
                    <td class="email_inputstyle">  
                        <asp:TextBox ID="email_input" runat="server" ValidationGroup="email" Height="30px" Width="398px"></asp:TextBox>
                        
                        <br />
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="email_input" Display="None" ErrorMessage="[이메일] 필수 입력"></asp:RequiredFieldValidator>
                        </td>
             </tr><!--이메일 끝-->

             <tr class="agree_table">
                    <td  class="agree_style">
                       
                    </td>
                    <td class="agree_inputstyle"> 
                         
                         
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
                <td></td>
            </tr>
             <tr class="animal_table">
                    <td class="animal_textstyle">
                        동물유무
                    </td>
                    <td class="br">
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
                 
                 <asp:Button ID="nextb" runat="server" Text="정보수정" OnClick="nextb_Click1" />
                 
             </div>

    </div><!--article 끝-->
            <hr class="f_hr" />
            <!--footer 시작-->
            <div class="footer" data-position="fixed">
                 <div class="footer_txt">
                    <img  src="/Images/footerlogo.png" />
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
            
        </div>
    </form>
</body>
</html>
