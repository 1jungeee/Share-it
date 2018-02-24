<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>메인 화면</title>
<link rel="stylesheet" href="css/common.css">
<style>
#myboard {
	border: 1px solid red;
}

#mycard {
	border: 1px solid blue;
}
</style>
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
        
        // 로그아웃 담당 JSP로 이동
        function logoutPro(){
            location.href="logout.jsp";
        }
        function addBoard() { //board 추가하기
        	$('body').append('<br><div id="myboard">board<button id="addCard" onclick="addCard()">Add Card</button></div>');
		}
        function addCard() {//card 추가하기
			$('#myboard').parent().append('<div id="mycard">card<button id="addCard" onclick="addCard()">Add Card</button></div>');
		}
    </script>
</head>
<body>

<header>
        <a class="logo" href="#"><img src="image/logo.png"></a>
        <nav>
            <ul>
                <li><a href="#" class="info">사이트 정보</a></li>
                <li><a href="#login" class="login">로그인</a></li>
                <li><a href="#signup" class="signup">회원가입</a></li>
            </ul>
        </nav>
    </header>

	<%
        if(session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
        { 
            // 로그인 화면으로 이동
            response.sendRedirect("index.html");
        }
        else // 로그인 했을 경우
        {
    %>
	<h2>
		<font color="red"><%=session.getAttribute("sessionID") %></font> 님
		로그인되었습니다.
	</h2>
	<br>
	<br>
	<input type="button" value="로그아웃" onclick="logoutPro()" />
	<br>
	<br>
	<b><font size="5" color="skyblue">메인화면입니다.</font></b>
	<br>
	<button onclick="addBoard()">Add Board</button>

	<div id="myboard">
		board
		<div id="mycard">
			<button id="addCard" onclick="addCard()">Add Card</button>
		</div>
	</div>

	<%} %>
</body>
</html>