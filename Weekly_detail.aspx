<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_sub.master" AutoEventWireup="true" CodeFile="Weekly_detail.aspx.cs" Inherits="Weekly_detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/Weekly_detail.css"/>
   
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="weeklyp_wrap">
       
        <asp:FormView ID="weeklytxt_form" runat="server" DataSourceID="SqlDataSource1" OnDataBound="weeklytxt_form_DataBound" DataKeyNames="seq">
            <ItemTemplate>
                <div class="w_category">
                    <p>HOME</p><p>&gt;</p><p>주간펫</p><p>&gt;</p> <asp:Label ID="wcategoryLabel" runat="server" Text='<%# Bind("category") %>' style="color: #006600" />
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
                            <asp:Label ID="wdatelabel" runat="server" Text='<%# Eval("wDate") %>' CssClass="auto-style1" />
                        </td>
                        <td class="hittxt_td">
                            <p class="hit_txt">조회</p>
                        </td>
                        <td class="hit_td">
                            <asp:Label ID="hitlabel" runat="server" Text='<%# Eval("hit") %>' style="color: #FF6600" />
                        </td>
                    </tr>
                </table>
                <div class="masterbtn">
                    <asp:ImageButton ID="wedit_btn" runat="server" ImageUrl="~/Images/editbun.png" OnClick="wedit_btn_Click" />&nbsp;
                    <asp:ImageButton ID="wdelete_btn" runat="server" ImageUrl="~/Images/deletebtn.png" OnClick="wdelete_btn_Click" />
                </div>
                
            </ItemTemplate>
        </asp:FormView>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ 
            ConnectionStrings:myDBConnectionString1 %>" 
            SelectCommand="select * from [Weekly] w left join [pfile] f on w.seq = f.tseq where (w.seq = @seq)">
            <SelectParameters>
                <asp:QueryStringParameter Name="seq" QueryStringField="seq" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <hr  class="week_hr"/>

        <asp:DataList ID="wphoto_datalist" runat="server" DataKeyField="seq" DataSourceID="SqlDataSource2">
            <ItemTemplate>
                 <asp:Image ID="Image2" runat="server" Height="600px" ImageUrl='<%# "~/Weekly/" + Eval("fName") %>' Width="996px" /><br />

           
            </ItemTemplate>

        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myDBConnectionString1 %>"
             SelectCommand="select * from [Weekly] w left join [pfile] p on w.seq = p.tseq where (w.seq = @seq)">
            <SelectParameters>
                <asp:QueryStringParameter Name="seq" QueryStringField="seq" Type="Int32" />
            </SelectParameters>



        </asp:SqlDataSource>
        <br /> 

        <div class="rec_btndiv">
            <asp:ImageButton ID="rec_btn" runat="server" Height="65px" Width="60px" OnClick="rec_btn_Click" />
            <br />
            <asp:Label ID="reclabel" runat="server" Text ='<%# Eval("rec") %>'></asp:Label>
        </div>

       
        <br />
        <hr  class="week_hr"/>
        <br />
        <br />
       <div class="wlist">
           <asp:HyperLink ID="wlist_link" runat="server" NavigateUrl="~/Weeklymain.aspx">목록</asp:HyperLink>
       </div>
        <div class="wlink">
            <asp:HyperLink ID="wpre_link" runat="server">이전글</asp:HyperLink>&nbsp;
            <asp:HyperLink ID="wnex_link" runat="server">다음글</asp:HyperLink>
        </div>
        
    </div>
</asp:Content>

