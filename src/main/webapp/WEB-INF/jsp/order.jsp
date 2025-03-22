<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Order List</title>
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
                <span>mine></span>
                <span>Order List</span>
            </div>
            <div class="side-menu">
                <ul>
                    <li class="on"><a href="#">Order List</a></li>
                    <li onclick="location.href='userinfo'"><a href="#">account information</a></li>
                </ul>
            </div>

            <div class="user-content-r order-content">
                <div class="order-tab-table">
                    <!-- Tab panes -->
                    <div class="tab-content" style="padding: 0">
                        <div role="tabpanel" class="tab-pane active" id="all">
                            <div class="order-table-thead">
                                <div class="thead-goods-info">Book information</div>
                                <div class="thead-goods-price">unit price</div>
                                <div class="thead-goods-num">quantity</div>
                                <div class="thead-goods-pay">Amount</div>
                                <div class="thead-goods-operation">state</div>
                            </div>
                            <c:forEach var="od" items="${orderItems}">
                                <div class="order-table-tbody">
                                    <div class="order-table-tbody-head">order number:${od.orderid}<span style="display: inline-block;margin-left: 20px">order amount:${od.total}</span>   <a href="#">Payment time:${od.paytime}</a></div>
                                    <div class="order-table-tbody-content">
                                        <div class="order-table-tbody-item">
                                            <div class="goods-content">
                                                <c:forEach var="item" items="${od.itemlist}">
                                                    <div class="goods-item">
                                                        <div class="goods-info">
                                                            <img src="${item.fmimg}" alt="">
                                                            <div class="info">
                                                                <h4>${item.name}</h4>
                                                            </div>
                                                        </div>
                                                        <div class="goods-price">$${item.price}</div>
                                                        <div class="goods-num">${item.num}</div>
                                                        <div class="goods-pay">$${item.pertotal}</div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <div class="goods-operation">
                                                <button class="order-pay">Transaction complete</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>