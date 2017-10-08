<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_main.master" AutoEventWireup="true" CodeFile="petinfo.aspx.cs" Inherits="petinfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="/css/info.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="petinfo">
        <br />
       <br />
       <br />
       <br />

        <div class="info_meun">
            <asp:ImageButton runat="server" class="info_b1" ImageUrl="~/images/info_m1.png"/>
           
        </div>
       <br />
       <br />
       <br />
       <br />

        <div class="info_content">
            <img class="info_img1" src="images/info_1.png"/>
            <img class="info_img2" src="images/info_2.png"/>
        </div>




   </div>
</asp:Content>

