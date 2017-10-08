<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_mypage.master" AutoEventWireup="true" CodeFile="Mypage.aspx.cs" Inherits="Mypage" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="m_content">
        <div class="c_tit">
           <p class="auto-style3">My Page</p>
           <p class="auto-style2">캘린더, 쪽지와 관심메뉴를 이용하여 더 다양한 펫플러스를 만나보세요.</p>
        </div>
        <hr class="con_line"/>
            <div class="my_img">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/dog.PNG" />
            </div>
    </div>
</asp:Content>

