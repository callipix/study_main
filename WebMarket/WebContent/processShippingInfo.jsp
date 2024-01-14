<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.net.URLEncoder"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	Enumeration en = request.getParameterNames();
	Cookie[] cookies = new Cookie[6];
	int cnt = 0;
	
	while(en.hasMoreElements()){
		String paramName = (String)en.nextElement();
		
		out.println("<p>paramName : " + paramName + "</p>");
		cookies[cnt] = new Cookie("Shipping_"+paramName , URLEncoder.encode(request.getParameter(paramName), "utf-8"));
		
		cookies[cnt].setMaxAge(1800);
		response.addCookie(cookies[cnt]);
		cnt++;
	}

/* 	Cookie cartId = new Cookie("Shipping_cartId", URLEncoder.encode(request.getParameter("cartId"), "utf-8"));
	Cookie name = new Cookie("Shipping_name", URLEncoder.encode(request.getParameter("name"), "utf-8"));
	Cookie shippingDate = new Cookie("Shipping_shippingDate",	URLEncoder.encode(request.getParameter("shippingDate"), "utf-8"));
	Cookie country = new Cookie("Shipping_country",	URLEncoder.encode(request.getParameter("country"), "utf-8"));
	Cookie zipCode = new Cookie("Shipping_zipCode",	URLEncoder.encode(request.getParameter("zipCode"), "utf-8"));
	Cookie addressName = new Cookie("Shipping_addressName",	URLEncoder.encode(request.getParameter("addressName"), "utf-8"));

	cartId.setMaxAge(24 * 60 * 60);
	name.setMaxAge(24 * 60 * 60);
	zipCode.setMaxAge( 24 * 60 * 60);
	country.setMaxAge(24 * 60 * 60);
	addressName.setMaxAge(24 * 60 * 60);

	response.addCookie(cartId);
	response.addCookie(name);
	response.addCookie(shippingDate);
	response.addCookie(country);
	response.addCookie(zipCode);
	response.addCookie(addressName); */

	response.sendRedirect("orderConfirmation.jsp");
%>
