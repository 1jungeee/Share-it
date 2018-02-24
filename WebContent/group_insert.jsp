<%@ page import="ShareIt.MysqlDBHandle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%


	String group_id = request.getParameter("group_id");
	String group_name = request.getParameter("group_name");
	
	System.out.println("======>"+group_id);
	System.out.println("=======>"+group_name);
	MysqlDBHandle db = new MysqlDBHandle();

	boolean b = db.group_insert(group_id, group_name);
if(b)
		out.print("group_insert insert");
	else
		out.print("group_insert fail");
%>
