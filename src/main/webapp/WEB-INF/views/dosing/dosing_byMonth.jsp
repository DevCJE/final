<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



 <%@include file="/WEB-INF/views/header.jsp" %>
</head>
<body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<select id="MonthDropDown" >
	<option selected disabled>월지정</option>  	
    <!-- 
  	<option value="volvo">H반 안철수</option>
  	<option value="benz">H반 김철수</option>
	 -->	
	</select>

<hr>



<div id="ChildList">
<c:forEach var = "key" items="${result}" varStatus="status">
[${status.index}]:
<fmt:formatDate pattern="yyyy-MM-dd" value="${key.dosing_date}" />
${key.child_name} <br>
</c:forEach>
</div>



<script type="text/javascript">
var click =1;
var idx = [];
var m;
var ajax=0;
var Exist=0;
$('#MonthDropDown').change(function(){
	//console.log("change test !");
	var selection = this.value; //grab the value selected
	var z = $("#MonthDropDown option:selected").index();
	////window.alert(idx[z-1]);
	ajax=1;
	ajax_month2(idx[z-1],ajax); // z 번째 idx값은 (...)이다.
	
	
});


	$("#MonthDropDown").on("mouseover",function(e){	
	
		 
	 //console.log("monthdropdown click");
	    if(click===1){ // 클릭 한번만했을때, 여러번 하면 append됨.
	    	ajax_month();
	    
	    	setTimeout(function(){ console.log("Hello"); }, 1500);
	    }	
	    click =0;	
});


/*
$("#MonthDropDown").click(function () {
	   //console.log("monthdropdown click");
	    if(click===1){ // 클릭 한번만했을때, 여러번 하면 append됨.
	    
	     // get child info
	   
	    /*
	    var checkExist = setInterval(function() {
	    	if(Exist>0){
	    		//console.log("이제 show 해도된다!");
	    		clearInterval(checkExist);
	    	}
	    
	    },10);
	   
	        
	    }
	    
	});
*/
function createXMLHttpRequest() {
	if(window.ActiveXObject) { 
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");		
	} else if(window.XMLHttpRequest) { 
	xmlHttp = new XMLHttpRequest();
	}
}

function ajax_month() {	
	var u="1";
	ajax_state=1;
	////////window.alert("ajax call !");
	createXMLHttpRequest();
	var url = "ajaxMonth.do";
	xmlHttp.onreadystatechange = loader;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);	
}

function ajax_month2(m,a) {
	////window.alert("ajax_month2");
	var u="1";
	var month;
	if(m<10){
		month = "0"+m;
	}else{
		month = m;
	}
	
	ajax_state=2;
	////////window.alert("ajax call !");
	createXMLHttpRequest();
	var url = "dosing_byMonth.do?month="+month+"&ajax="+a+"";
	xmlHttp.onreadystatechange = loader;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);	
}



function check(arr, val) {
	
	return arr.some(function(arrVal) {
		return/*if include*/val === arrVal;
	});
}


function loader() {
	if(xmlHttp.readyState == 4) {
		if(xmlHttp.status == 200) {
			temp = xmlHttp.responseText;
			var DATA = xmlHttp.responseText;
			DATA=eval('('+DATA+')'); // 소괄호를 라벨로 인식함??
			
			
			if(ajax_state === 1){
				idx = []; // clear idx
				//console.log(DATA);
				var ele = document.getElementById('MonthDropDown');
				for(var i=0;i<DATA.data.length;i++){
					var option = document.createElement("option");
					var indexnum = parseInt(DATA.data[i].date);
					//console.log("idx: "+idx);
					
					//console.log("check(idx,indexnum): "+check(idx,indexnum));
					if(!(check(idx,indexnum))){
						idx.push(indexnum);
						option.text = DATA.data[i].date+"월";
						ele.add(option);
						Exist = 1;
					}
					}
					
				}
			if(ajax_state === 2){
				//console.log('ajax Test Final');
				////window.alert(DATA);
				
				var ele = document.getElementById('ChildList');
				ele.innerHTML = "";
				
				for(var i=0;i<DATA.data.length;i++){
					
					var innerSpan = document.createElement("span");
					innerSpan.className = 'block-2';
					ele.appendChild(innerSpan);
					innerSpan.innerHTML = "idx="+DATA.data[i].idx+"<br>child_name: "+DATA.data[i].name+"<br> dosing_data: "+DATA.data[i].date+"<br><br>";
					
				}
				
				
			}
				
			}

		}
	}


</script>

</body>
</html>