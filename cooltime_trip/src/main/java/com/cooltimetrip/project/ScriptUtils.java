package com.cooltimetrip.project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ScriptUtils {// 자바 클래스에서 뷰페이지에 자바스크립트(경고, 확인창 등) 사용하기 위함
	
	public static void init(HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
	}
	
	// alert 경고창 띄우기
	public static void alert(HttpServletResponse response
							, String alertText) throws IOException {
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>alert('"+alertText+"');</script>");
		out.flush();		
	}
	
	// alert 경고창 띄우고 다음 페이지 이동
	public static void alertAndMovePage(HttpServletResponse response
										, String alertText
										, String nextPage) throws IOException {
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>alert('"+alertText+"');)"
				+ "location.href='"+ nextPage
				+ "';</script>");
		out.flush();
	}
	
	// alert 경고창 띄우고 이전 페이지 이동
	public static void alertAndBackPage(HttpServletResponse response
										, String alertText) throws IOException {
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>alert('"+alertText+"');)"
				+ "history.go(-1);</script>");
	}
	
	// confirm 확인창 띄우기
	public static void confirm(HttpServletResponse response
								, String confirmText) throws IOException {
		init(response);
		PrintWriter out = response.getWriter();
		out.println("<script>confirm('"+confirmText+"');");
	}
	
	
	
}
