<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage_main.master" AutoEventWireup="true" CodeFile="petsitemap.aspx.cs" Inherits="sitemap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" type="text/css" href="css/sitemap.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <div class="sitemap_container">
        <h2 class="title">사이트 맵</h2>
        <hr />

        <div class="sitemap_content">
        <div id ="sitemap_sm1">
            <p class="smt1"><img src="images/smt1.png"/></p>
                    
                    <p class="smt"><a href="#"> 웹소개</a></p>
                    <p class="smt">이용약관</p>
                    <p class="smt">공지사항</p>
                    <p class="smt">고객센터</p>
        </div>
        <div id ="sitemap_sm2">
            <p class="smt2"><img src="images/smt2.png"/></p>
                    <p class="smt"><a href="/login.aspx">로그인</a></p>
                    <p class="smt"><a href="/join1.aspx">회원가입</a></p>
                    <p class="smt"><a href="#">ID/PW찾기</a></p>
                    <p class="smt"><a href="/MemberOnly/Mypage.aspx">마이페이지</a></p>
        </div>
        <div id ="sitemap_sm3">
            <p class="smt3"><img src="images/smt3.png"/></p>
                    <p class="smt"><a href="/H_Search.aspx">병원찾기</a></p>
                    <p class="smt"><a href="/Weekly.aspx">주간펫+</a></p>
                    <p class="smt"><a href="/Event.aspx">핫딜+</a></p>
                    <p class="smt3_4"><a href="#">커뮤니티</a></p>
                                <p class="smt3_4_1"> <a href="#">- 톡톡</a></p>
                                <p class="smt3_4_1"> <a href="/plist.aspx">- 포토랭킹</a></p>
                                <p class="smt3_4_1"> <a href="#">- 출석체크</a></p>
        </div>
        <div id ="sitemap_sm4">
            <p class="smt4"><img src="/images/smt4.png"/></p>
                    <p class="smt">설문조사</p>
                    <p class="smt">건강검진</p>
        </div>
    </div>
    </div>


</asp:Content>

