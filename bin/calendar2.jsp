<%@ page contentType="text/html; charset=UTF-8" import="java.util.*"%>
<%@page import="java.text.*" import="java.text.SimpleDateFormat"
	import="java.util.Date"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>calendar2</title>
</head>
<body>
	<%
	Map map = new HashMap();
	map.put("2022/01/01", "元旦");
	map.put("2022/1/2", "書初め");
	map.put("2022/10/31", "ハロウィン");
	map.put("2022/12/24", "クリスマス");
	map.put("2022/12/25", "クリスマスイブ");
	map.put("2022/1/10", "成人の日");
	map.put("2022/2/14", "バレンタインデー");
	map.put("2022/3/14", "ホワイトデー");
	map.put("2022/4/1", "エイプリルフール");
	map.put("2022/2/11", "建国記念日");
	map.put("2022/2/23", "天皇誕生日");
	map.put("2022/3/21", "春分の日");
	map.put("2022/4/29", "昭和の日");
	map.put("2022/5/3", "憲法記念日");
	map.put("2022/5/4", "みどりの日");
	map.put("2022/5/5", "子供の日");
	map.put("2022/7/18", "海の日");
	map.put("2022/8/11", "山の日");
	map.put("2022/9/19", "敬老の日");
	map.put("2022/9/23", "秋分の日");
	map.put("2022/10/10", "スポーツの日");
	map.put("2022/11/3", "文化の日");
	%>
	<%
	String calendarTx = request.getParameter("koyomi");
	pageContext.setAttribute("date", calendarTx);
	%>
	<fmt:parseDate var="date" value="${date}" pattern="yyyy/MM/dd" />
	<li><fmt:formatDate value="${date}" pattern=" yyyy/MM/dd(E)"/></li>


</body>
</html>