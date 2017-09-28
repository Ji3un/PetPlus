<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_comu.master" AutoEventWireup="true" CodeFile="TalkRead.aspx.cs" Inherits="TalkRead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="/css/TalkRead.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Tshow_wap">

        <br />
        <div class="Tformview">
        <asp:FormView ID="Tshow_form" runat="server" DataKeyNames="seq" DataSourceID="SqlDataSource1" Width="800px" BackColor="White" BorderColor="White" BorderWidth="2px" OnDataBound="phoshow_form_DataBound" >
            <EditItemTemplate>
                seq:
                <asp:Label ID="seqLabel1" runat="server" Text='<%# Eval("seq") %>' />
                <br />
                userID:
                <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                <br />
                menu:
                <asp:TextBox ID="menuTextBox" runat="server" Text='<%# Bind("menu") %>' />
                <br />
                category:
                <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
                <br />
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                body:
                <asp:TextBox ID="bodyTextBox" runat="server" Text='<%# Bind("body") %>' />
                <br />
                hit:
                <asp:TextBox ID="hitTextBox" runat="server" Text='<%# Bind("hit") %>' />
                <br />
                wDate:
                <asp:TextBox ID="wDateTextBox" runat="server" Text='<%# Bind("wDate") %>' />
                <br />
                fName:
                <asp:TextBox ID="fNameTextBox" runat="server" Text='<%# Bind("fName") %>' />
                <br />
                fSize:
                <asp:TextBox ID="fSizeTextBox" runat="server" Text='<%# Bind("fSize") %>' />
                <br />
                hitDown:
                <asp:TextBox ID="hitDownTextBox" runat="server" Text='<%# Bind("hitDown") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="업데이트" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="취소" />
            </EditItemTemplate>
            <InsertItemTemplate>
                userID:
                <asp:TextBox ID="userIDTextBox" runat="server" Text='<%# Bind("userID") %>' />
                <br />
                menu:
                <asp:TextBox ID="menuTextBox" runat="server" Text='<%# Bind("menu") %>' />
                <br />
                category:
                <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
                <br />
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                body:
                <asp:TextBox ID="bodyTextBox" runat="server" Text='<%# Bind("body") %>' />
                <br />
                hit:
                <asp:TextBox ID="hitTextBox" runat="server" Text='<%# Bind("hit") %>' />
                <br />
                wDate:
                <asp:TextBox ID="wDateTextBox" runat="server" Text='<%# Bind("wDate") %>' />
                <br />
                fName:
                <asp:TextBox ID="fNameTextBox" runat="server" Text='<%# Bind("fName") %>' />
                <br />
                fSize:
                <asp:TextBox ID="fSizeTextBox" runat="server" Text='<%# Bind("fSize") %>' />
                <br />
                hitDown:
                <asp:TextBox ID="hitDownTextBox" runat="server" Text='<%# Bind("hitDown") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="삽입" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="취소" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="Tshow_table">
                    <tr class="Tshow_tr">
                        <td class="auto-style1" colspan="2">
                            <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                        </td>
                        <td  class="auto-style3"></td>
                        <td class="auto-style3"></td>
                    </tr>
                    <tr class="Tshow_tr">
                        <td class="auto-style4">
                            <asp:Label ID="userIDLabel" runat="server" Text='<%# Bind("userID") %>' style="text-align: right" />
                        </td>
                        <td class="auto-style7">
                            <asp:Label ID="wDateLabel" runat="server" Text='<%# Bind("wDate") %>' />
                        </td>
                        <td class="auto-style8">
                            <p class="hit_txt">조회</p>
                        </td>
                        <td class="auto-style8">
                            <asp:Label ID="hitLabel" runat="server" Text='<%# Bind("hit") %>' />
                        </td>
                    </tr>
                </table>
                <asp:Label ID="Label1" runat="server" Text="&lt;hr/&gt;"></asp:Label>
                <br />
&nbsp;&nbsp;<asp:Label ID="bodyLabel" runat="server" Text='<%# Bind("body") %>' />
                <br />
                <br />
                <asp:Image ID="Image1" runat="server" Height="300px" ImageUrl='<%# "~/Uploads/" + Eval("fName") %>' Width="400px" />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                
                
                <br />
                <br />

<hr class="phowhow_line" />
             <div class="Talk_btn">
                <div class="allbtn">
                    <asp:ImageButton ID="tlist_bun" runat="server" ImageUrl="~/Images/write_list.png" PostBackUrl="~/TalkList.aspx" Height="26px" Width="60px"/>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/reply.png" OnClick="ImageButton1_Click" Width="60px" Height="26px" />
                </div>

                <div class="userbtn">
                    <asp:ImageButton ID="tedit_btn" runat="server" OnClick="Button2_Click" ImageUrl="~/Images/pedit_btn.png" Height="26px" Width="60px"/>
                    <asp:ImageButton ID="tdelete_btn" runat="server" OnClick="Button3_Click" ImageUrl="~/Images/pdelete_btn.png" Height="26px" Width="60px" />
                
                </div>
            </div>
                   
                
            </ItemTemplate>
        </asp:FormView>

        </div> 
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>" SelectCommand="SELECT * FROM [Talk]  WHERE ([seq] = @seq)"  >
            <SelectParameters>
                <asp:QueryStringParameter Name="seq" QueryStringField="seq" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
      

   </div>
</asp:Content>

