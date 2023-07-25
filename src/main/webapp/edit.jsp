<%@ page import="Messages.models.MessageDao" %>
<%@ page import="Messages.models.Message" %><%--
  Created by IntelliJ IDEA.
  User: yohal
  Date: 7/24/2023
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit message</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>
<body>
<!-- Modal -->

<div class="modal-dialog">
    <div class="modal-content">
        <form action="edit.jsp" method="post">
            <div class="modal-header">
                <h1 class="modal-title fs-5">Edit message</h1>
            </div>
            <div class="modal-body">

                <div class="mb-3">
                    <input type="hidden" name="id" value="<%=request.getParameter("id")%>">
                    <label>Enter a message</label>
                    <textarea class="form-control" name="message" rows="3"><%=request.getParameter("message")%>
                    </textarea>
                </div>
                <div class="mb-3">
                    <label>Author</label>
                    <input type="text" name="author" class="form-control" value="<%=request.getParameter("author")%>">
                </div>

            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" name="send">Save changes</button>
                <a href="index.jsp" type="submit" class="btn btn-danger">Return</a>
            </div>
        </form>
    </div>
</div>

    <%
        MessageDao messageDao = new MessageDao();
        String id = request.getParameter("id");
        if(request.getParameter("send") != null){

            Message message = new Message(
                    Integer.parseInt(id.trim()),
                    request.getParameter("message"),
                    request.getParameter("author"));
            messageDao.update(message);
        }

    %>
  </body>
</html>
