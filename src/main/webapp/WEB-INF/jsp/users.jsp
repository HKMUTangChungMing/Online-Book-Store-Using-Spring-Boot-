<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>User Management</title>
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
                <span>User Management</span>
            </div>
            <div class="side-menu">
                <ul>
                    <li onclick="location.href='books'"><a href="#">Book management</a></li>
                    <li  onclick="location.href='users'"  class="on"><a href="#">User Management</a></li>
                    <li  onclick="location.href='comments'" ><a href="#">Comment management</a></li>
                    <li  onclick="location.href='allorder'"><a href="#">Order management</a></li>
                </ul>
            </div>
            <div class="user-content-r user-contact">
                <div class="user-contact-table">
                    <ul class="user-contact-thead">
                        <li class="contact-th provide">user account</li>
                        <li class="contact-th addr">User full name</li>
                        <li class="contact-th addr">identity</li>
                        <li class="contact-th email">e-mail</li>
                        <li class="contact-th phone" >Shipping Address</li>
                        <li class="contact-th operation">operate</li>
                    </ul>
                    <ul class="user-contact-tbody">
                        <c:forEach items="${users}" var="user">
                            <li class="contact-tr">
                                <div class="contact-td provide">${user.username}</div>
                                <div class="contact-td addr">${user.realname}</div>
                                <div class="contact-td addr">${user.role=='admin'?'administrator':'user'}</div>
                                <div class="contact-td email">${user.email}</div>
                                <div class="contact-td phone" ><p>${user.address}</p></div>
                                <div class="contact-td operation">
                                    <c:if test="${user.role != 'admin'}">
                                        <a href="douser?id=${user.id}">edit</a>
                                    </c:if>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
    <style>
        .user-contact-table .addr{
            width: 100px;
        }
        .user-contact-table .email{
            width: 150px;
            text-align: center;
        }

         .user-contact-table .user-contact-thead .addr{
            padding: 0;
        }
    </style>
    </body>
</html>