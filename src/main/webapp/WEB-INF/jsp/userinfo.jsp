<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>account information</title>
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
                <span  onclick="location.href='index'">front page></span>
                <span>mine></span>
                <span>account information</span>
            </div>
            <div class="side-menu">
                <ul>
                    <li onclick="location.href='order'"><a href="#">Order List</a></li>
                    <li class="on" ><a href="#">account information</a></li>
                </ul>
            </div>
            <div class="user-content-r user-message">
                <div class="user-message-content">
                    <div class="message-tag">
                        <ul class="nav nav-tabs taghead" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#activity" aria-controls="activity" role="tab" data-toggle="tab">personal information</a>
                            </li>
                            <li role="presentation">
                                <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">change Password</a>
                            </li>
                        </ul>
                        <div class="tagbody tab-content">
                            <!-- Personal information -->
                            <div role="tabpanel" class="tab-pane active" id="activity">
                                <div class="information" style="border: none">
                                    <form name="myForm" class="form-signin" action="update/userinfo" method="post" >
                                        <div class="form-user-info">
                                        <div class="form-info-item">
                                            <span class="info-label">account</span>
                                            <span>${user.username}</span>
                                            <input type="hidden" name="id" value="${user.id}" >
                                            <input type="hidden" name="role" value="${user.role}" >
                                            <input type="hidden" name="username" value="${user.username}" >
                                            <input type="hidden" name="password" value="${user.password}" >
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
                                        <button class="purchase" type="submit" >save</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                            <!-- Password modification -->
                            <div role="tabpanel" class="tab-pane" id="profile">
                                <div class="information" style="border: none">
                                    <form name="myForm" class="form-signin" action="update/userinfo" method="post" onsubmit="return checkForm()">
                                        <div class="form-user-info">
                                        <input type="hidden" name="id" value="${user.id}" >
                                        <input type="hidden" name="role" value="${user.role}" >
                                        <input type="hidden" name="username" value="${user.username}" >
                                        <input type="hidden" name="realname" value="${user.realname}" >
                                        <input type="hidden" name="email" value="${user.email}" >
                                        <input type="hidden" name="address" value="${user.address}" >
                                        <div class="form-info-item">
                                            <span class="info-label">Old Password</span>
                                            <input type="password" placeholder="Please enter old password" class="nickname" id="oldpassword">
                                        </div>
                                        <div class="form-info-item">
                                            <span class="info-label">New Password</span>
                                            <input type="password" placeholder="Please enter a new password" class="nickname" name="password" id="password">
                                        </div>
                                        <div class="form-info-item">
                                            <span class="info-label">Confirm Password</span>
                                            <input type="password" placeholder="Please confirm your password" class="nickname" id="enpassword">
                                        </div>
                                        <button class="purchase" type="submit">save</button>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
        <script>
            function checkForm(){
                var password = document.getElementById("password").value;
                var enpassword = document.getElementById("enpassword").value;
                var oldpassword = document.getElementById("oldpassword").value;
                if(oldpassword != "${user.password}"){
                    alert("Old password is wrong");
                    return false;
                }
                if(password != enpassword){
                    alert("Two passwords are inconsistent");
                    return false;
                }
                return true;
            }
            setTimeout(function () {
                if("${message}"){
                    alert("Modification successful, log in again");
                    window.location.href = "../goOut";
                }
            },500);
        </script>
    </body>
</html>