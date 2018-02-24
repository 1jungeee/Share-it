<%@ page import="ShareIt.MysqlDBHandle" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String id = request.getParameter("login_id");
	String pw= request.getParameter("login_pw");
	
	
	MysqlDBHandle db = new MysqlDBHandle();
	//int check = db.login(id, pw); //DB연동시
	int check = 1; //DB미연동 테스트시
	if(check==1){
		session.setAttribute("sessionID", id);
		response.sendRedirect("add_board.jsp");
	}
	else if(check==0){
		%> <script> alert("비밀번호가 다릅니다============>.");
		history.go(-1); </script> <%     
	}else if(check==-1){
		%> <script> alert("아이디가 없습니다------------>");
		history.go(-1); </script> <%   
	}
%> 