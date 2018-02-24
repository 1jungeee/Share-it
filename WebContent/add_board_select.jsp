<%@ page import="ShareIt.MysqlDBHandle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String jsp_group_id = request.getParameter("html_group_id");
	//out.println(jsp_group_id);
	MysqlDBHandle db = new MysqlDBHandle();

	boolean b = db.board_select(jsp_group_id);

	out.print(db.board_array.toJSONString());
%>