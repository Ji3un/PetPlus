<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_comu.master" AutoEventWireup="true" CodeFile="Calendar.aspx.cs" Inherits="Community" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="../css/calender.css" />
    <style type="text/css">
        .auto-style8 {
            width: 632px;
        }
        .auto-style9 {
            width: 361px;
        }
        .auto-style10 {
            text-align: center;
            font-size: 15pt;
            background-color: #FFCC66;
        }
        .auto-style12 {
            width: 146px;
            height: 31px;
            text-align: center;
        }
        .auto-style13 {
            height: 31px;
            text-align: center;
        }
        .auto-style15 {
            width: 100%;
            height: 56px;
        }
        .auto-style16 {
            width: 146px;
            height: 24px;
            text-align: center;
        }
        .auto-style17 {
            height: 24px;
            text-align: center;
        }
        .auto-style18 {
            font-size: small;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="comu_wrap" style="height:630px;background-color:#ffffff; text-align:left;">
                    <div class="content" style="width:996px; height:auto; text-align:left; border:none;">
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/Mypage_btn/diary.png" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="Label4" runat="server" style="font-weight: 700"></asp:Label>
            <br />
  
            <div class="table1">
                <table class="t_box" style="width:996px;height:500px;border: medium none #ffffff;" border="0" aria-required="False">
                    <tr>
                        <td class="auto-style9"  style="vertical-align: top; padding-left:30px; padding-right:30px;padding-bottom:10px">
                            <asp:Calendar ID="Calendar1" runat="server"  Height="483px" NextPrevFormat="FullMonth" Width="361px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" OnVisibleMonthChanged="Calendar1_VisibleMonthChanged">
                                <DayStyle Height="30px" BorderStyle="None" />
                                <SelectedDayStyle BackColor="#FFCC00" />
                            </asp:Calendar>
                        </td>
                        <td class="auto-style8" style="vertical-align: top; padding-left:30px; padding-right:30px;padding-bottom:10px; text-align: center;">
                            <asp:DataList ID="DataList1" runat="server" Width="100%" OnDeleteCommand="DataList1_DeleteCommand" OnItemCommand="DataList1_ItemCommand">
                                <AlternatingItemStyle Height="10px" />
                                <FooterStyle Height="20px" />
                                <FooterTemplate>
                                    <div class="auto-style10">
                                        <strong>반려동물 건강지킴이 &#39;펫플러스&#39;</strong></div>
                                </FooterTemplate>
                                <HeaderStyle Height="20px" />
                                <HeaderTemplate>
                                    <div class="auto-style10">
                                        <strong>오늘의 일정</strong></div>
                                </HeaderTemplate>
                                <ItemStyle Height="20px" />
                                <ItemTemplate>
                                    <table class="auto-style15">
                                        <tr>
                                            <td class="auto-style12">
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Mypage_btn/c_check_btn.png" CommandArgument='<%# Eval("seq") %>' CommandName="Done" Height="25px" Width="25px" />
                                                <span class="auto-style18">한일</span><asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Mypage_btn/c_delete_btn.png" CommandArgument='<%# Eval("seq") %>' CommandName="Delete" Height="25px" Width="25px" />
                                                <span class="auto-style18">삭제</span></td>
                                            <td class="auto-style13">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("sTime") %>' style="font-size: medium"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style16">
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("seq") %>' CommandName="Cancel" >한일취소</asp:LinkButton>
                                            </td>
                                            <td class="auto-style17">
                                                <asp:Label ID="Label2" runat="server" Text='<%# DoneCheck(Eval("toDo"),Eval("hasDone")) %>' style="font-size: medium"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                            <br />
                            <br />
                            새 할일 :
                            <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" BorderWidth="1px" Width="65%" Wrap="False" Height="20px"></asp:TextBox>
                            <br />
                            시작시간 :
                            <asp:DropDownList ID="DropDownList1" runat="server">
                            </asp:DropDownList>
                                &nbsp;<asp:DropDownList ID="DropDownList2" runat="server">
                            </asp:DropDownList>
                                &nbsp;<asp:Button ID="Button1" runat="server" Height="30px" Text="등록" BorderStyle="Solid" BorderWidth="1px" OnClick="Button1_Click" Width="40px" />
                            <br />
                            <br />
                            <asp:Label ID="Label3" runat="server" style="font-weight: 700; color: #FF0066"></asp:Label>
                        </td>
                    </tr>
                    </table>

                <br />

            </div>
        </div>
    </div>
</asp:Content>

