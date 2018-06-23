<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
    div {
        border: 1px solid #bcbcbc;
    }
    .rima-table-row {
        display: table-row;
    }
    .rima-table-cell {
        display: table-cell;
        padding: 0px 20px;
    }
</style>
<title>나의 경매 목록 보기</title>
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

        <div id="pointContainer">
            <p>나의 포인트 사용 내역</p>
            <span>총 포인트 : ${point}</span>
            <div id="pointList" class="rima-table-row">
                <div class="rima-table-row">
                    <div class="rima-table-cell" style="background: #ffc107">
                        포인트 사용 내역
                    </div>
                    <div class="rima-table-cell" style="background: #ffc107">
                        사용 날짜
                    </div>
                </div>
            </div>
            <button onclick="getPointListPlus()" class="btn btn-warning">더보기</button>
        </div>
        
        <div>
       		<h3><b><a href='<c:url value="/shop/listOrders.do"/>'>주문내역</a></b></h3>
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