<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<head>
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
        // 로그아웃 담당 JSP로 이동
        function logoutPro(){
            location.href="logout.jsp";
        }
        function addlist() { //list 추가하기
           $('#container').append('<div class="mylist" contentEditable="true">list<button class="addCard" onclick="addCard(this)" contentEditable="false">Add Card</button></div>');
        }
        function addCard(evt) {//card 추가하기 
           $(evt).parent().append('<div class="mycard" contentEditable="true">asdfasdfasdf</div>');
         }
</script>
</head>
<body>
   <%
        if(session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
        { 
            // 로그인 화면으로 이동
            response.sendRedirect("index.html");
        }
        else // 로그인 했을 경우
        {
    %>
	<button class="addlist" onclick="addlist()">Add list</button>
	
		<div class="mylist" contentEditable="true">
		list
		<button class="addCard" onclick="addCard(this)" contentEditable=false>Add Card</button>
		<div class="mycard"></div>
	</div>

   <%} %>
</body>
</html>