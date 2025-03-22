<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Comment management</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <jsp:include page="common.jsp" flush="true"/>
        <header>
            <jsp:include page="header.jsp" flush="true"/>
        </header>
        <div class="container user-order">
            <div class="breadcrumb">
                <span  onclick="location.href='index'">front page></span>
                <span>manage></span>
                <span>Comment management</span>
            </div>
            <div class="side-menu">
                <ul>
                    <li onclick="location.href='books'"><a href="#">Book management</a></li>
                    <li  onclick="location.href='users'"><a href="#">User Management</a></li>
                    <li  onclick="location.href='comments'" class="on" ><a href="#">Comment management</a></li>
                    <li  onclick="location.href='allorder'"><a href="#">Order management</a></li>
                </ul>
            </div>
            <div class="user-content-r user-contact">
                <div class="user-contact-table">
                    <ul class="user-contact-thead">
                        <li class="contact-th accept">Review books</li>
                        <li class="contact-th provide">Comment account</li>
                        <li class="contact-th addr">Comment time</li>
                        <li class="contact-th phone"><p>comments</p></li>
                        <li class="contact-th operation">operation</li>
                    </ul>
                    <ul class="user-contact-tbody">
                        <c:forEach items="${comments}" var="comment">
                            <li class="contact-tr">
                                <div class="contact-td provide">${comment.bname}</div>
                                <div class="contact-td accept">${comment.uname}</div>
                                <div class="contact-td addr">${comment.createtime}</div>
                                <div class="contact-td phone"><p>${comment.content}</p></div>
                                <div class="contact-td operation">
                                    <a href="javascript:void (0)" style="color: #e03550" onclick="del(${comment.id})">delete</a>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
        <script>
            function del(id) {
                if (confirm("confirm to delete?")) {
                    window.location.href = "delComment?id="+id;
                }
            }
        </script>
    </body>
</html>