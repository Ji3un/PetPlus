<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_main.master" AutoEventWireup="true" CodeFile="noticeRead.aspx.cs" Inherits="noticeRead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/notice.css"/>
    <style type="text/css">
        .auto-style2 {
            color: #808080;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="notice_background2">
        <div class="notice_contain2">
            <div>
                <asp:FormView ID="notice_read_FV" runat="server" DataKeyNames="seq" DataSourceID="SqlDataSource1" Width="800px" BackColor="White" BorderColor="White" BorderWidth="2px" OnDataBound="notice_read_FV_DataBound" >
                    <EditItemTemplate>
                        <asp:TextBox ID="seqTextBox" runat="server" Text='<%# Eval("seq") %>' />
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                        <asp:TextBox ID="wDateTextBox" runat="server" Text='<%# Bind("wDate") %>' />
                        <asp:TextBox ID="hitTextBox" runat="server" Text='<%# Bind("hit") %>' />
                        <asp:TextBox ID="bodyTextBox" runat="server" Text='<%# Bind("body") %>' />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        userID:<asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' /> <br />
                        title:<asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' /> <br />
                        body: <asp:TextBox ID="bodyTextBox" runat="server" Text='<%# Bind("body") %>' /> <br />
                        hit:<asp:TextBox ID="hitTextBox" runat="server" Text='<%# Bind("hit") %>' /> <br />
                        wDate:<asp:TextBox ID="wDateTextBox" runat="server" Text='<%# Bind("wDate") %>' />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div class="not_table">
                            <table style="border-style: none; width: 940px;">
                                <tr>
                                    <td style="border-style: none" class="notice_ta_td1">
                                        <div class="notice_titleLabel1"><asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' /></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="border-style: none" class="notice_read_td1">
                                        <div class="not_ta">
                                            <div class="not_ta_t1"><asp:Label ID="userIDLabel" runat="server" style="color: #808080" Text='<%# Bind("userID") %>' />
                                                &nbsp;
                                            <asp:Label ID="wDateLabel" runat="server" style="color: #808080" Text='<%# Bind("wDate") %>' /></div>
                                            <div class="not_ta_t2"><span class="auto-style2">조회 </span><asp:Label ID="hitLabel" runat="server" Text='<%# Bind("hit") %>' style="color: #808080" /></div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <hr class="not_hr1" />
                            <asp:Label ID="bodyLabel" runat="server" Text='<%# Bind("body") %>' />
                        </div>
                    </ItemTemplate>
                </asp:FormView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" SelectCommand="SELECT * FROM [notice] WHERE ([seq] = @seq)" OnSelecting="SqlDataSource1_Selecting">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="seq" QueryStringField="seq" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>  
                </div>
            
                            <hr class="not_hr2" />
            
                <div class="notice_r_btn3">
                      <div class="notice_w_btn3_1"><asp:ImageButton ID="nImageButton1" runat="server" ImageUrl="~/Images/write_list.png" PostBackUrl="~/noticeList.aspx" CausesValidation="False" /></div>
                      <div class="notice_w_btn3_2"><asp:ImageButton ID="nImageButton2" runat="server" ImageUrl="~/Images/write_bun.png" CausesValidation="False" PostBackUrl="~/MasterOnly/noticeWrite.aspx" /></div>
                      <div class="notice_w_btn3_3"><asp:ImageButton ID="nImageButton3" runat="server" ImageUrl="~/Images/pdelete_btn.png" OnClick="nImageButton3_Click1" /></div>
                      <div class="notice_w_btn3_4"><asp:ImageButton ID="nImageButton4" runat="server" ImageUrl="~/Images/pedit_btn.png" OnClick="nImageButton4_Click1" /></div>
               </div>
         </div>
    </div>
</asp:Content>

