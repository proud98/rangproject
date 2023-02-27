<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.mysql.cj.xdevapi.JsonArray"%>
<%@page import="memo.model.MemoDto"%>
<%@page import="java.util.List"%>
<%@page import="memo.model.MemoDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 
 	<%
 	MemoDao dao=new MemoDao();
 	
 	//전체목록 가져오기
 	List<MemoDto> list=dao.getAllMemoDatas();
 	
 	//object의 꾸러미가 array
 	JSONArray arr=new JSONArray();
 	
 	//arr에 먼저 size부터 띄워보기
 	/* JSONObject size=new JSONObject();
 	size.put("size", list.size()); //list.size()를 가져와서 size라고 key 값을 정해줌
 	arr.add(size); */
 	
 	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
 	
 	for(MemoDto dto:list){
 		
 		JSONObject ob=new JSONObject(); //객체 하나하나 담을때
 		ob.put("num", dto.getNum());
 		ob.put("writer", dto.getWriter());
 		ob.put("content", dto.getContent());
 		ob.put("avata", dto.getAvata());
 		ob.put("writeday", sdf.format(dto.getWriteday()));
 		
 		//arr에 추가하기
 		arr.add(ob);
 	}
 	%>
 	
 	<%=arr.toString()%>