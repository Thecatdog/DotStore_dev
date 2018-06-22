<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>나의 경매 목록 보기</title>

<body id="">
    <div id="" align="center">
        <div class="">
            <p>내가 등록한 경매</p>

            <table border="1">
                <thead>
                    <th>CATEGORY</th>
                    <th>상품 이름</th>
                    <th>현재 가격</th>
                    <th>마감 날짜</th>
                </thead>
                <tbody>
                	<c:forEach var="item" items="${myAuctionList}">
	                    <tr>
	                        <td>${item.categoryId}</td>
	                        <td>
	                        	<a class="itemid-a" href='<c:url value="/shop/auctionDetail.do">
				    				<c:param name="itemId" value="${item.itemId}"/></c:url>'>
				    					${item.itemId}
				    			</a>
				    		</td>
	                        <td><fmt:formatNumber value="${item.listprice}" pattern="#,###" />원</td>
	                        <td><fmt:formatDate value="${item.dueTime}" pattern="yyyy-MM-dd" /></td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <hr>

        <div class="">
            <p>내가 입찰한 경매</p>

            <table border="1">
                <thead>
                    <th>CATEGORY</th>
                    <th>상품 이름</th>
                    <th>나의 입찰 금액</th>
                    <th>현재 가격</th>
                    <th>마감 날짜</th>
                </thead>
                <tbody>
                	<c:forEach var="list" items="${myBiddingList}">
	                    <tr>
	                        <td>${list.categoryId}</td>
	                        <td>
								<a class="itemid-a" href='<c:url value="/shop/auctionDetail.do">
				    				<c:param name="itemId" value="${list.itemId}"/></c:url>'>
				    					${list.itemId}
				    			</a>
							</td>
	                        <td><fmt:formatNumber value="${list.myPrice}" pattern="#,###" />원</td>
	                        <td><fmt:formatNumber value="${list.nowPrice}" pattern="#,###" />원</td>
	                        <td><fmt:formatDate value="${list.dueTime}" pattern="yyyy-MM-dd" /></td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

    </div>
</body>