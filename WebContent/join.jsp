<%@ page import="ShareIt.MysqlDBHandle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("join_id");
	String pw = request.getParameter("join_pw");
	String email = request.getParameter("join_email");
	
	MysqlDBHandle db = new MysqlDBHandle();
	boolean b = db.join(id, pw, email);
	if(b){
		%>
<script> alert("회원가입이 완료되었습니다.");</script>
<%   
		response.sendRedirect("index.html");
		}
	else
		out.print("join fail");
%>