<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Book details</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <jsp:include page="common.jsp" flush="true"/>
        <header>
            <jsp:include page="header.jsp" flush="true"/>
        </header>

        <div class="detailsContent">
            <div class="container">
                <div class="breadcrumb">
                    <span  onclick="location.href='index'">front page></span>
                    <span>Book list></span>
                    <span>Book details</span>
                </div>
                <div class="product-intro">
                    <div class="preview-wrap">
                        <div class="imgInfo"><img src="${book.fmimg}" style="width: 100%"></div>
                    </div>
                    <form name="myForm" class="form-signin" action="noworder" method="post" >
                        <div class="itemInfo-wrap">
                            <div class="sku-name">${book.name}</div>
                            <div class="Originalprice">
                                <span class="commodity_label">author</span>
                                <div class="page_origin_price">${book.author}</div>
                            </div>
                            <div class="Promotion">
                                <span class="commodity_label">price</span>
                                <div class="p-price">$<em>${book.price}</em></div>
                            </div>
                            <div class="choose-btns">
                                <span class="commodity_label">quantity</span>
                                <div class="wrap-input">
                                    <div class="input-number" style="margin: 0">
                                        <button class="number__decrease" id="decrease" type="button" onclick="numDec()">-</button>
                                        <input type="text" class="spinbutton" name="num" readonly id="spinbutton" value="1">
                                        <button class="number__increase" id="increase" type="button" onclick="numAdd()">+</button>
                                    </div>
                                </div>
                            </div>
                            <div class="ButtonGroup">
                                <input type="hidden" name="pertotal" id="pertotal" value="${book.price}"/>
                                <input type="hidden" name="bookid" value="${book.id}"/>
                                <input type="hidden" name="name" value="${book.name}"/>
                                <input type="hidden" name="fmimg" value="${book.fmimg}"/>
                                <input type="hidden" name="price" value="${book.price}"/>
                                <c:if test="${not empty sessionScope.user}">
                                    <button class="purchase" type="submit">Buy it now</button>
                                </c:if>
                                <c:if test="${empty sessionScope.user}">
                                    <button class="purchase" type="button" onclick="alert('please log in first')">Buy it now</button>
                                </c:if>
                                <button class="AddShoppingCart" type="button" onclick="joincart()">add to the cart</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- product details -->
            <div class="container">
                <div class="CommodityIntroduction">
                    <div class="ETab">
                        <div class="tab-main" style="color: #fff">Book introduction</div>
                        <div class="tab-con">
                            <div class="p-parameter" id="content">
                            </div>
                        </div>

                    </div>
                    <div class="comment">
                         <div class="comments-list">
                            <div class="tab-main">
                                <ul>
                                    <li class="on">All comments</li>
                                </ul>
                            </div>
                             <div class="messBoard">
                                 <div class="messItem" style="margin: 10px 0">
                                     <p style="font-size: 14px">The maximum length of comments is 200 words.</p>
                                     <textarea id="textarea" placeholder="Come and leave a message~" style="width: 100%;height: 150px;padding: 10px"
                                               maxlength="200" οnchange="this.value=this.value.substring(0, 200)"
                                               οnkeydοwn="this.value=this.value.substring(0, 200)"
                                               οnkeyup="this.value=this.value.substring(0, 200)"></textarea>
                                     <c:if test="${not empty sessionScope.user}">
                                        <button class="order-pay-submit" onclick="addComment()" type="button" style="float: none;margin: 0">Submit Message</button>
                                     </c:if>
                                     <c:if test="${ empty sessionScope.user}">
                                         <button class="order-pay-submit" type="button" disabled style="float: none;margin: 0;background: #cccccc">Not logged in</button>
                                     </c:if>
                                 </div>
                             </div>
                            <div class="tab-con">
                                <ul>
                                    <c:forEach items="${comments}" var="bookComment">
                                    <li>
                                        <div class="left">
                                            <div class="comment-con" >
                                                <p>[${bookComment.uname}]Comment:</p>
                                                <p>${bookComment.content}</p>
                                            </div>
                                        </div>
                                        <div class="right" style="text-align: right">Comment time:${bookComment.createtime}</div>
                                    </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
        <script>
            //Render book introduction, add line break style
            let content = `${book.intro}`.replace(/\r\n/g,"<br>").replace(/\n/g,"<br>").replace(/\s/g,"&nbsp;");
            document.getElementById("content").innerHTML = content;

            //add to the cart
            function joincart(){
                if(`${user.id}` == ""){
                    alert("please log in first");
                    return;
                }
                let num = parseInt(document.getElementById("spinbutton").value);
                let price = parseFloat("${book.price}");
                let pertotal = (num * price).toFixed(2);
                $.ajax({
                    url: "changecart",
                    type: "post",
                    data: {
                        bookid: `${book.id}`,
                        usid: `${user.id}`,
                        num: num,
                        pertotal: pertotal
                    },
                    success: function (data) {
                        if (data.code == 200) {
                            alert("Joined successfully");
                        }else {
                            alert("Failed to join");
                        }
                    }
                })
            }
            //Comment
            function addComment() {
                $.ajax({
                    url: "insertUserComment",
                    type: "post",
                    data: {
                        uid: `${user.id}`,
                        uname: `${user.username}`,
                        bname: `${book.name}`,
                        bid: `${book.id}`,
                        content: $("textarea").val()
                    },
                    success: function (data) {
                        if (data.code == 200) {
                            alert("Comment successful");
                            window.location.reload();
                        } else {
                            alert("Comment failed");
                        }
                    }
                });
            }
            function numDec() {

                var num = parseInt(document.getElementById("spinbutton").value);
                if (num > 1) {
                    num--;
                    document.getElementById("spinbutton").value = num;
                    document.getElementById("pertotal").value = parseFloat("${book.price}") * parseInt(document.getElementById("spinbutton").value);
                }
            }
            function numAdd() {

                document.getElementById("spinbutton").value = parseInt(document.getElementById("spinbutton").value) + 1;
                document.getElementById("pertotal").value = parseFloat("${book.price}") * parseInt(document.getElementById("spinbutton").value);

            }

        </script>
    </body>
</html>