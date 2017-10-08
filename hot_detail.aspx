<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_sub.master" AutoEventWireup="true" CodeFile="hot_detail.aspx.cs" Inherits="Event_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="detail_wrap">
        <div class="e_detail_wrap">

            <asp:FormView ID="FormView1" runat="server" DataKeyNames="seq" DataSourceID="SqlDataSource1" Width="100%">
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
                       <asp:Image ID="Image1" runat="server" Height="440px" ImageUrl='<%# "~/Event/" + Eval("fName") %>' Width="440px" />
                    </div>
                    <div class="e_detail">
                        <div class="c_title">
                         <asp:Label ID="title1Label" runat="server" Text='<%# Bind("title1") %>' style="font-size: 10pt" />
                            <br />
                           <asp:Label ID="title2Label" runat="server" Text='<%# Bind("title2") %>' style="font-size: 11pt; font-weight: 700" />
                        </div>
                    <br />
                    cName:
                    <asp:Label ID="cNameLabel" runat="server" Text='<%# Bind("cName") %>' />
                    <br />
                    hit:
                    <asp:Label ID="hitLabel" runat="server" Text='<%# Bind("hit") %>' />
                    <br />
                    rec:
                    <asp:Label ID="recLabel" runat="server" Text='<%# Bind("rec") %>' />
                    <br />
                    deleted:
                    <asp:Label ID="deletedLabel" runat="server" Text='<%# Bind("deleted") %>' />
                    <br />
                    hDate:
                    <asp:Label ID="hDateLabel" runat="server" Text='<%# Bind("hDate") %>' />
                    <br />
                    hfile:
                    <asp:Label ID="hfileLabel" runat="server" Text='<%# Bind("hfile") %>' />
                    <br />



                    </div>

                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" SelectCommand="SELECT * FROM [Hotdeal]"></asp:SqlDataSource>

            </div>


        </div>
</asp:Content>

