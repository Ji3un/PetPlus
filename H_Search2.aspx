<%@ Page Language="C#" AutoEventWireup="true" CodeFile="H_Search2.aspx.cs" Inherits="Search" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/layout.css" type="text/css" rel="stylesheet" />
    <link href="css/Search.css" type="text/css" rel="stylesheet" />
    <title></title>
    <script>
        // This example requires the Places library. Include the libraries=places
        // parameter when you first load the API. For example:
        // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

        var map;
        var infowindow;
        var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        var labelIndex = 0;

        function initMap() {
            var pyrmont = { lat: 37.584915, lng: 126.965335 };

            map = new google.maps.Map(document.getElementById('map'), {
                center: pyrmont,
                zoom: 15
            });

            infowindow = new google.maps.InfoWindow();                       
            var service2 = new google.maps.places.PlacesService(map);
            service2.textSearch({
                location: pyrmont,
                radius: 1,
                query: '동물병원'
            }, processResults);
        }
        

        function processResults(results, status, pagination) {
            if (status !== google.maps.places.PlacesServiceStatus.OK) {
                return;
            } else {
                createMarkers2(results);

                if (pagination.hasNextPage) {
                    var moreButton = document.getElementById('more');

                    moreButton.disabled = false;

                    moreButton.addEventListener('click', function () {
                        moreButton.disabled = true;
                        pagination.nextPage();
                    });
                }
            }

            
        }

        function createMarkers2(places) {
            var bounds = new google.maps.LatLngBounds();
            var placesList = document.getElementById('places');

            for (var i = 0, place; place = places[i]; i++) {

                var marker2 = new google.maps.Marker({
                    map: map,
                    label: labels[labelIndex++ % labels.length],
                    title: place.name,
                    position: place.geometry.location
                });

                google.maps.event.addListener(marker2, 'click', function () {
                    infowindow.setContent('<div><strong>' + place.name + '</strong><br>' +
                      'Place ID: ' + place.place_id + '<br>' +
                      place.formatted_address + '</div>');
                    infowindow.open(map, this);
                });

                placesList.innerHTML += '<a href="' + 'http://www.google.co.kr/maps/place/' + place.name + '/@' + '" target="_blank"><li><h3>' + marker2.label + '. ' + place.name + '</h3><br>' + place.formatted_address + '</li></a>';

                bounds.extend(place.geometry.location);
            }
            map.fitBounds(bounds);            
        }       

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="wrap">         
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
        <div class="content_wrap">
            <div class="map_nav">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"> </asp:DropDownList>
            </div>
            <hr class="nf2_line" />
            <div class="contents">                       
               <div id="map"></div>
               <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAwUV_kvT2lAnpSQgmOaTmZ21-geKG2OQw&libraries=places&callback=initMap" async defer></script>                  
            </div>
            <div class="side_menu">
                <ul id="places">
                    <button id="more"> 더 찾아보기</button>
                </ul>
            </div>
            </div> 
            <hr class="nf2_line" />
            <div class="footer">
                <div class="f_notice">
                    <span class="f_title">공지사항</span>
                    &nbsp;&nbsp;
                    <span><a href="#">커뮤니티 게시물 신고 안내문</a></span>&nbsp;
                </div>
                <div class="footer_txt">
                    <img  src="Images/footerlogo.png" />
                    <div class="txt_wrap">
                        <ul>
                            <li><a href="/petinfo.aspx">웹소개 |</a></li>
                            <li><a href="#">공지사항 |</a></li>
                            <li><a href="#">이용약관 |</a></li>
                            <li><a href="#">고객센터 </a></li>
                        </ul>
                        <p class="f_txt">
                            서울특별시 종로구 필운대로 1길 34  ㈜ 펫플러스(Pet_Plus) COPYRIGHT ⓒ 2017  PETPLUS ALL RIGHTS RESERVED.
                        </p>
                    </div>
                </div>
            </div>
    
    </div>
    </form>
</body>
</html>
