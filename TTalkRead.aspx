<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_sub.master" AutoEventWireup="true" CodeFile="TTalkRead.aspx.cs" Inherits="Weekly_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/Weekly_detail.css"/>
   
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="TTalk_bwrap">
    <div class="TTalk_wrap">
       
        <asp:FormView ID="weeklytxt_form" runat="server" DataSourceID="SqlDataSource1" OnDataBound="weeklytxt_form_DataBound" DataKeyNames="seq">
            <ItemTemplate>
                <!--<div class="Tl_btn">
                    <asp:ImageButton ID="treply_btn" runat="server" ImageUrl="~/Images/reply.png" Height="25px" Width="60px" OnClick="treply_btn_Click" />
                </div>-->

                <div class="Tr_btn">
                    <asp:ImageButton ID="wedit_btn" runat="server" ImageUrl="~/Images/editbun.png" OnClick="wedit_btn_Click" />&nbsp;
                    <asp:ImageButton ID="wdelete_btn" runat="server" ImageUrl="~/Images/deletebtn.png" OnClick="wdelete_btn_Click" />
                </div>
                <table class="wtit_table">
                    <tr class="wtit_tr">
                        <td class="auto-style1" colspan="2">
                            <asp:Label ID="wtitleID" runat="server" Text='<%# Eval("title") %>' style="font-weight: 700; font-size: x-large; color: #000000;" />
                        </td>
                        <td  class="auto-style3"></td>
                        <td class="auto-style3"></td>
                    </tr>
                    <tr class="wtiti_tr">
                        <td class="user_td">
                            <asp:Label ID="userlabel" runat="server" Text='<%# Eval("userID") %>' style="text-align: right" CssClass="auto-style1" />
                            |
                        </td>
                        <td class="wdate_td">
                            <asp:Label ID="wdatelabel" runat="server" Text='<%# Eval("tDate") %>' CssClass="auto-style1" />
                        </td>
                        <td class="hittxt_td">
                            <p class="hit_txt">조회</p>
                        </td>
                        <td class="hit_td">
                            <asp:Label ID="hitlabel" runat="server" Text='<%# Eval("hit") %>' style="color: #FF6600" />
                        </td>
                    </tr>
                </table>
                <hr  class="week_hr"/>
                
                        <asp:Label ID="bodylabel" runat="server" Text='<%# Eval("body") %>'/>
            </ItemTemplate>
        </asp:FormView>
        <br />

        <br />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ 
            ConnectionStrings:myDBConnectionString1 %>" 
            SelectCommand="select * from [TTalk] t join [pfile] p on t.seq = p.tseq where (t.seq = @seq)">
            <SelectParameters>
                <asp:QueryStringParameter Name="seq" QueryStringField="seq" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        

        <asp:DataList ID="wphoto_datalist" runat="server" DataKeyField="seq" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                 <asp:Image ID="Image2" runat="server" Height="400px" ImageUrl='<%# "~/Talk/" + Eval("fName") %>' Width="600px" /><br />

           
            </ItemTemplate>

        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>"
             SelectCommand="select * from [TTalk] t join [pfile] p on t.seq = p.tseq where tname='T' AND (t.seq = @seq)">
            <SelectParameters>
                <asp:QueryStringParameter Name="seq" QueryStringField="seq" Type="Int32" />
            </SelectParameters>



        </asp:SqlDataSource>
        <br /> 

        <div class="rec_btndiv">
            <asp:ImageButton ID="rec_btn" runat="server" Height="65px" Width="60px" OnClick="rec_btn_Click" ImageUrl="~/Images/heart.png" />
            <br />
            <asp:Label ID="reclabel" runat="server" ></asp:Label>
        </div>

       
        <br />
        <hr  class="week_hr"/>
        <br />
        <br />

<div class="wlist">
           <asp:HyperLink ID="wlist_link" runat="server" NavigateUrl="~/TalkList.aspx">목록</asp:HyperLink>
       </div>
        <div class="wlink">
            <asp:HyperLink ID="wpre_link" runat="server">이전글</asp:HyperLink>&nbsp;
            <asp:HyperLink ID="wnex_link" runat="server">다음글</asp:HyperLink>
        </div>
        <br /><br />

        <div class="Tcomment">
            <div class="tcomtxt">
                 <asp:TextBox ID="tcomtext" runat="server" Width="850px" BackColor="White" BorderColor="Gray" BorderWidth="1px" Height="60px" TextMode="MultiLine"></asp:TextBox>&nbsp;
                 <asp:ImageButton ID="tcombtn" runat="server" Height="60px" ImageUrl="~/Images/tcom_btn.png" OnClick="ImageButton2_Click" Width="80px" />
            </div>

            <asp:DataList ID="DataList1" runat="server" DataKeyField="seq" DataSourceID="SqlDataSource3" Width="996px" OnDeleteCommand="DataList1_DeleteCommand" OnItemDataBound="DataList1_ItemDataBound" BorderStyle="Solid" BorderColor="White" BorderWidth="1px" CellSpacing="10" style="text-align: left">
                 <ItemTemplate>
                     <div class="tcom_con">
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserID") %>' style="font-weight: 700"></asp:Label>
                         <asp:Label ID="Label3" runat="server" Text='<%# Eval("nDate", "{0:yy.MM.dd HH:mm}") %>' style="color: #999999" /> <br /><br />
                         <asp:Label ID="Label2" runat="server" Text='<%# GetContent(Eval("content")) %>'></asp:Label>
                     </div>
              
                     <div class="tcom_debtn">
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" CommandArgument='<%# Eval("seq") %>' >삭제</asp:LinkButton><br /><br />
                     </div>
                     <br /><br /><br />
                    <hr  class="tcomhr"/>
                 </ItemTemplate>
             </asp:DataList>
        </div><!--톡톡댓글  div끝-->
        
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>"
             SelectCommand="select * from TTalk t join tcomment c on t.seq = c.tseq where (t.seq = @seq)">
            <SelectParameters>
                <asp:QueryStringParameter Name="seq" QueryStringField="seq" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <hr />

       

       
        
    </div>
   </div>
</asp:Content>

