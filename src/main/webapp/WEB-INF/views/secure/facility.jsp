<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>KinderGarten 지도</title>
    <link type="text/css" rel="stylesheet" href="https://navermaps.github.io/maps.js/docs/styles/sunlight.default.css">
    <link type="text/css" rel="stylesheet" href="https://navermaps.github.io/maps.js/docs/styles/site.flatly.css">
	<link type="text/css" rel="stylesheet" href="https://navermaps.github.io/maps.js/docs/css/highlightjs.css">
	<link rel="stylesheet" type="text/css" href="https://navermaps.github.io/maps.js/docs/css/base.css" />
</head>
<body>
 <%@include file="/WEB-INF/views/header.jsp" %>
 <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=WEHnDOsE0PtWrYVdcq8H"></script>
<script type="text/javascript" src="https://navermaps.github.io/maps.js/docs/js/base.js"></script>
 <script>
function log(msg) {
    console.log(msg);
    $("#console").prepend(msg +"\n");
};

$(document).ready(function() {
    $("#wrap")[0] && $(window).on("load", function() {
        window.setTimeout(function() {
            if (window.map && window.naver && window.naver.maps && map instanceof naver.maps.Map) {
                var mapModel = map.getMapModel(),
                    mapView = map.getMapView(),
                    mapHeight = parseInt(mapView.get("mapDiv").style.height, 10) || 400;

                $(window).on("resize", function() {
                    var wrapper = $("#wrap");

                    wrapper.length && map.setSize(new naver.maps.Size(wrapper.width(), mapHeight));
                });
            }
        }, 0);
    });

    var snippetEl = $("#snippet"),
        codeEl = $("#code");

    if (snippetEl.length && codeEl.length) {
        var pre = $("<pre></pre>"),
            html = codeEl.text() || codeEl.html();

        // pre.text(html);
        if ((document.documentMode && document.documentMode <= 8) ||
            (navigator.userAgent.toLowerCase().indexOf('msie 8') > -1)) {
            pre[0].innerText = html;
        } else {
            pre.text(html);
        }

        snippetEl.append(pre);
    }
});
</script>

<section>
	<article>
		<div class = "container">
		<div class = "row">
			<div class = "col-xs-12 text-center">
				<h2>유치원과 가까운 지도정보</h2>
				<br />
			</div>
			<div class = "col-xs-3">
				<div class = "col-xs-12">
					<div class = "mapinfo">
						<p><img src="assets/img/police.png"><b>&nbsp;&nbsp;경찰서</b></p>
						<p><img src="assets/img/hospital.png"><b>&nbsp;&nbsp;병원</b></p>
						<p><img src="assets/img/sobang.png"><b>&nbsp;&nbsp;소방서</b></p>
						<p><img src="assets/img/preschool.png"><b>&nbsp;&nbsp;유치원</b></p>
						<p><img src="assets/img/kidscafe.png"><b>&nbsp;&nbsp;키즈카페</b></p>
					</div>
				</div>
			</div>
			<div class = "col-xs-9" id="map" style="height:600px;"></div>
		</div>
		</div>
	</article>
</section>


<script>
var HOME_PATH = window.HOME_PATH || '.';

var map = new naver.maps.Map(document.getElementById('map'), {
    zoom: 10,
    center: new naver.maps.LatLng(37.4990179, 127.032856)
});

var latlngs = [
               new naver.maps.LatLng(37.4990179, 127.032856), // 유치원(본원)
               new naver.maps.LatLng(37.5083572, 127.0410163), // 경찰서
               new naver.maps.LatLng(37.5013328, 127.0437177), // 경찰서
               new naver.maps.LatLng(37.4938611, 127.0322273), // 경찰서 
               new naver.maps.LatLng(37.4923165, 127.0282109), // 경찰서 
               new naver.maps.LatLng(37.4971347, 127.0424589), // 소방서
               new naver.maps.LatLng(37.5001318, 127.0270839), // 병원
               new naver.maps.LatLng(37.4919377, 127.0239374), // 병원
               new naver.maps.LatLng(37.4992649, 127.0484171), // 병원
               new naver.maps.LatLng(37.4918308, 127.0252409), // 키즈카페
               new naver.maps.LatLng(37.5025111, 127.039225), // 키즈카페
               new naver.maps.LatLng(37.4978978, 127.0443308) // 키즈카페
               ];
           
var markerList = [];

for (var i=0, ii=1; i<ii; i++) {
    var icon = {
            url: 'assets/img/preschool.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(0, 0)
        },
        marker = new naver.maps.Marker({
            position: latlngs[i],
            map: map,
            icon: icon,
            shadow: {
                url: 'https://navermaps.github.io/maps.js/docs/img/example/shadow-pin_default.png',
                size: new naver.maps.Size(40, 35),
                origin: new naver.maps.Point(0, 0),
                anchor: new naver.maps.Point(11, 35)
            },
       		animation: naver.maps.Animation.BOUNCE
        });

    marker.set('seq', i);

    markerList.push(marker);

    marker.addListener('mouseover', onMouseOver);
    marker.addListener('mouseout', onMouseOut);
    marker.addListener('click', onClick);

    icon = null;
    marker = null;
}

for (var i=1, ii=5; i<ii; i++) {
    var icon = {
            url: 'assets/img/police.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(0, 0)
        },
        marker = new naver.maps.Marker({
            position: latlngs[i],
            map: map,
            icon: icon,
            shadow: {
                url: 'https://navermaps.github.io/maps.js/docs/img/example/shadow-pin_default.png',
                size: new naver.maps.Size(40, 35),
                origin: new naver.maps.Point(0, 0),
                anchor: new naver.maps.Point(11, 35)
            },
       		animation: naver.maps.Animation.BOUNCE
        });

    marker.set('seq', i);

    markerList.push(marker);

    marker.addListener('mouseover', onMouseOver);
    marker.addListener('mouseout', onMouseOut);
    marker.addListener('click', onClick);

    icon = null;
    marker = null;
}

for (var i=5, ii=6; i<ii; i++) {
    var icon = {
            url: 'assets/img/sobang.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(0, 0)
        },
        marker = new naver.maps.Marker({
            position: latlngs[i],
            map: map,
            icon: icon,
            shadow: {
                url: 'https://navermaps.github.io/maps.js/docs/img/example/shadow-pin_default.png',
                size: new naver.maps.Size(40, 35),
                origin: new naver.maps.Point(0, 0),
                anchor: new naver.maps.Point(11, 35)
            },
       		animation: naver.maps.Animation.BOUNCE
        });

    marker.set('seq', i);

    markerList.push(marker);

    marker.addListener('mouseover', onMouseOver);
    marker.addListener('mouseout', onMouseOut);
    marker.addListener('click', onClick);

    icon = null;
    marker = null;
}

for (var i=6, ii=9; i<ii; i++) {
    var icon = {
            url: 'assets/img/hospital.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(0, 0)
        },
        marker = new naver.maps.Marker({
            position: latlngs[i],
            map: map,
            icon: icon,
            shadow: {
                url: 'https://navermaps.github.io/maps.js/docs/img/example/shadow-pin_default.png',
                size: new naver.maps.Size(40, 35),
                origin: new naver.maps.Point(0, 0),
                anchor: new naver.maps.Point(11, 35)
            },
       		animation: naver.maps.Animation.BOUNCE
        });

    marker.set('seq', i);

    markerList.push(marker);

    marker.addListener('mouseover', onMouseOver);
    marker.addListener('mouseout', onMouseOut);
    marker.addListener('click', onClick);

    icon = null;
    marker = null;
}

for (var i=9, ii=latlngs.length; i<ii; i++) {
    var icon = {
            url: 'assets/img/kidscafe.png',
            size: new naver.maps.Size(24, 37),
            anchor: new naver.maps.Point(12, 37),
            origin: new naver.maps.Point(0, 0)
        },
        marker = new naver.maps.Marker({
            position: latlngs[i],
            map: map,
            icon: icon,
            shadow: {
                url: 'https://navermaps.github.io/maps.js/docs/img/example/shadow-pin_default.png',
                size: new naver.maps.Size(40, 35),
                origin: new naver.maps.Point(0, 0),
                anchor: new naver.maps.Point(11, 35)
            },
       		animation: naver.maps.Animation.BOUNCE
        });

    marker.set('seq', i);

    markerList.push(marker);

    marker.addListener('mouseover', onMouseOver);
    marker.addListener('mouseout', onMouseOut);
    marker.addListener('click', onClick);

    icon = null;
    marker = null;
}

var contentString = [
                     
                 [
                  '<div class="iw_inner">',
                  '   <h3>KinderGarten 유치원</h3>',
                  '   <p>서울특별시 강남구 역삼동 823-24 | 서울특별시 강남구 테헤란로14길 6 남도빌딩<br />',
                  '       02-1234-1234<br /><br />',
                  '   </p>',
                  '</div>'
         	     ].join(''),
         	    
         	    [
                 '<div class="iw_inner">',
                 '   <h3>서울강남경찰서 역삼지구대</h3>',
                 '   <p>서울특별시 강남구 역삼동 687-10 | 서울특별시 강남구 언주로108길 20<br />',
                 '       02-562-1623 | 공공,사회기관 > 지구대<br /><br />',
                 '   </p>',
                 '</div>'
        	    ].join(''),
        	    
        	    [
                 '<div class="iw_inner">',
                 '   <h3>서울수서경찰서 도곡지구대</h3>',
                 '   <p>서울특별시 강남구 역삼동 711 | 서울특별시 강남구 언주로 426 도곡지구대<br />',
                 '       02-568-2522 | 공공,사회기관 > 지구대<br /><br />',
                 '   </p>',
                 '</div>'
        	    ].join(''),
        	    
        	     [
                 '<div class="iw_inner">',
                 '   <h3>역서치안센타</h3>',
                 '   <p>서울특별시 강남구 역삼1동 830-23 | 서울특별시 강남구 역삼로 117<br />',
                 '       02-567-0073 | 공공,사회기관 > 지구대<br /><br />',
                 '   </p>',
                 '</div>'
        	    ].join(''),
        	    
        	    [
                 '<div class="iw_inner">',
                 '   <h3>서초2파출소</h3>',
                 '   <p>서울특별시 서초구 서초동 1336-1 | 서울특별시 서초구 효령로77길 37<br />',
                 '       02-581-1120 | 공공,사회기관 > 파출소<br /><br />',
                 '   </p>',
                 '</div>'
        	    ].join(''),
        	    
        	    [
                 '<div class="iw_inner">',
                 '   <h3>역삼119안전센터</h3>',
                 '   <p>서울특별시 강남구 역삼2동 771-2 | 서울특별시 강남구 역삼로 236<br />',
                 '       02-557-0109<br /><br />',
                 '   </p>',
                 '</div>'
        	    ].join(''),
        	    
        	    [
                 '<div class="iw_inner">',
                 '   <h3>강남조앤조내과소아과의원</h3>',
                 '   <p>서울특별시 강남구 역삼동 816-1 | 서울특별시 강남구 강남대로 420 역삼빌딩<br />',
                 '       02-552-8275 | 병원,의원 > 소아청소년과<br /><br />',
                 '   </p>',
                 '</div>'
        	    ].join(''),
        	    
        	    [
                 '<div class="iw_inner">',
                 '   <h3>서초연세소아과의원</h3>',
                 '   <p>서울특별시 서초구 서초동 1333 | 서울특별시 서초구 사임당로 137 신동아아파트<br />',
                 '       02-584-9981 | 병원,의원 > 소아청소년과<br /><br />',
                 '   </p>',
                 '</div>'
        	    ].join(''),
        	    
        	    [
                 '<div class="iw_inner">',
                 '   <h3>강남연세소아과의원</h3>',
                 '   <p>서울특별시 강남구 역삼동 755 | 서울특별시 강남구 역삼로 310 한솔필리아<br />',
                 '       02-508-2776 | 병원,의원 > 소아청소년과<br /><br />',
                 '   </p>',
                 '</div>'
        	    ].join(''),
        	    
        	    [
                 '<div class="iw_inner">',
                 '   <h3>키즈파라디소 </h3>',
                 '   <p>서울특별시 서초구 서초2동 1332-4 | 서울특별시 서초구 사임당로 143 영타운<br />',
                 '       02-585-1456 | 키즈카페,실내놀이터<br /><br />',
                 '   </p>',
                 '</div>'
        	    ].join(''),
        	    
        	    [
                 '<div class="iw_inner">',
                 '   <h3>연우플래너스 </h3>',
                 '   <p>서울특별시 강남구 역삼동 678-17 | 서울특별시 서초구 사임당로 143 영타운<br />',
                 '       02-555-6089 | 키즈카페,실내놀이터<br /><br />',
                 '   </p>',
                 '</div>'
        	    ].join(''),
        	    
        	    [
                 '<div class="iw_inner">',
                 '   <h3>릴리펏 역삼점</h3>',
                 '   <p>서울특별시 강남구 역삼동 772 동영문화센터 1층 | 서울특별시 강남구 언주로 337 동영문화센터 1층<br />',
                 '       02-501-9611 | 키즈카페,실내놀이터<br /><br />',
                 '   </p>',
                 '</div>'
        	    ].join('')
        	  
        	    
        	    
                ];
                     
var infowindow = [];

for (var i=0 ; i<contentString.length ; i++) {
	var infowindows = new naver.maps.InfoWindow({
		content: contentString[i]
	});
	infowindow.push(infowindows);
}

function onMouseOver(e) {
    var marker = e.overlay,
        seq = marker.get('seq');
}

function onMouseOut(e) {
    var marker = e.overlay,
        seq = marker.get('seq');
}

function onClick(e) {
    var marker = e.overlay,
  	   seq = marker.get('seq');

                     if (infowindow[seq].getMap()) {
                         infowindow[seq].close();
                     } else {
                         infowindow[seq].open(map, marker);
                     }
}

//infowindow[0].open(map,markerList[0]);

</script>

 <%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>

