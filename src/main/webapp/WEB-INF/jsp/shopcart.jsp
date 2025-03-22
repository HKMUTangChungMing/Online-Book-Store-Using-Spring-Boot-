<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>shopping cart</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <jsp:include page="common.jsp" flush="true"/>
        <header>
            <jsp:include page="header.jsp" flush="true"/>
        </header>
        <div class="cartContent">
            <div class="container">
                <div class="breadcrumb">
                    <span onclick="location.href='index'">front page></span>
                    <span>shopping cart</span>
                </div>
                <div class="cartTable">
                    <div class="Settlement">
                        <div class="col-md-6">Books added<span id="totalbook">${total}</span>copies</div>
                        <div class="col-md-2 " id="showtip" style="color: red"> </div>
                        <div class="col-md-2">total:$<span id="sumprice">${sum}</span></div>
                        <c:if test="${total == 0}">
                            <div class="col-md-2 SettlementBtn"  style="background-color: #ccc">Settlement</div>
                        </c:if>
                        <c:if test="${total != 0}">
                            <form name="myForm" class="form-signin" action="overorder" method="post" >
                                <button class="col-md-2 SettlementBtn" type="submit" style="    height: 60px;">Settlement</button>
                            </form>
                        </c:if>
                    </div>
                    <div class="cartThead">
                        <ul>
                            <li class="col-md-5">Book information</li>
                            <li class="col-md-2">unit price</li>
                            <li class="col-md-2">quantity</li>
                            <li class="col-md-2">Amount</li>
                            <li class="col-md-1">operate</li>
                        </ul>
                    </div>
                    <div class="cartTbody">
                        <ul>
                            <li>
                                <dl>
                                    <c:forEach items="${carts}" var="bookcart" varStatus="status">
                                        <dd>
                                        <ul>
                                            <li class="col-md-5 cartInfo">
                                                <img src="${bookcart.fmimg}" style="height: 100px;">
                                                <div class="info">
                                                    <div class="title">${bookcart.name}</div>
                                                </div>
                                            </li>
                                            <li class="col-md-2 univalent">$<span id="price${status.index}">${bookcart.price}</span></li>
                                            <li class="col-md-2">
                                                <div class="input-number">
                                                    <button class="number__decrease " type="button" onclick="numDec(${status.index})">-</button>
                                                    <input type="hidden"  id="bookid${status.index}" value="${bookcart.bookid}">
                                                    <input type="text" class="spinbutton" id="num${status.index}" readonly value="${bookcart.num}">
                                                    <button class="number__increase" type="button" onclick="numAdd(${status.index})">+</button>
                                                </div>
                                            </li>
                                            <li class="col-md-2 money">$<span id="pertotal${status.index}">${bookcart.pertotal}</span></li>
                                            <li class="col-md-1 del" style="cursor: pointer" onclick="location.href='delcart?id=${bookcart.id}'">delete</li>
                                        </ul>
                                    </dd>

                                    </c:forEach>

                                    <c:if test="${total == 0}">
                                        <div style="width: 100%;padding: 90px;text-align: center;">Shopping cart is empty~</div>
                                    </c:if>
                                </dl>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
        <script>
            //add to the cart
            function joincart(num,index){
                let newnum = parseInt(document.getElementById("num"+index).value) + num;
                let price = parseFloat(document.getElementById("price"+index).innerText);
                let pertotal = (newnum * price).toFixed(2);
                $.ajax({
                    url: "changecart",
                    type: "post",
                    data: {
                        bookid: document.getElementById("bookid"+index).value,
                        usid: `${user.id}`,
                        num: num,
                        pertotal: (num*price)
                    },
                    success: function (data) {
                        if (data.code == 200) {
                            document.getElementById("num"+index).value = newnum;
                            document.getElementById("pertotal"+index).innerText = pertotal;
                            document.getElementById("showtip").innerText = 'Quantity updated successfully';
                            document.getElementById("sumprice").innerText = parseFloat(document.getElementById("sumprice").innerText) + parseFloat((num*price))
                            document.getElementById("totalbook").innerText = parseInt(document.getElementById("totalbook").innerText) + num
                        }else {
                            document.getElementById("showtip").innerText = 'Quantity update failed';
                        }
                        document.getElementById("showtip").style.display = 'block';
                        setTimeout(function () {
                            document.getElementById("showtip").innerText = '    ';
                        },1000)
                    }
                })
            }
            function numDec(index) {

                var num = parseInt(document.getElementById("num"+index).value);
                if (num > 1) {
                    joincart(-1,index);
                }
            }
            function numAdd(index) {
                //quantity plus 1
                joincart(1,index);
            }

        </script>
    </body>
</html>