<%@page import="data.dao.SmartDao"%>
<%@page import="data.dto.SmartDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	
	<%
	request.setCharacterEncoding("utf-8");
	
	SmartDto dto=new SmartDto();
	
	String writer=request.getParameter("writer");
	String content=request.getParameter("content");
	String subject=request.getParameter("subject");
	
	
	
	dto.setWriter(writer);
	dto.setContent(content);
	dto.setSubject(subject);
	
	
	SmartDao dao=new SmartDao();
	dao.insertSmart(dto);
	
	//max-num값 얻기
	int maxNum=dao.getMaxNum();
	
	response.sendRedirect("../index.jsp?main=board/detailview.jsp?num="+maxNum+"&currentPage=1");
	//글쓰기 작성후 내글로 페이지 이동하고 목록버튼 누르면 햔재페이지 목록으로 얻기
	%>
