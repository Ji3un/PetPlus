<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_main.master" AutoEventWireup="true" CodeFile="hot_edit.aspx.cs" Inherits="MasterOnly_hot_write" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link rel="stylesheet" type="text/css" href="../css/h_write.css"/>
     <style type="text/css">
         .auto-style2 {
             height: 50px;
             width: 100px;
             background-color : white;
             border: 1px solid #269A62;
             border-collapse: collapse;
             text-align: left;
             vertical-align: central;
         }
         .auto-style3 {
             width: 700px;
             height: 50px;
             float: left;
             text-align: left;
             vertical-align: top;
             border-style: none;
         }
         </style>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="comu_wrap">
        <div class="h_content">
            <div> <span class="h_txt">핫딜+ 글 수정</span>
            </div>
            <table id="hwrite_table" style="margin-left:100px;">
                <tr class="htr">
                    <td class="auto-style2">
                         <p style="margin-left:20px;">카테고리</p>
                    </td>
                    <td class="auto-style3">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="48px" Width="77px" AutoPostBack="True" >
                            <asp:ListItem>진료비</asp:ListItem>
                            <asp:ListItem>용품</asp:ListItem>
                            <asp:ListItem>미용</asp:ListItem>
                            <asp:ListItem>호텔</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr class="htr">
                    <td class="auto-style2">
                        <p style="margin-left:20px;">소제목</p>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox1" runat="server" BorderColor="#ffffff" BorderWidth="1px" Height="50px" Width="600px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" Display="None" ErrorMessage="[소제목] 필수입력" style="color: #FF0000">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="htr">
                    <td class="auto-style2">
                    <p style="margin-left:20px">대제목</p>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox2" runat="server" BorderColor="#ffffff" BorderWidth="1px" Height="50px" Width="600px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" Display="None" ErrorMessage="[대제목] 필수입력" style="color: #FF0000">*</asp:RequiredFieldValidator>
                    </td>

                </tr>
                <tr class="htr">
                    <td class="auto-style2">
                        <p style="margin-left:20px;">
                            할인율 </p>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox3" runat="server" BorderColor="#ffffff" BorderWidth="1px" Height="50px" Width="600px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" Display="None" ErrorMessage="[할인율] 필수입력" style="color: #FF0000">*</asp:RequiredFieldValidator>
                    </td>

                </tr>
                <tr>
                    <td class="auto-style2">
                       <p style="margin-left:20px;">
                         상세설명 </p>
                    </td>
                    <td class="auto-style3">
                        <asp:TextBox ID="TextBox4" runat="server" BorderColor="#ffffff" BorderWidth="1px" Height="50px" Width="600px" TextMode="MultiLine"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="[상세설명]필수입력" style="color: #FF0000">*</asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr class="htr">
                    <td class="auto-style2">
                        <p style="margin-left:20px;">첨부파일</p>
                    </td>
                    <td class="auto-style3">
                        <asp:HiddenField ID="HiddenField1" runat="server" />
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="298px" BorderColor="#269a62" BorderWidth="1px" BackColor="White" Height="48px" AllowMultiple="True" />
                    &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">삭제하기</asp:LinkButton>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="FileUpload1" ErrorMessage="[이미지] 필수첨부" style="font-size: small"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr class="htr2">
                    <td class="auto-style2">
                         <p style="margin-left:20px;">완료 파일</p>
                    </td>
                    <td class="auto-style2">
                        <p><asp:Label ID="Label23" runat="server"></asp:Label></p>
                        <p><asp:Label ID="Label1" runat="server"></asp:Label></p>
                    </td>
                </tr>
            </table>
            <hr class="hwrite_line" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ShowMessageBox="True" ShowSummary="False" style="text-align: center" />
          <div>
            <p id="txt">저작권을 확인하세요. 욕설과 비방, 상업적글이나 성인글, 반복적인 게시글 등은 신고 당하실 수 있습니다. 다시 한 번 확인 해주세요</p>
         </div>
            <div class="hwrite_btn2">
                <asp:ImageButton ID="hcancel_btn" runat="server" ImageUrl="~/Images/write_cancle.png" CausesValidation="False" OnClick="hcancel_btn_Click" />
                <asp:ImageButton ID="hnext_btm" runat="server" ImageUrl="~/Images/write_bun.png" OnClick="hnext_btm_Click" />
            </div>

            <div class="h_lbl">
            <asp:Label ID="Label24" runat="server"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>

