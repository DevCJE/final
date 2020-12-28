<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style TYPE="text/css">

#calendar .date {
    text-align: center;
    margin-bottom: 5px;
    padding: 4px;
    background: #333;
    color: #fff;
    width: 30px;
    border-radius: 50%;
    float: right;
}
body {
    font-family: Tahoma;
}

header {
    text-align: center;
}

#calendar {
    width: 100%;    
}

#calendar a {
    color: #8e352e;
    text-decoration: none;
}

#calendar ul {
    list-style: none;
    padding: 0;
    margin: 0;
    width: 100%;
}

#calendar li {
    display: block;
    float: left;
    width:14.342%;
    padding: 5px;
    box-sizing:border-box;
    border: 1px solid #ccc;
    margin-right: -1px;
    margin-bottom: -1px;
}

#calendar ul.weekdays {
    height: 40px;
    background: #8e352e;
}

#calendar ul.weekdays li {
    text-align: center;
    text-transform: uppercase;
    line-height: 20px;
    border: none !important;
    padding: 10px 6px;
    color: #fff;
    font-size: 13px;
}

#calendar .days li {
    height: 170px;
}

#calendar .days li:hover {
    background: #d3d3d3;
}



#calendar .event {
    clear: both;
    display: block;
    font-size: 13px;
    border-radius: 4px;
    padding: 5px;
    margin-top: 40px;
    margin-bottom: 5px;
    line-height: 14px;
    background: #e4f2f2;
    border: 1px solid #b5dbdc;
    color: #009aaf;
    text-decoration: none;
}

#calendar .event-desc {
    color: #666;
    margin: 3px 0 7px 0;
    text-decoration: none;  
}

#calendar .other-month {
    background: #f5f5f5;
    color: #666;
}

/* ============================
                Mobile Responsiveness
   ============================*/


@media(max-width: 768px) {

    #calendar .weekdays, #calendar .other-month {
        display: none;
    }

    #calendar li {
        height: auto !important;
        border: 1px solid #ededed;
        width: 100%;
        padding: 10px;
        margin-bottom: -1px;
    }

    #calendar .date {
        float: none;
    }

</style>
<!-- ************************************************* -->
<script>
/*!
//Snow.js - v0.0.3
//kurisubrooks.com
*/

//Amount of Snowflakes
var snowMax = 35;

//Snowflake Colours
var snowColor = ["#DDD", "#EEE"];

//Snow Entity
var snowEntity = "&#x2022;";

//Falling Velocity
var snowSpeed = 0.75;

//Minimum Flake Size
var snowMinSize = 8;

//Maximum Flake Size
var snowMaxSize = 24;

//Refresh Rate (in milliseconds)
var snowRefresh = 50;

//Additional Styles
var snowStyles = "cursor: default; -webkit-user-select: none; -moz-user-select: none; -ms-user-select: none; -o-user-select: none; user-select: none;";

/*
//End of Configuration
//----------------------------------------
//Do not modify the code below this line
*/

var snow = [],
	pos = [],
	coords = [],
	lefr = [],
	marginBottom,
	marginRight;

function randomise(range) {
	rand = Math.floor(range * Math.random());
	return rand;
}

function initSnow() {
	var snowSize = snowMaxSize - snowMinSize;
	marginBottom = document.body.scrollHeight - 5;
	marginRight = document.body.clientWidth - 15;

	for (i = 0; i <= snowMax; i++) {
		coords[i] = 0;
		lefr[i] = Math.random() * 15;
		pos[i] = 0.03 + Math.random() / 10;
		snow[i] = document.getElementById("flake" + i);
		snow[i].style.fontFamily = "inherit";
		snow[i].size = randomise(snowSize) + snowMinSize;
		snow[i].style.fontSize = snow[i].size + "px";
		snow[i].style.color = snowColor[randomise(snowColor.length)];
		snow[i].style.zIndex = 1000;
		snow[i].sink = snowSpeed * snow[i].size / 5;
		snow[i].posX = randomise(marginRight - snow[i].size);
		snow[i].posY = randomise(2 * marginBottom - marginBottom - 2 * snow[i].size);
		snow[i].style.left = snow[i].posX + "px";
		snow[i].style.top = snow[i].posY + "px";
	}

	moveSnow();
}

function resize() {
	marginBottom = document.body.scrollHeight - 5;
	marginRight = document.body.clientWidth - 15;
}

function moveSnow() {
	for (i = 0; i <= snowMax; i++) {
		coords[i] += pos[i];
		snow[i].posY += snow[i].sink;
		snow[i].style.left = snow[i].posX + lefr[i] * Math.sin(coords[i]) + "px";
		snow[i].style.top = snow[i].posY + "px";

		if (snow[i].posY >= marginBottom - 2 * snow[i].size || parseInt(snow[i].style.left) > (marginRight - 3 * lefr[i])) {
			snow[i].posX = randomise(marginRight - snow[i].size);
			snow[i].posY = 0;
		}
	}

	setTimeout("moveSnow()", snowRefresh);
}

for (i = 0; i <= snowMax; i++) {
	document.write("<span id='flake" + i + "' style='" + snowStyles + "position:absolute;top:-" + snowMaxSize + "'>" + snowEntity + "</span>");
}

window.onresize = resize;
window.onload = initSnow;

</script>
<!-- ************************************************* -->
</head>
<body>
<%@include file="../header.jsp" %>
<div align="center" style="margin-bottom: 90px; margin-top: 60px;">

<div class="container">

		<div id="calendar-wrap">

			
	<c:set var="newLine" value="0"/>

			<c:url var="pURL" value="monthCalender.do?">
				<c:if test="${cal.month-1>=1 && cal.month-1<=12 }">
				<c:param name="year" value="${cal.year }"/>
				</c:if>
				<c:if test="${cal.month-1<1}">
				<c:param name="year" value="${cal.year-1 }"/>
				</c:if>
				<c:param name="month" value="${cal.month-1 }"/>
			</c:url>
			<div><h2><a href="${pURL}"><font size="5">&lt;&lt;</font></a>
			<font size="6">${cal.year }년 ${cal.month }월</font>
			<c:url var="pURL2" value="monthCalender.do?">
				<c:if test="${cal.month+1>=1&&cal.month+1<=12 }">
					<c:param name="year" value="${cal.year }"/>
				</c:if>
				<c:if test="${cal.month+1>12 }">
					<c:param name="year" value="${cal.year+1}"/>
				</c:if>
				<c:param name="month" value="${cal.month+1 }"/>
			</c:url>
			<a href="${pURL2 }"><font size="5">&gt;&gt;</font></a></h2></div>
		
		
	

		<div id="calendar" style="margin-top: 50px;">
		
       <ul class="weekdays">
       <li>일</li>
       <li>월</li>
       <li>화</li>
       <li>수</li>
       <li>목</li>
       <li>금</li>
       <li>토</li>       
       </ul>
     
         
		<c:forEach var="i" begin="1" end="${cal.startday -1}">
			<c:set var="newLine" value="${newLine+1 }"/>
			<ul class="days">
            <li class="day">
			<div>&nbsp;</div>
			</li>
			</ul>
		</c:forEach>
		 
		<c:forEach var="i" begin="1" end="9">     
			<ul class="days">
			<li class="day">
			<div class="date">${i }</div>			
		    
			<c:set var = "m" value="${cal.year}-${cal.month}-0${i} 00:00:00.0" />
			<c:set var = "date" value="${cal.year}-${cal.month}-0${i}"/>
			<c:forEach var="dto" items="${list}">
			<c:if test="${dto.menu_date==m}">
			<br>
			<br>
			<a href="menuChart.do?calender=${date}">${dto.bob1_name}</a><br>
			<a href="menuChart.do?calender=${date}">${dto.bob2_name}</a><br>
			<a href="menuChart.do?calender=${date}">${dto.bob3_name}</a>			
			</c:if>			
			</c:forEach>
		
			<c:set var="newLine" value="${newLine+1 }"/>
			
			<c:if test="${newLine==7}">
		        <br>
				<c:if test="${i<cal.enddate}">
					<br>
                </c:if>
				<c:set var="newLine" value="0"/>
			</c:if>	
			
			</li>
			</ul>		
		    </c:forEach>
	
		    <c:forEach var="i" begin="10" end="${cal.enddate}">     
			<ul class="days">
			<li class="day">
			<div class="date">${i }</div>			
			<c:set var = "m" value="${cal.year}-${cal.month}-${i} 00:00:00.0" />
			<c:set var = "date" value="${cal.year}-${cal.month}-${i}"/>
			<c:forEach var="dto" items="${list}">
			<c:if test="${dto.menu_date==m}">
			<br>
			<br>
			<a href="menuChart.do?calender=${date}">${dto.bob1_name}</a><br>
			<a href="menuChart.do?calender=${date}">${dto.bob2_name}</a><br>
			<a href="menuChart.do?calender=${date}">${dto.bob3_name}</a>
			</c:if>
			</c:forEach>
			
			</li>
			</ul>
			<c:set var="newLine" value="${newLine+1 }"/>
			
			<c:if test="${newLine==7}">
		        <br>
				<c:if test="${i<cal.enddate}">
					<br>
				</c:if>
				<c:set var="newLine" value="0"/>
			</c:if>
			
		    </c:forEach>
		    <c:forEach var="i" begin="${newLine+1}" end="7" step="1">
			<ul class="days">
            <li class="day">
			<div>&nbsp;</div>
			</li>
			</ul>
		    </c:forEach>
	  
  </div>
  </div>
  
</div>
	
	
</div>
<%@include file="../footer.jsp" %>
</body>
</html>

