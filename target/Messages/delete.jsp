<%@ page import="Messages.models.Message" %>
<%@ page import="Messages.models.MessageDao" %><%--
  Created by IntelliJ IDEA.
  User: yohal
  Date: 7/24/2023
  Time: 3:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
  <%
          String id = request.getParameter("id");
          Message message = new Message(Integer.valueOf(id));
          MessageDao messageDao = new MessageDao();
          messageDao.delete(message);
          request.getRequestDispatcher("index.jsp").forward(request, response);
          %>
  </body>
</html>
