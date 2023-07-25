<%@ page import="Messages.models.MessageDao" %>
<%@ page import="Messages.models.Message" %>
<%@ page import="java.util.*" %><%--
  Created by IntelliJ IDEA.
  User: yohal
  Date: 7/21/2023
  Time: 3:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Messages</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

</head>
<body>
<!-- Button trigger modal -->


<!-- Modal -->
<div class="container">
    <div class="modal-dialog ">
        <div class="modal-content">
            <form action="index.jsp" method="post">
            <div class="modal-header">
                <h1 class="modal-title fs-5">Create message</h1>
            </div>
            <div class="modal-body">

                    <div class="mb-3">
                        <label>Enter a message</label>
                        <textarea class="form-control" name="message" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label>Author</label>
                        <input type="text" name="author" class="form-control">
                    </div>

            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary" name="send">Send</button>
            </div>
            </form>
        </div>
    </div>
    <%
        MessageDao messageDao = new MessageDao();
        if(request.getParameter("send") != null){
            Message message = new Message(request.getParameter("message"), request.getParameter("author"));
            messageDao.insert(message);
        }

    %>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5">All the messages</h1>
            </div>
            <%
                //MessageDao messageDao = new MessageDao();
                List<Message> messages = messageDao.select();
                Collections.reverse(messages);
                for (Message message : messages) {


            %>
            <div class="modal-body">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title"><%=message.getAuthor()%></h5>
                        <p class="card-text"><%=message.getMessage()%></p>
                        <p class="blockquote-footer"><cite><%=message.getDate()%></cite></p>
                        <a href="edit.jsp?id=<%=message.getId()%>
                        &&message=<%=message.getMessage()%>
                        &&author=<%=message.getAuthor()%>" class="card-link">Edit</a>
                        <a href="delete.jsp?id=<%=message.getId()%>" class="card-link">Delete</a>
                    </div>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</div>
</body>
</html>
