<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hyperLink2</title>
</head>
<body>
  <%
  request.setCharacterEncoding("UTF-8");
  %>
  <p><%= request.getParameter("key") %></p>
</body>
</html>