<%@ Page Title="" Language="C#" MasterPageFile="/MasterPage_main.master" AutoEventWireup="true" CodeFile="noticeWrite.aspx.cs" Inherits="noticeWrite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../css/notice.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="notice_background">
        <div class="notice_contain">
            <span class="notice_title1">공지사항 글쓰기</span>
            <hr class="notice_w_hr1"/>

            <div class="notice_write1">
                <table class="notice_table" style="border-style: none" border="0">
                    <tr style="border-style: none">
                        <td style="border-style: none" class="notice_tt1">
                            <div class="notice_content1">제목</div>
                        </td>
                        <td style="border-style: none" class="notice_tt2">
                                <div class="notice_content2">
                                    <asp:TextBox ID="nTextBox1" runat="server" Width="600px" Height="25px" margin-bottom="0px" BorderColor="#CCCCCC"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="None" ErrorMessage="[제목] 필수입력" ControlToValidate="nTextBox1" style="color: #FF3300">*</asp:RequiredFieldValidator>
                                </div>
                        </td>
                    </tr>
                    <tr style="border-style: none" >
                        <td style="border-style: none"  class="notice_tt3">
                            <div class="notice_content3">내용</div>
                        </td>
                        <td style="border-style: none"  class="notice_tt4">
                                <div class="notice_content4">
                                    <asp:TextBox ID="nTextBox2" runat="server" Width="600px" Height="250px" margin-bottom="0px" TextMode="MultiLine" BorderColor="#CCCCCC"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Display="None" ErrorMessage="[내용] 필수입력" ControlToValidate="nTextBox2" style="color: #FF3300">*</asp:RequiredFieldValidator>
                                </div>
                        </td>
                    </tr>
                </table>
                <hr class="notice_w_hr2"/>

                <div>
                    <p id="notice_textp">
                        저작권을 확인하세요. 욕설과 비방, 상업적글이나 성인글, 반복적인 게시글 등은 신고 당하실 수 있습니다. 다시 한 번 확인 해주세요
                    </p>
                    <div>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="List" ShowMessageBox="True" ShowSummary="False" />
                    </div>
                </div>

                <div class="notice_w_btn1">
                    <div class="not_w_bt1"><asp:ImageButton ID="oImageButton3" runat="server" CausesValidation="False" ImageUrl="~/Images/write_list.png" PostBackUrl="~/noticeList.aspx" /></div>
                    <div class="not_w_bt2"><asp:ImageButton ID="oImageButton2" runat="server" ImageUrl="~/Images/write_bun.png" OnClick="ImageButton2_Click1" /></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

