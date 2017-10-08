<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_mypage.master" AutoEventWireup="true" CodeFile="Pet_calendar.aspx.cs" Inherits="MemberOnly_Pet_calendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            color: #999999;
        }
        .auto-style2 {
            font-size: 10pt;
        }
        .auto-style3 {
            font-size: 15pt;
        }
        .auto-style9 {
            width: 250px;
            height: 700px;
        }
            .auto-style9 {
            width: 300px;
        }
        .auto-style10 {
            font-size: 11pt;
        }
        .auto-style11 {
            width: 100%;
            border-collapse:collapse; border-style:solid; border-width:1px; border-color:#999999;
        }
        .auto-style14 {
            width: 58px;
            padding-left:10px;
        }
        .auto-style15 {
            width: 84px;
        }
        .auto-style16 {
            text-align: center;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="m_content">
      <div class="c_tit">
           <p class="auto-style3">펫 캘린더</p>
           <p class="auto-style2">나의 반려동물의 병원진료내용 및 일상을 기록하고 확인해보세요.</p>
        </div>
        <hr class="con_line"/>
        <table class="cal_box">
                    <tr>
                        <td class="auto-style9" style="vertical-align: top; padding-left:20px; padding-bottom:10px; text-align: center;">
                            <asp:Calendar ID="Calendar1" runat="server"  Height="400px" NextPrevFormat="FullMonth" Width="300px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" OnVisibleMonthChanged="Calendar1_VisibleMonthChanged">
                                <DayHeaderStyle BackColor="#1EAC4F" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" ForeColor="White" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" />
                                <DayStyle Height="30px" BorderStyle="None" BackColor="White" />
                                <SelectedDayStyle BackColor="#FFCC00" />
                                <TitleStyle BackColor="White" Height="60px" />
                            </asp:Calendar>
                        </td>
                        <td class="auto-style14" style="vertical-align: top; padding-left:30px; padding-right:30px;padding-bottom:10px; text-align: center;">
                            <asp:Label ID="Label1" runat="server" style="font-weight: 700"></asp:Label>
                            <br />
                          <asp:DataList ID="DataList1" runat="server" DataKeyField="seq" Width="360px" style="margin-bottom: 0" OnDeleteCommand="DataList1_DeleteCommand" OnItemCommand="DataList1_ItemCommand">
                                <FooterStyle BackColor="#FFCC66" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Height="40px" />
                                <FooterTemplate>
                                    <span class="auto-style10"><strong>반려동물 건강지킴이 &#39;펫플러스&#39;</strong></span>
                                </FooterTemplate>
                                <HeaderStyle BackColor="#FFCC66" BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" Height="40px" />
                                <HeaderTemplate>
                                    <span class="auto-style10"><strong>오늘의 일정</strong></span>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <table class="auto-style11">
                                        <tr>
                                            <td class="auto-style15">
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Mypage_btn/c_check_btn.png" CommandArgument='<%# Eval("seq") %>' CommandName="Done" Height="25px" Width="25px" />
                                                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/Mypage_btn/c_delete_btn.png" CommandArgument='<%# Eval("seq") %>' CommandName="Delete" Height="25px" Width="25px" />
                                            </td>
                                            <td>
                                                <asp:Label ID="Label23" runat="server" Text='<%# Eval("sTime") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style15">
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("seq") %>'>삭제</asp:LinkButton>
                                            </td>
                                            <td>
                                                <asp:Label ID="Label24" runat="server" Text='<%# DoneCheck(Eval("toDo"),Eval("hasDone")) %>'></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                            <div id="new_schedule" class="auto-style16">
                                <span class="auto-style10">새 할일 :
                                </span>
                                <asp:TextBox ID="TextBox1" runat="server" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                                <br />
                                <span class="auto-style10">시작시간 :
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="100px">
                                </asp:DropDownList>
                                <asp:DropDownList ID="DropDownList2" runat="server" Width="100px">
                                </asp:DropDownList>
                                &nbsp;<asp:Button ID="Button1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" OnClick="Button1_Click" Text="등록" />
                                <br />
                                <br />
                                <asp:Label ID="Label25" runat="server" ForeColor="#009933" style="font-weight: 700"></asp:Label>
                                </span>
                            </div>

                        </td>
                    </tr>
        </table>
    </div>
</asp:Content>

