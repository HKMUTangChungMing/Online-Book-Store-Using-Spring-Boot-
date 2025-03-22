<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Log in</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<jsp:include page="common.jsp" flush="true"/>
<header>
    <jsp:include page="header.jsp" flush="true"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
    <div class="register" style="margin-top: 50px;margin-bottom: -200px">
        <div class="register_box">
            <div class="title">
                <h2>Log in | Login Users</h2>
                <div class="login_p">If you don’t have an account, go to<a href="register">Register</a></div>
            </div>
            <div class="reg_from">
                <form name="myForm" class="form-signin" action="toLogin" method="post" >
                    <p style="color: #bf1d18;text-align: center">${message}</p>
                    <div class="reg_item">
                        <span class="reg_label">account:</span>
                        <input type="text" name="username" placeholder="Please input Username" autocomplete="off">
                    </div>
                    <div class="reg_item">
                        <span class="reg_label">password:</span>
                        <input type="password" name="password" placeholder="Please enter password">
                    </div>
                    <div class="reg_item">
                        <span class="reg_label">identity:</span>
                        <select name="role" style="width: 400px;height: 40px;border: 1px solid rgba(42,54,106,.2);border-radius: 2px;    padding-left: 10px;">
                            <option value="user">user</option>
                            <option value="admin">administrator</option>
                        </select>
                    </div>
                    <div class="reg_item">
                        <span class="reg_label"></span>
                        <button class="register_btn" type="submit">Log in</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>
<jsp:include page="footer.jsp" flush="true"/>

</body>
</html>