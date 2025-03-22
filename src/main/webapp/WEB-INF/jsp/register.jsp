<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>register</title>
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
                        <h2>Register an account | Registered Users</h2>
                        <div class="login_p">Already have an account? Go<a href="login">Log in</a></div>
                    </div>
                    <div class="reg_from">
                        <form name="myForm" class="form-signin" action="toRegister" method="post" onsubmit="return checkForm()">
                            <p style="color: #bf1d18;text-align: center">${message}</p>
                            <div class="reg_item">
                                <input type="hidden" name="role" value="user">
                                <span class="reg_label">account:</span>
                                <input type="text" name="username" placeholder="Please input Username" autocomplete="off">
                            </div>
                            <div class="reg_item">
                                <span class="reg_label">full name:</span>
                                <input type="text" name="realname" placeholder="Please enter full name">
                            </div>
                            <div class="reg_item">
                                <span class="reg_label">login password:</span>
                                <input type="password" name="password" id="password" placeholder="6-16 digit password, case sensitive">
                            </div>
                            <div class="reg_item">
                                <span class="reg_label">Confirm Password:</span>
                                <input type="password" name="enpassword" id="enpassword"  placeholder="Enter password again">
                            </div>
                            <div class="reg_item">
                                <span class="reg_label"></span>
                                <button class="register_btn" type="submit">register</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </header>
        <jsp:include page="footer.jsp" flush="true"/>
        <script>
            function checkForm() {
                //Verify passwords are the same
                if (document.getElementById("password").value != document.getElementById("enpassword").value) {
                    alert("The password entered twice is inconsistent");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>