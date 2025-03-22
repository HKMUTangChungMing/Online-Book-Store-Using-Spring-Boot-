<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="header-top" style="height: 45px;line-height: 45px">
    <div class="container">
        <div class="header-container">
            <div class="row">
                <div class="col-md-3 col-sm-3" style="margin-top: 3px">
                    <div class="header-contact">
                        <span class="loca" style="cursor: pointer" onclick="location.href='index'">welcome</span>
                    </div>
                </div>
                <div class="col-md-9 carts">
                    <c:if test="${empty sessionScope.user}">
                        <c:if test="${not empty needLogin}">
                            <script>
                                alert("Not logged in or has expired, please log in");
                                window.location.href = "login";
                            </script>
                        </c:if>
                        <div class="header-r-login">
                            <a class="login" href="login">Log in</a>
                            <a class="register" href="register">register</a>
                        </div>
                    </c:if>
                    <c:if test="${not empty sessionScope.user}">
                        <ul class="header-r-cart" style="margin-top: -10px">
                            <c:if test="${sessionScope.user.role == 'admin'}">
                                <li><a  class="cart" href="books">Backstage management</a><a class="cart" href="goOut" >quit</a></li>
                            </c:if>
                            <c:if test="${sessionScope.user.role == 'user'}">
                                <li><a  class="cart" href="shopcart">shopping cart</a><a class="cart" href="order" >user[${sessionScope.user.username}]</a><a class="cart" href="goOut" >quit</a></li>
                            </c:if>
                        </ul>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    .header-r-cart .cart{
        display: inline-block;
        padding: 0 5px;
    }
</style>