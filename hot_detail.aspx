<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_sub.master" AutoEventWireup="true" CodeFile="hot_detail.aspx.cs" Inherits="Event_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            font-size: small;
        }
        .auto-style2 {
            font-size: 11pt;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="detail_wrap">
        <div class="e_detail_wrap">

            <asp:FormView ID="Event_FormView1" runat="server" DataKeyNames="seq" DataSourceID="SqlDataSource1" Width="100%" BackColor="White" Height="501px">
                <EditItemTemplate>
                    seq:
                    <asp:Label ID="seqLabel1" runat="server" Text='<%# Eval("seq") %>' />
                    <br />
                    category:
                    <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
                    <br />
                    userID:
                    <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                    <br />
                    title1:
                    <asp:TextBox ID="title1TextBox" runat="server" Text='<%# Bind("title1") %>' />
                    <br />
                    title2:
                    <asp:TextBox ID="title2TextBox" runat="server" Text='<%# Bind("title2") %>' />
                    <br />
                    cName:
                    <asp:TextBox ID="cNameTextBox" runat="server" Text='<%# Bind("cName") %>' />
                    <br />
                    hit:
                    <asp:TextBox ID="hitTextBox" runat="server" Text='<%# Bind("hit") %>' />
                    <br />
                    rec:
                    <asp:TextBox ID="recTextBox" runat="server" Text='<%# Bind("rec") %>' />
                    <br />
                    deleted:
                    <asp:TextBox ID="deletedTextBox" runat="server" Text='<%# Bind("deleted") %>' />
                    <br />
                    hDate:
                    <asp:TextBox ID="hDateTextBox" runat="server" Text='<%# Bind("hDate") %>' />
                    <br />
                    hfile:
                    <asp:TextBox ID="hfileTextBox" runat="server" Text='<%# Bind("hfile") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="업데이트" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="취소" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    category:
                    <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
                    <br />
                    userID:
                    <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                    <br />
                    title1:
                    <asp:TextBox ID="title1TextBox" runat="server" Text='<%# Bind("title1") %>' />
                    <br />
                    title2:
                    <asp:TextBox ID="title2TextBox" runat="server" Text='<%# Bind("title2") %>' />
                    <br />
                    cName:
                    <asp:TextBox ID="cNameTextBox" runat="server" Text='<%# Bind("cName") %>' />
                    <br />
                    hit:
                    <asp:TextBox ID="hitTextBox" runat="server" Text='<%# Bind("hit") %>' />
                    <br />
                    rec:
                    <asp:TextBox ID="recTextBox" runat="server" Text='<%# Bind("rec") %>' />
                    <br />
                    deleted:
                    <asp:TextBox ID="deletedTextBox" runat="server" Text='<%# Bind("deleted") %>' />
                    <br />
                    hDate:
                    <asp:TextBox ID="hDateTextBox" runat="server" Text='<%# Bind("hDate") %>' />
                    <br />
                    hfile:
                    <asp:TextBox ID="hfileTextBox" runat="server" Text='<%# Bind("hfile") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="삽입" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="취소" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="detail_box">
                        <div class="menu_url">
                              <p style="font-size: 12pt"><span class="auto-style2">HOME&gt;핫딜+&gt;</span><asp:Label ID="Label23" runat="server" Text='<%# Bind("category") %>' style="font-size: 11pt"></asp:Label>
                                  <asp:Label ID="Label24" runat="server" style="font-size: 11pt; color: #999999" Text='<%# Bind("userID") %>'></asp:Label>
                              </p>
                        </div>
                        <div class="main_img">
                          <asp:Image ID="Image1" runat="server" Height="400px" ImageUrl='<%# "~/Event/" + Eval("fName") %>' Width="400px" />
                        </div>
                    </div>
                    <div class="e_detail">
                        <div class="c_title">
                         <asp:Label ID="title1Label" runat="server" Text='<%# Bind("title1") %>' style="font-size: 15pt; color: #999999;" />
                            <br />
                           <asp:Label ID="title2Label" runat="server" Text='<%# Bind("title2") %>' style="font-size: 18pt; font-weight: 700" />
                        </div>

                        <div class="coupon_lbl">
                            <div id="cName">
                               <asp:Label ID="cNameLabel" runat="server" Text='<%# Bind("cName") %>' style="font-weight: 700; font-size: 12pt;" />
                        </div>
                         <div class="c_content">
                             <asp:Label ID="contentLabel" runat="server" Text='<%# Bind("contents") %>' style="font-size: 11pt;"></asp:Label>
                         </div>
                        </div>
                        <div class="hit_lbl">
                            <div id="watching">
                              <asp:Label ID="hitLabel" runat="server" Text='<%# Bind("hit") %>' style="font-size: small; font-weight: 700; color: #009900" /><span class="auto-style1">명이 봤어요!</span>
                            </div>
                            <div class="upload_date">
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("hDate") %>' style="font-size: small"></asp:Label>
                            </div>
                        </div>
                    <div class="coupon_line">
                      <hr class="c_line"/>
                    </div>
                    <div class="c_btn">
                        <div id="rec_btn">
                            <div id="heart">
                             <asp:ImageButton ID="rec_btnClick" runat="server" ImageUrl="~/Coupon/heart_1.png" OnClick="rec_btnClick" />  
                            </div>
                            <div id="rec_lbl">
                             <asp:Label ID="recLabel" runat="server" style="font-size: x-small; " Text='<%# Bind("rec") %>' />
                            </div>
                        </div>
                        <div id="detail_btn2">
                            <asp:ImageButton ID="buy_btn" runat="server" ImageUrl="~/Images/buy_btn2.png" />
                            <asp:ImageButton ID="modi_btn" runat="server" ImageUrl="~/Images/modi_btn.png" />
                        </div>
                    </div>
                    </div>

                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" SelectCommand="select * from Hotdeal join [pfile] on Hotdeal.seq = pfile.tseq where Hotdeal.seq = @seq">
                <SelectParameters>
                    <asp:QueryStringParameter Name="seq" QueryStringField="seq" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            </div>


        </div>
</asp:Content>

