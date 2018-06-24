<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<link type="text/css" rel="stylesheet"
	href="/dotstore_mysql/style/myAuctionList.css?ver=1" />

<title>나의 경매 목록 보기</title>
    <div class="container myList-container" align="center">
        <div class="">
            <p><font size="4"><b>내가 등록한 경매</b></font></p>

            <table class="table table-hover">
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
            <p><font size="4"><b>내가 입찰한 경매</b></font></p>

            <table class="table table-hover">
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
		<hr>
        <div id="pointContainer">
            <p><font size="4"><b>나의 포인트 사용 내역</b></font></p>
            <span>총 포인트 : ${point}</span>
            <br/>
            <div id="pointList" class="rima-table-row">
                <div class="rima-table-row">
                    <div class="rima-table-cell" >
                        <b>포인트 사용 내역</b>
                    </div>
                    <div class="rima-table-cell" >
                       	<b>사용 내역</b>
                    </div>
                </div>
            </div>
            <br>
            <button onclick="getPointListPlus()" class="btn btn-gradient">더보기</button>
        </div>
        <hr>
        <div align="center">
		 <p><font size="4"><b>My Orders</b></font></p>
		 <table class="table table-hover">
		   <tr>
		     <td><b>Order ID</b></td> <td><b>Date</b></td> <td><b>Total Price</b></td>
		   </tr>
		   <c:forEach var="order" items="${orderList}">
		     <tr>
		       <td>
		         <b><a href='<c:url value="/shop/viewOrder.do">
		             <c:param name="orderId" value="${order.orderId}"/></c:url>'>
		             <font color="white"><c:out value="${order.orderId}" /></font>
		           </a></b></td>
		       <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy/MM/dd" /></td>
		       <td><fmt:formatNumber value="${order.totalPrice}" pattern="#,###" />원</td>
		     </tr>
		   </c:forEach>
		  </table>
		</div>

    </div>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

    var page = 1;
    var pointTemplate = "<div class='rima-table-row'>" +
        "                    <div class='rima-table-cell'>" +
        "                        <span>@content</span>" +
        "                    </div>" +
        "                    <div class='rima-table-cell'>" +
        "                        <span>@date</span>" +
        "                    </div>" +
        "                </div>";
    var isPageable = true;
    $(document).ready(function(){
        getPointList();
    });
    
    function getPointListPlus() {
        page++;
        getPointList();
    }
    
    function getPointList() {
        $.ajax({
            url: "/dotstore_mysql/my/point.do?page=" + page,
            type: "GET",
            dataType: "json",
            success: function (data) {
                data.forEach(function (value) {
                    console.log(value.createAtStr);
                    $("#pointList").append(pointTemplate.replace("@content", value.content).replace("@date", value.createAtStr));
                })
                if(data.length == 0 && isPageable) {
                    isPageable = false;
                    $("#pointContainer").append("<span style='color: red;'>더 이상 내역이 없습니다.</span>")
                }
            },
            error : function(e1, e2){
                console.log("error!");
            }
        });
    }

</script>