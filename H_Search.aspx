<%@ Page Language="C#" AutoEventWireup="true" CodeFile="H_Search.aspx.cs" Inherits="Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/layout.css" type="text/css" rel="stylesheet" />
    <link href="css/Search.css" type="text/css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrap">
         <div class="Counter">
                    Total
        <asp:Label ID="Label12" runat="server" style="font-weight: 700"></asp:Label>&nbsp;현재접속수
        <asp:Label ID="Label22" runat="server" style="font-weight: 700"></asp:Label>
    
                </div>
        <div class="header">
            <div class="logo">
                <a href="Home.aspx"><img src="Images/mainlogo.png" /></a>
            </div>
            <div class="search">
                <input id="stxt" runat="server" type="text" />
                <button id="sbtn" runat="server" />
            </div>
            <div class="top_nav">
                 <ul>
                    <li><a href="H_Search.aspx">병원찾기</a></li>
                    <li><a href="Weekly.aspx">주간펫+</a></li>
                    <li><a href="Event.aspx">핫딜</a></li>
                    <li><a href="Community.aspx">커뮤니티</a></li>
                </ul>
            </div>
        </div>
                    <hr class="nf_line" style="width:100%;"/>
        <div class="contents">
            <img src="Images/search.png" style="width:999px;height:755px"/>
        </div>
            <hr class="nf2_line" />
            <div class="footer">
                <div class="f_notice">
                    <span class="f_title">공지사항</span>
                    &nbsp;&nbsp;
                    <span><a href="#">커뮤니티 게시물 신고 안내문</a></span>
                    <span class="view_all"><a href="#">전체보기 ></a></span>
                </div>
                <div class="footer_txt">
                    <img  src="Images/footerlogo.png" />
                    <ul>
                        <li><a href="/petinfo.aspx">웹소개 |</a></li>
                        <li><a href="#">공지사항 |</a></li>
                        <li><a href="#">이용약관 |</a></li>
                        <li><a href="#">고객센터 </a></li>
                    </ul>
                    <p class="f_txt">
                        서울특별시 종로구 필운대로 1길 34  ㈜ 펫플러스(Pet_Plus) COPYRIGHT ⓒ 2017  PETAH ALL RIGHTS RESERVED.
                    </p>
                </div>
            </div>
    
    </div>
    </form>
</body>
</html>
