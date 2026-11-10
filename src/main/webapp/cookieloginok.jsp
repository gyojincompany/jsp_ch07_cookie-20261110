<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8"); 
		//request객체에서 유저가 입력한 값을 추출하기 전에 utf-8 문자셋 인코딩 무조건!
		
		String mid = request.getParameter("memberId");
		String mpw = request.getParameter("memberPw");
		//유저가 입력한 아이디와 비번값 가져오기
		
		String saveCheck = request.getParameter("saveCheck"); 
		//checkbox에서 체크되어 있는 상태로 본 페이지로 이동되면 saveCheck="yes"가 됨
		//체크하지 않은 상태로 넘어오면 saveCheck=null값임				
						
		
		
		if(mid.equals("tiger") && mpw.equals("12345")) {
			session.setAttribute("sid", mid); //세션에 로그인한 유저의 아이디저장->로그인 성공
			
			if(saveCheck != null) { //true->유저가 아이디저장을 위해 체크박스에 체크를 한 상태
				
					Cookie cookie1 = new Cookie("cid", mid); //아이디 쿠키 저장
					
					//쿠키는 만든 후에 반드시 클라이언트의 웹브라우저에 전송을 해야함!
					response.addCookie(cookie1); //서버에서 클라이언트 웹브라우저로 아이디 쿠키 보내기
				
			}
			
			
			response.sendRedirect("loginSuccess.jsp");
			
		}
	%>
	<a href="cookie.jsp">쿠키 확인하기</a>
</body>
</html>