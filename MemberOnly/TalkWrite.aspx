<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_comu.master" AutoEventWireup="true" CodeFile="TalkWrite.aspx.cs" Inherits="MemberOnly_TalkWrite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../css/Talk.css" type="text/css" rel="stylesheet"/>
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="comu_wrap">
        <div class="content">
            <div><span class="whirt_txt">글 쓰기</span></div>

            <table id="twrite_table">
               
                <tr class="ttr" style="display:none;">
                    <td class="ttit">
                        <p>메뉴</p>
                    </td>
                    <td class="ttd">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="30px">
                            <asp:ListItem>톡톡</asp:ListItem>
                            <asp:ListItem Selected="True">포토랭킹</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr class="ttr" style="display:none;">
                    <td >
                        <p>카테고리</p>
                    </td>
                    <td >
                        <asp:DropDownList ID="DropDownList2" runat="server" Height="36px">
                            <asp:ListItem>얼짱펫</asp:ListItem>
                            <asp:ListItem>러브하우스</asp:ListItem>
                            <asp:ListItem>패션왕</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr class="ttr">
                    <td class="ttit">
                        제목</td>
                    <td class="ttd">
                        <asp:TextBox ID="TextBox1" runat="server" BorderColor="#CCCCCC" BorderWidth="1px" Height="30px" Width="600px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="[제목] 필수입력"></asp:RequiredFieldValidator>
                    </td>
                </tr>


                <tr class="ttr">
                    <td class="ttit">
                        파일</td>
                    <td class="ttd">
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="298px" BorderColor="#CCCCCC" BorderWidth="1px" BackColor="White" Height="30px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="FileUpload1" Display="None" ErrorMessage="[이미지 첨부] 필수입력"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            </table>

        </div>
        <br />

        <br />
        <asp:TextBox ID="twirte_textbox" runat="server" Height="500px" TextMode="MultiLine" Width="800px"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="twirte_textbox" Display="None" ErrorMessage="[내용] 필수입력"></asp:RequiredFieldValidator>
         <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ShowMessageBox="True" ShowSummary="False" />
         <hr class="twrite_line" />

         <div>
             <p id="txt">저작권을 확인하세요. 욕설과 비방, 상업적글이나 성인글, 반복적인 게시글 등은 신고 당하실 수 있습니다. 다시 한 번 확인 해주세요</p>
         </div>


         <div class="twrite_btn2">  
          <asp:ImageButton ID="tcancel_btn" runat="server" ImageUrl="~/Images/write_cancle.png" PostBackUrl="~/Talklist.aspx" CausesValidation="False" />
          <asp:ImageButton ID="tnext_btm" runat="server" ImageUrl="~/Images/write_next.png" OnClick="pnext_btm_Click" />
           
         </div>
            
        


             
        

         <asp:Label ID="Label1" runat="server"></asp:Label>
            
        


             
        

    </div>

</asp:Content>

