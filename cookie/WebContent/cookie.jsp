<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-1.9.1.js"></script>
<script type="text/javascript">
$(function(){
	$("#ckCreate").click(function(){
		var ckName = $("#ckName").val();
		var ckValue = $("#ckValue").val();
		setCookie(ckName, ckValue, 7);
		$("#ckViewListDiv").append(getCookie(ckName));	
	});

	$("#ckView").click(function(){
		var ckViewName = $("#ckViewName").val();
		$("#ckViewDiv").append(getCookie(ckViewName));	
	});
	var setCookie = function (cName, cValue, cDay){
	    var expire = new Date();
	    expire.setDate(expire.getDate() + cDay);
	    cookies = cName + '=' + escape(cValue) + '; path=/ '; // 한글 깨짐을 막기위해 escape(cValue)를 합니다.
	    if(typeof cDay != 'undefined') cookies += ';expires=' + expire.toGMTString() + ';';
	    document.cookie = cookies;
	}

	// 쿠키 가져오기
	var getCookie = function (cName) {
	    cName = cName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cName);
	    var cValue = '';
	    if(start != -1){
	        start += cName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cValue = cookieData.substring(start, end);
	    }
	    return unescape(cValue);
	}
});
</script>
</head>
<body>
쿠키 이름 <input type="text" id = "ckName"><br/>
쿠키 값 <input type="text" id = "ckValue"><br/>
<button id = "ckCreate"> 쿠키 생성</button><br/>
쿠키 리스트 <br/>
<div id = "ckViewListDiv">

</div>
<hr/>

볼 쿠키 리스트 <input type="text" id = "ckViewName"><br/>
<button id = "ckView"> 쿠키 보기</button><br/>
<div id = "ckViewDiv">
</div>
<hr/>
<button id = "ckDelete"> 쿠키 삭제</button>

</body>
</html>