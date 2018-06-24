<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/auctionDetail.css?ver=9"/>

<title>경매 상품 상세 보기</title>

<body id="">
	<div class="container aucDetail-container"align="center">
		<table class="table table-hover">
			<tr>
				<td>카테고리</td>
				<td>${item.categoryId}</td>
			</tr>
			<tr>
				<td>상품 이름</td>
				<td>${item.itemId}</td>
			</tr>
			<tr>
				<td>상품 설명</td>
				<td>${item.description}</td>
			</tr>
			<tr>
				<td>마감 시간</td>
				<td>${dday}</td>
			</tr>
			<tr>
				<td>남은 시간</td>
				<td>
					<div class="counter">
<!-- 						<span id="target-day"></span><span class="text_target">까지</span><br> -->
						<span id="dday-timer" class="num"></span> 
						<span id="time-day" class="num"></span> 
						<span id="time-hour" class="num"></span>  
						<span id="time-minute" class="num"></span>  
						<span id="time-second" class="num"></span> 
					</div>
				</td>
			</tr>
			<tr>
				<td>현재 가격</td>
<%-- 				<td>${item.listprice}원</td> --%>
				<td><fmt:formatNumber value="${item.listprice}"
            		pattern="#,###" />원</td>
			</tr>
			<tr>
				<td>판매자</td>
				<td>${item.supplier}</td>
			</tr>
		</table>

		<!-- 경매 등록한 사람(판매자)에게만 보여짐 -->
		<c:if test="${currentUser eq item.supplier}">
			<div class="">
				<a href='<c:url value="/shop/editAuction.do">
							<c:param name="itemId" value="${item.itemId}"/>
						</c:url>'
					class="btn btn-gradient">경매 수정
				</a>
				<a href='<c:url value="/shop/deleteAuction.do">
							<c:param name="itemId" value="${item.itemId}"/>
							<c:param name="productId" value="${item.productId}"/>
						</c:url>'
					class="btn btn-gradient">경매 삭제
				</a>
			</div>
		</c:if>
		<!-- 경매 등록한 사람(판매자)에게만 보여짐 (여기까지) -->
		<br/>
		<a href='<c:url value="/shop/auction/viewProduct.do">
					<c:param name="productId" value="${item.productId}"/>
				</c:url>'>목록<i class="fas fa-list-ul"></i>
		</a>
		<br/>
		<hr>

		<!-- 최고 입찰자가 아닌 구매자에게만 보여짐 -->
		<c:if test="${item.finish eq 'open' && currentUser ne item.supplier}">
			<div style="color:white; font-size:0.9rem">
				<c:if test="${myBidStatus eq 0}">
					<p>${currentUser} 님은 현재 최고 입찰자가 아닙니다.</p>
				
					<p>경매에 참가하세요</p>
					<p>현재 가격보다 더 높은 금액을 제시해야 경매에 참가할 수 있습니다.</p>
		
					<form method="post" name="" action='<c:url value="/shop/auctionDetail.do">
	 					<c:param name="itemId" value="${item.itemId}"/></c:url>'>
	 					<table border="0"> 
	 						<tr> 
	 							<td style="color:white">입찰 금액 : </td>
	 							<td><input id="listprice" type="number" min="${item.listprice+1}" class="" name="listprice" required></td> 
	 							<td><button type="submit" class="btn btn-gradient">입찰</button></td>
	 						</tr> 
	 					</table>
	 				</form> 
	 			</c:if>
			</div>
		</c:if>
		<!-- 최고 입찰자가 아닌 구매자에게만 보여짐 (여기까지) -->
		
		<!-- 최고 입찰자인 구매자에게만 보여지는 부분 -->
		<c:if test="${item.finish eq 'open' && myBidStatus eq 1}">
			<div style="color:white; font-size:0.9rem">
				<p>
					${currentUser} 님이 현재 최고 입찰자입니다.<br> 입찰 취소 버튼을 누르면 입찰이 취소됩니다.<br> 입찰을
					취소하시겠습니까?
				</p>
	
				<a href='<c:url value="/shop/deleteBidding.do">
							<c:param name="itemId" value="${item.itemId}" />
							<c:param name="myPrice" value="${myPrice}" />
						</c:url>'
					class="btn btn-gradient">입찰 취소</a>
			</div>
		</c:if>
		<!-- 최고 입찰자인 구매자에게만 보여지는 부분 (여기까지) -->

		<hr>

		<!-- 경매 마감 시 -->
		<c:if test="${item.finish eq 'close' && myBidStatus eq 1}">
			<div style="color:white; font-size:0.9rem">
				<p>경매가 마감되었습니다.</p>
				<p>${currentUser} 님이 현재 최고 입찰자입니다.</p>
				<p>상품을 구매하려면 카트를, 입찰을 취소하려면 입찰 취소 버튼을 눌러주세요.</p>
	
				<a class="cart-logo"
							href='<c:url value="/shop/addCart.do">
							<c:param name="type" value="auction" />
	            			<c:param name="workingItemId" value="${item.itemId}"/>
	            			<c:param name="price" value="${item.listprice}"/></c:url>'>
								<i class="fas fa-cart-plus"></i>
						</a>
				<a href='<c:url value="/shop/deleteBidding.do">
							<c:param name="itemId" value="${item.itemId}" />
							<c:param name="myPrice" value="${myPrice}" />
						</c:url>'
					class="btn btn-gradient">입찰 취소</a>
			</div>
		</c:if>
		<!-- 경매 마감 시 (여기까지) -->
	</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/Javascript">

window.onload=function(){
    // 페이지가 로딩된 후 실행
    var message="${message}";
    if(message=="중복된 상품입니다.")
	    alert(message);
}

var ddaytimer = setInterval (dayGap, 1000)
function dayGap () {
    var dday = new Date("${dday}");//디데이
    var ddayChange = dday.getTime();
    var nowday = new Date();//현재
    nowday.setDate(nowday.getDate() - 1);//24시 마감이기 때문
    nowday = nowday.getTime();//밀리세컨드 단위변환
    var distance = ddayChange - nowday;//디데이에서 현재까지 뺀다.
    
    //distance에 가끔 엑스뜨는데 무시해도 잘나옴
    var d = Math.floor(distance / (1000 * 60 * 60 * 24));//일
    
    var h = Math.floor((distance / (1000*60*60)) % 24);//시간
    var m = Math.floor((distance / (1000*60)) % 60);//분
    var s = Math.floor((distance / 1000) % 60);//초
    
    if (distance <= 0) {//당일넘어섰을때, dday로 변경
        document.getElementById("dday-timer").innerHTML = "경매가 마감되었습니다.";
    } else {
        //document.getElementById("target-day").innerHTML = dday;
        document.getElementById("time-day").innerHTML = d + "일";
        document.getElementById("time-hour").innerHTML = h + "시간";
        document.getElementById("time-minute").innerHTML = m + "분";
        document.getElementById("time-second").innerHTML = s + "초";
    }
}
</script>
