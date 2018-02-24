<%@ page import="ShareIt.MysqlDBHandle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
	String jsp_group_id = request.getParameter("html_group_id");
	String jsp_board_id = request.getParameter("html_board_id");
	String jsp_board_name = request.getParameter("html_board_name");
	
	out.println(jsp_board_id);
	out.println(jsp_board_name);
	out.println(jsp_group_id);
	MysqlDBHandle db = new MysqlDBHandle();

	boolean b = db.board_insert(jsp_board_id, jsp_board_name, jsp_group_id);
/* 	if(b)
		out.print("db insert");
	else
		out.print("insert fail");
			 */
%>