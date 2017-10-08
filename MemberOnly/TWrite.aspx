<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_main.master" AutoEventWireup="true" CodeFile="TWrite.aspx.cs" Inherits="MemberOnly_TalkWrite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <link rel="stylesheet" type="text/css" href="../css/write_cs.css"/>
      <script type="text/javascript" src="/js/jquery.MultiFile.js"></script>
      <script type="text/javascript">
          $(function () {
              $("#<%=FileUpload1.ClientID%>").MultiFile({
                  list: '#fileList',
                  STRING: {
                      remove: '<img src="/Images/delete_btn.png" style="height:18px;">',
                      selected: 'Selecionad: $file',
                      denied: '$ext 는(은) 업로드 할 수 없는 파일 확장자 입니다.',
                      duplicate:'$file 는(은) 이미 추가된 파일 입니다.'
                  }
              });
          });
      </script>
      <style type="text/css">
          .wButton1 {
          }
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="comu_wrap">
        <div class="content">
            <div><span class="whirt_txt">&nbsp;&nbsp; 톡톡 글쓰기</span></div>

            <table id="pwrite_table" style="border-style: none; margin-left:100px;" border="0">
               
         

                <tr class="ptr">
                    <td class="ptit">
                        <p style="margin-left:20px;">제목</p>
                    </td>
                    <td class="ptd">
                        <asp:TextBox ID="TextBox1" runat="server" BorderColor="#CCCCCC" BorderWidth="1px" Height="30px" Width="600px" style="text-align: left"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" ErrorMessage="[제목] 필수입력" ControlToValidate="TextBox1" style="color: #FF3300">*</asp:RequiredFieldValidator>
                        <br />
                    </td>
                </tr>


                 <tr class="ptr">
                    <td class="ptit">
                        <p style="margin-left:20px;">파일 선택</p>
                    </td>
                    <td class="ptd">
                     <asp:FileUpload ID="FileUpload1" AllowMultiple="true" runat="server" Width="298px" BorderColor="#FFFFFF" BorderWidth="1px" BackColor="White" Height="30px" />
                    </td>
                </tr>

                <tr class="ptr2">
                    <td class="ptit2" style="border-style: none">
                        <p style="margin-left:20px; text-align: left;">첨부파일</p>
                    </td>
                    <td class="ptd2" style="border-style: none;">
                        <br />
                        <asp:Button ID="wButton1" Text="파일 업로드" runat="server" OnClick="Button1_Click" CssClass="wButton1" BorderColor="White"  />
                         <div id="fileList" style="margin-left:10px; height:100px;">

                         </div>
                    </td>
                </tr>

                <tr class="ptr2">
                    <td class="ptit2" style="border-style: none">
                        <p style="margin-left:20px; text-align: left;">완료 파일</p>
                    </td>
                    <td class="ptd2" style="border-style: none">                        
                         <p style="border-style: none"><asp:label id="Label2" runat="server"></asp:label></p>
                    </td>
                </tr>

                <tr>
                    <td colspan="2">
                    <asp:TextBox ID="Twirte_textbox" runat="server" Height="500px" TextMode="MultiLine" Width="810px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="pwirte_textbox" Display="None" ErrorMessage="[내용] 필수입력"></asp:RequiredFieldValidator>
                    </td>
                </tr>

                

            </table>
            
        </div>
        <br />

        <br />
         <br />
         <hr class="Twrite_line" />

         <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ShowMessageBox="True" ShowSummary="False" />

         <div>
             <p id="txt">저작권을 확인하세요. 욕설과 비방, 상업적글이나 성인글, 반복적인 게시글 등은 신고 당하실 수 있습니다. 다시 한 번 확인 해주세요</p>
         </div>


         <div class="pwrite_btn2">  
          
          <asp:ImageButton ID="pcancel_btn" runat="server" ImageUrl="~/Images/write_cancle.png" CausesValidation="False" OnClick="pcancel_btn_Click" />
          <asp:ImageButton ID="pnext_btm" runat="server" ImageUrl="~/Images/write_bun.png" OnClick="pnext_btm_Click" />
           
         </div>
            
        


             
        

         <asp:Label ID="Label1" runat="server"></asp:Label>
            
        


             
        

    </div>

</asp:Content>

