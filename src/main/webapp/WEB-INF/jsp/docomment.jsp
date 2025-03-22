<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Add comment operation</title>
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
                <span>Book management></span>
                <span>Add comment</span>
            </div>
            <div class="side-menu">
                <ul>
                    <li class="on"><a href="books">Book management</a></li>
                    <li onclick="location.href='users'"><a href="#">User Management</a></li>
                    <li onclick="location.href='comments'"><a href="#">Comment management</a></li>
                </ul>
            </div>
            <div class="user-content-r user-message">
                <div class="user-message-content">
                    <div class="message-tag">
                        <ul class="nav nav-tabs taghead" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#activity" aria-controls="activity" role="tab" data-toggle="tab">Add comment</a>
                            </li>
                        </ul>
                        <div class="tagbody tab-content">
                            <!-- Add comment -->
                            <div role="tabpanel" class="tab-pane active" id="activity">
                                <div class=" information" style="border: none">
                                    <div class="form-user-info">
                                        <form name="myForm" class="form-signin" action="insertComment" method="post" >
                                            <input type="hidden" name="uid" value="${sessionScope.user.id}">
                                            <input type="hidden" name="uname" value="${sessionScope.user.username}">
                                            <input type="hidden" name="bid" value="${bookInfo.id}">
                                            <input type="hidden" name="bname" value="${bookInfo.name}">
                                            <p style="font-size: 14px">The maximum length of comments is 200 words.</p>
                                            <textarea  class="nickname" style="width: 600px;height: 200px;padding: 10px" name="content"  cols="10" rows="10" placeholder="Please enter the comment content"
                                                       maxlength="200" οnchange="this.value=this.value.substring(0, 200)"
                                                       οnkeydοwn="this.value=this.value.substring(0, 200)"
                                                       οnkeyup="this.value=this.value.substring(0, 200)"></textarea>
                                            <div class="form-info-item" style="margin-left: 120px;margin-top: 20px">
                                                <button class="order-pay-submit"  type="button"  onclick="location.href='books'" style="float: none;margin: 0;background: #cccccc">return</button>
                                                <button class="order-pay-submit"  type="submit"  style="float: none;margin: 0">save</button>
                                            </div>
                                        </form>
                                    </div>

                                </div>

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
                    window.location.href="books";
                }
            },500);
        </script>
    </body>
</html>