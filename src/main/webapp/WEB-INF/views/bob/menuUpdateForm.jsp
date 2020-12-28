<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="preview/previewmodule.js"></script>

<style type="text/css">
.filebox input1[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}
.filebox input2[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}
.filebox input3[type="file"] {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip:rect(0,0,0,0);
    border: 0;
}

.filebox label {
    display: inline-block;
    padding: .5em .75em;
    color: #999;
    font-size: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #fdfdfd;
    cursor: pointer;
    border: 1px solid #ebebeb;
    border-bottom-color: #e2e2e2;
    border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
    display: inline-block;
    padding: .5em .75em;
    font-size: inherit;
    font-family: inherit;
    line-height: normal;
    vertical-align: middle;
    background-color: #f5f5f5;
  border: 1px solid #ebebeb;
  border-bottom-color: #e2e2e2;
  border-radius: .25em;
  -webkit-appearance: none; /* 네이티브 외형 감추기 */
  -moz-appearance: none;
  appearance: none;
}

/* imaged preview */
.filebox .upload-display {
    margin-bottom: 5px;
}

@media(min-width: 768px) {
    .filebox .upload-display {
        display: inline-block;
        margin-right: 5px;
        margin-bottom: 0;
    }
}

.filebox .upload-thumb-wrap {
    display: inline-block;
    width: 54px;
    padding: 2px;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
}

.filebox .upload-display img {
    display: block;
    max-width: 100%;
    width: 100% \9;
    height: auto;
}

.filebox.bs3-primary label {
  color: #fff;
  background-color: #82103a;
    border-color: #2e6da4;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<form name="bobUpdateOk" action="menuUpdateOk.do" method="post" enctype="multipart/form-data">
      <c:forEach var="dto" items="${list}">
        <div class = "container">
          <div style="margin-top: 50px;"><h2>${menu_date}일 식단표 수정하기</h2></div>
               <input type="hidden" name="menu_date" value="${menu_date}">
               <div class=row style="margin-top: 50px;" >
               <div class="thumbnails">
            	  <div class="col-md-4">
              		 <div class="thumbnail">
                     <p align="center" style="padding-top: 15px;"><font size="5">아침간식</font></p>                      
                     <p style="padding-top: 15px;">음식 이름 입력</p>
                     <input type="text" name="bob1_name" class="form-control" required="required" value="${dto.bob1_name}">
                     <p style="padding-top: 15px;">음식 원산지 입력</p>
			         <textarea rows="7" cols="36" name="bob1_content" required="required">${dto.bob1_content}</textarea>			         
                    <div class="filebox bs3-primary preview-image" style="margin-top: 10px;">
                     <label for="input1_file" style="margin-left: 129px;">사진올리기</label> 
                     <input type="file" id="input1_file" class="upload-hidden" name="bob_image" required="required" onchange="previewImage(this, 'div_preview1', 170, 110)" style="visibility: hidden;"> 
                    </div>
                     <p id="div_preview1" align="center"></p>                       
                     <div class="caption">                     
                     </div>
              		</div>              		
              	   </div>
              	   <div class="col-md-4">
              		 <div class="thumbnail">
                     <p align="center" style="padding-top: 15px;"><font size="5">점심</font></p>                
                    <p style="padding-top: 15px;">음식 이름 입력</p>
                    <input type="text" name="bob2_name" class="form-control" required="required" value="${dto.bob2_name}">
                     <p style="padding-top: 15px;">음식 원산지 입력</p>
                    <textarea rows="7" cols="36" name="bob2_content" required="required">${dto.bob2_content}</textarea>
                    <div class="filebox bs3-primary preview-image" style="margin-top: 10px;">
                     <label for="input2_file" style="margin-left: 129px;">사진올리기</label> 
                     <input type="file" id="input2_file" class="upload-hidden" name="bob_image" required="required" onchange="previewImage(this, 'div_preview2', 170, 110)" style="visibility: hidden;"> 
                    </div> 
                     <p id="div_preview2" align="center"></p> 
                     <div class="caption">                     
                     </div>
              		</div>              		
              	   </div>
              	   <div class="col-md-4">
              		 <div class="thumbnail">
                     <p align="center" style="padding-top: 15px;"><font size="5">오후간식</font></p>                       
                      <p style="padding-top: 15px;">음식 이름 입력</p>
                      <input type="text" name="bob3_name" class="form-control" required="required" value="${dto.bob3_name}">
                      <p style="padding-top: 15px;">음식 원산지 입력</p>
                      <textarea rows="7" cols="36" name="bob3_content" required="required">${dto.bob3_content}</textarea>
                      <div class="filebox bs3-primary preview-image" style="margin-top: 10px;">
                     <label for="input3_file" style="margin-left: 129px;">사진올리기</label> 
                     <input type="file" id="input3_file" class="upload-hidden" name="bob_image" required="required" onchange="previewImage(this, 'div_preview3', 170, 110)" style="visibility: hidden;"> 
                    </div>
                      <p id="div_preview3" align="center"></p>  
                     <div class="caption">                     
                     </div>
              		</div>              		
              	   </div>
            	 </div>           
               </div>
               <div align="center" style="margin-bottom: 50px;">          
               <button type = "submit" class="btn icon-btn btn-primary" style="width: 90px">확인</button>
               <button type = "button" class="btn icon-btn btn-primary" style="width: 90px" onclick="location.href='bobForm.do'">취소</button>
               </div>
   
       </div>
        </c:forEach>
     
</form>
 <%@include file="../footer.jsp" %>
</body>
</html>