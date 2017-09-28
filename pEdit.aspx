<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_comu.master" AutoEventWireup="true" CodeFile="pEdit.aspx.cs" Inherits="fEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/pwrite.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="comu_wrap">
        <div class="content">
            <div><span class="whirt_txt">글 수정</span></div>

            <table id="pwrite_table">
               
                <tr class="ptr">
                    <td class="ptit">
                        <p>메뉴</p>
                    </td>
                    <td class="ptd">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="30px">
                            <asp:ListItem>톡톡</asp:ListItem>
                            <asp:ListItem Selected="True">포토랭킹</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr class="ptr">
                    <td class="ptit">
                        <p>카테고리</p>
                    </td>
                    <td class="ptd">
                        <asp:DropDownList ID="DropDownList2" runat="server" Height="36px">
                            <asp:ListItem>얼짱펫</asp:ListItem>
                            <asp:ListItem>러브하우스</asp:ListItem>
                            <asp:ListItem>패션왕</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr class="ptr">
                    <td class="ptit">
                        <p>제목</p>
                    </td>
                    <td class="ptd">
                        <asp:TextBox ID="TextBox1" runat="server" BorderColor="#CCCCCC" BorderWidth="1px" Height="30px" Width="600px"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" ErrorMessage="[제목] 필수입력" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                 <tr class="ptr">
                    <td class="ptit">
                        <p>첨부파일</p>
                    </td>
                    <td class="ptd">
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        <asp:Label ID="Label3" runat="server"></asp:Label>
&nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CausesValidation="False">파일삭제</asp:LinkButton>
                    </td>
                </tr>

                <tr class="ptr">
                    <td class="ptit">
                        <p>이미지</p>
                    </td>
                    <td class="ptd">
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="298px" BorderColor="#CCCCCC" BorderWidth="1px" BackColor="White" Height="30px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None" ErrorMessage="[이미지] 필수첨부" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                    </td>
                </tr>

            </table>

        </div>
        <br />

        <br />
        <asp:TextBox ID="pwirte_textbox" runat="server" Height="500px" TextMode="MultiLine" Width="800px"></asp:TextBox>
         <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" Display="None" ErrorMessage="[내용] 필수입력" ControlToValidate="pwirte_textbox"></asp:RequiredFieldValidator>
         <hr class="pwrite_line" />

         <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ShowMessageBox="True" ShowSummary="False" />

         <div>
             <p id="txt">저작권을 확인하세요. 욕설과 비방, 상업적글이나 성인글, 반복적인 게시글 등은 신고 당하실 수 있습니다. 다시 한 번 확인 해주세요</p>
         </div>


         <div class="pwrite_btn2">  
          
          <asp:ImageButton ID="pcancel_btn" runat="server" ImageUrl="~/Images/write_cancle.png" CausesValidation="False" />
          <asp:ImageButton ID="pnext_btm" runat="server" ImageUrl="~/Images/pedit_btn.png" OnClick="pnext_btm_Click" />
           
         </div>
            
        


             
        

         <asp:Label ID="Label1" runat="server"></asp:Label>
            
        


             
        

    </div>
</asp:Content>

