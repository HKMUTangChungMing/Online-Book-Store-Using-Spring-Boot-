<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>User modification</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <jsp:include page="common.jsp" flush="true"/>
        <header>
            <jsp:include page="header.jsp" flush="true"/>
        </header>

        <div class="container user-info">
            <div class="breadcrumb">
                <span onclick="location.href='index'">front page></span>
                <span>manage></span>
                <span>User Management></span>
                <span>User edit></span>
            </div>
            <div class="side-menu">
                <ul>
                    <li onclick="location.href='books'" ><a href="#">Book management</a></li>
                    <li class="on" onclick="location.href='users'"><a href="#">User Management</a></li>
                    <li onclick="location.href='comments'"><a href="#">Comment management</a></li>
                </ul>
            </div>
            <div class="user-content-r user-message">
                <div class="user-message-content">
                    <div class="message-tag">
                        <ul class="nav nav-tabs taghead" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#activity" aria-controls="activity" role="tab" data-toggle="tab">User edit</a>
                            </li>
                        </ul>
                        <div class="tagbody tab-content">
                            <!-- User edit -->
                            <div role="tabpanel" class="tab-pane active" id="activity">
                                <form name="myForm" class="form-signin" action="update/douser" method="post" >
                                    <div class="information" style="border: none">
                                    <div class="form-user-info">
                                        <div class="form-info-item">
                                            <span class="info-label">account</span>
                                            <span>${user.username}</span>
                                        </div>
                                        <div class="form-info-item">
                                            <span class="info-label">password</span>
                                            <input type="hidden" name="username" value="${user.username}">
                                            <input type="hidden" name="id" value="${user.id}">
                                            <input type="hidden" name="role" value="${user.role}">
                                            <input type="text" placeholder="Please enter password" class="nickname" name="password" value="${user.password}">
                                        </div>
                                        <div class="form-info-item">
                                            <span class="info-label">full name</span>
                                            <input type="text" placeholder="Please enter full name" class="nickname" name="realname" value="${user.realname}">
                                        </div>
                                        <div class="form-info-item">
                                            <span class="info-label">e-mail</span>
                                            <input type="text" placeholder="Please enter email" class="nickname" name="email" value="${user.email}">
                                        </div>
                                        <div class="form-info-item">
                                            <span class="info-label">Shipping Address</span>
                                            <input type="text" placeholder="Please enter shipping address" class="nickname" name="address" value="${user.address}">
                                        </div>
                                        <div class="form-info-item" style="margin-left: 120px;margin-top: 20px">
                                            <button class="order-pay-submit" type="button" onclick="location.href='users'" style="float: none;margin: 0;background: #cccccc">return</button>
                                            <button class="order-pay-submit" type="submit" style="float: none;margin: 0">save</button>
                                        </div>
                                    </div>

                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
        <script>
            setTimeout(function () {
                if("${message}"){
                    alert("${message}");
                    window.location.href = "../users";
                }
            },500);
        </script>
    </body>
</html>