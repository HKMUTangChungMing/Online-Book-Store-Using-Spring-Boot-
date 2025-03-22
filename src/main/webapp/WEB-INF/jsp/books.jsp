<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Book management</title>
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
                <span>Book management</span>
            </div>
            <div class="side-menu">
                <ul>
                    <li onclick="location.href='books'" class="on"><a href="#">Book management</a></li>
                    <li  onclick="location.href='users'"><a href="#">User Management</a></li>
                    <li  onclick="location.href='comments'" ><a href="#">Comment management</a></li>
                    <li  onclick="location.href='allorder'"><a href="#">Order management</a></li>
                </ul>
            </div>
            <div class="user-content-r user-contact">
                <div class="user-contact-table">
                    <button class="purchase" onclick="location.href='dobook'">New</button>
                    <ul class="user-contact-thead">
                        <li class="contact-th provide">book title</li>
                        <li class="contact-th accept">author</li>
                        <li class="contact-th addr">price</li>
                        <li class="contact-th phone">Introduction</li>
                        <li class="contact-th operation">operate</li>
                    </ul>
                    <ul class="user-contact-tbody">
                        <c:forEach items="${books}" var="book">
                            <li class="contact-tr">
                                <div class="contact-td provide">${book.name}</div>
                                <div class="contact-td accept" style="width: 180px">${book.author}</div>
                                <div class="contact-td addr">$${book.price}</div>
                                <div class="contact-td phone"><p>${book.intro}</p></div>
                                <div class="contact-td operation" style="width: 180px">
                                    <a href="dobook?id=${book.id}">edit</a>
                                    <a href="javascript:void(0)" style="color: #e03550" onclick="del(${book.id})">delete</a>
                                    <a href="docomment?bid=${book.id}" style="color: #5cb85c">Add comment</a>
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
                    window.location.href = "delbook?id="+id;
                }
            }
        </script>
    </body>
</html>