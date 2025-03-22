<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html >
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Bookstore Home Page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
    </head>
    <body>
        <jsp:include page="common.jsp" flush="true"/>
        <header>
            <jsp:include page="header.jsp" flush="true"/>
            <div class="header-main">
                <div class="container">
                    <div class="header-content">
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div id="search-category">
                                    <form class="search-box" action="index" method="post">
                                        <input type="search" id="text-search" value="${book.name}" name="name" autocomplete="off" placeholder="Please enter key words">
                                        <button id="btn-search-category" type="submit">search</button>
                                    </form>
                                </div>
                            </div>
                            
                        </div>
                    </div>    
                </div>
            </div>
        </header>
        <div class="shoplist">
        	<div class="container">
        		<div class="breadcrumb">
	    			<span>front page></span>
                    <span>Book list</span>
	    		</div>

	        	<div class="container">
	        		<ul class="shopCotent">
                        <c:forEach var="book" items="${books}">
                            <li onclick="location.href='detail?id=${book.id}'">
                                <div class="item">
                                    <img src="${book.fmimg}" alt="${book.name}">
                                    <div class="info">
                                        <p class="title" title="${book.name}">${book.name}</p>
                                        <p class="money"><span>$</span>${book.price}</p>
                                        <p class="parameter">author:${book.author}</p>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
	        		</ul>
	        	</div>
	        	<div class="pagination-content">
                </div>
        	</div>
        </div>
        <jsp:include page="footer.jsp" flush="true"/>
    </body>
</html>