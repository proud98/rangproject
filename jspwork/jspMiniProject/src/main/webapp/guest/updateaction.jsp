<%@page import="data.dao.MemberDao"%>
<%@page import="data.dao.GuestDao"%>
<%@page import="data.dto.GuestDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
	
	<%
	
	
	//db에 저장 할 아이디를 세션으로부터 가져오기
	String myid=(String)session.getAttribute("myid");
	
	//이미지가 업로드 되는 실제 경로 구하기
	String realPath=getServletContext().getRealPath("/save");
	//getServletContext()안에 getRealPath가 있고 저장 하는 가상 폴더 이름은 save
	System.out.println(realPath);
	
	int uploadSize=1024*1024*2; //2mb
	MultipartRequest multi=null;
	
	try{
	multi=new MultipartRequest(request,realPath,uploadSize,"utf-8", new DefaultFileRenamePolicy());
	
	//multi변수로 모든 폼데이터 읽어오기
	String content=multi.getParameter("ucontent");
	String photoname=multi.getFilesystemName("uphoto");
	String num=multi.getParameter("num");
	String currentPage=multi.getParameter("currentPage"); //페이비전호 읽기
	

	//dao선언
	GuestDao dao=new GuestDao();
	
	//기존의 photo 가져오기
	String gu_photoname=dao.getData(num).getPhotoname(); //num값의 따른 photoname을 가져와서 기존의 photoname을 가여와줌(그걸 gu_photoname이라고 지정)
	
	//dto에 저장
	GuestDto dto=new GuestDto();
	dto.setMyid(myid);
	dto.setContent(content);
	dto.setPhotoname(photoname==null?gu_photoname:photoname); //사진 수정 안하면(null) 기존거 그대로넣고 null이 아니면 수정한 포토네임으로 
	dto.setNum(num);
	
	dao.updateGuest(dto);
	
	//방명록 목록으로 이동
	response.sendRedirect("../index.jsp?main=guest/guestlist.jsp?currentPage="+currentPage);	
	}catch(Exception e){
		System.out.println("업로드 오류"+e.getMessage());
	}
	%>