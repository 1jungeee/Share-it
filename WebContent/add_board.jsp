<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<link rel="stylesheet" href="css/common.css">
<script src="js/jquery-3.2.1.min.js"></script>
<script>
	var group_id = sessionStorage.group_id;
	$(function() {
		$("#add_board").click(
				function() {
					/* sessionStorage.group_id = prompt("group_id : ");
					sessionStorage.group_name = prompt("group_name : ");
					insert_group(); */
					
					//sessionStorage.board_id = prompt("id : ");
					sessionStorage.board_name = prompt("name : ");
					$(".board > .wrap").prepend(
							"<div onclick=fn()>" + sessionStorage.board_name + "</div>");
					$(".board > .wrap").children().first().attr("id", sessionStorage.board_id); //id -> db의 보드 id
					$(".board > .wrap").children().first().attr("name", sessionStorage.board_name); //name -> db의 보드 name    
					insert_board();

					select_board();
				});
	});

	function fn() {
		$("#container").load("add_list.jsp");
	}

	function insert_group() {
		group_id = sessionStorage.group_id;
		group_name = sessionStorage.group_name;
 		console.log( group_id, group_name)
		data = {'group_id':group_id, 'group_name':group_name}
		$('#mydiv1').load( 'group_insert.jsp' , data )
		
/* 		xmlHttp = new XMLHttpRequest()
		g = `group_insert.jsp?group_id=${group_id}&group_name=${group_name}`
		g = `group_insert.jsp?group_id=${group_id}&group_name=${group_name}`
		console.log("======>"+ g )
				console.log(group_id, group_name)
		xmlHttp.open("GET", g)
		xmlHttp.send() */
	}
	
	function insert_board() {
		group_id = sessionStorage.group_id;
 		temp_a = sessionStorage.board_id;
		temp_b = sessionStorage.board_name;

		data = { 'html_group_id':group_id, 'html_board_id':temp_a, 'html_board_name':temp_b}
		$('#mydiv2').load( 'add_board_insert.jsp', data)
/*		xmlHttp = new XMLHttpRequest()
s = `add_board_insert.jsp?html_group_id=${group_id}&html_board_id=${temp_a}&html_board_name=${temp_b}`
		xmlHttp.open("GET", s)
		xmlHttp.send()
 */	
 	}
	
	function select_board() {
		group_id = sessionStorage.group_id;
		console.log("group id"+group_id);
		xmlHttp = new XMLHttpRequest();
		xmlHttp.onreadystatechange = on_ready_json;
		a = `add_board_select.jsp?html_group_id=${group_id}`
				console.log(group_id)
		xmlHttp.open("GET", a)
		xmlHttp.send();
	}

	function on_ready_json() {
		if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
			s = xmlHttp.responseText
			console.log(s);
			myj = JSON.parse(s);
			console.log(typeof (myj));
			myj.forEach(function(v, i) {
				$("#wrap").prepend(
						"<div onclick=fn()>" + v.board_name + "</div>");

				/* tr = mytable.insertRow()
				c1 = tr.insertCell()
				c2 = tr.insertCell()
				c1.innerText = v.board_id;
				c2.innerText = v.board_name; */
			})
		}
	}
	function logoutPro() {
		location.href = "logout.jsp";
	}
</script>
</head>

<body class="board">
<header>
   <a class="logo" href="http://localhost:8080/ShareIt_2/index.html"><img src="image/logo.png"></a>
   <nav>
       <ul>
           <li><a href="#" class="b_add">보드 추가</a></li>
           <li><a href="#" class="info">사이트 정보</a></li>
           <li><a href="#" class="membership" onclick="javascript:logoutPro()">회원정보</a></li>
       </ul>
    </nav>
	<h2><font color="red"><%=session.getAttribute("sessionID")%></font> 님이 로그인되었습니다.</h2>
 </header>
	<%
		if (session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
		{
			// 로그인 화면으로 이동
			response.sendRedirect("index.html");
		} else // 로그인 했을 경우
		{
	%>
	<div id="container" class="wrap">
		<div id="add_board">create board +</div>
	</div>
	<%
		}
	%>
	
	
	
	<footer>
        <div class="footer">
                    <div class="footer1">
                        <h3>Location</h3><br>
                        <p>
                            Dongguk University <br> SK Didimdol
                        </p>
                    </div>

                    <div class="footer2">
                        <h3>Member Instargram</h3><br>
                        <ul class="list-inline">
                            <li><a href="https://www.instagram.com/1jungeee/"><img
                                    src="image/instagram1.png" alt="김원정"></a></li>
                            <li><a href="https://www.instagram.com/archie.kimm/"><img
                                    src="image/instagram2.png" alt="김아롬"></a></li>
                            <li><a href="#"><img src="image/instagram3.png"
                                                 alt="옥지훈"></a></li>
                            <li><a href="https://www.instagram.com/phs_891010/"><img
                                    src="image/instagram4.png" alt="박형선"></a></li>
                        </ul>
                    </div>
                    <div class="footer3">
                        <h3>About</h3><br>
                        <p>
                            "Share-it" is project management system.<br>"Share-it" is similar to the "Trello".
                        </p>
                    </div>
        </div>
        <div class="footer4">
                <div>Copyright &copy; Web Front End</div>
        </div>
    </footer>
</body>
</html>