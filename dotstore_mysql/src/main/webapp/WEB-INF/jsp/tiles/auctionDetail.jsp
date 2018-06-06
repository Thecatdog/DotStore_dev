<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<title>경매 상품 상세 보기</title>

<body id="">
	<div align="center">
		<table border="1">
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
				<td>${item.listprice}</td>
			</tr>
			<tr>
				<td>판매자</td>
				<td>${item.supplier}</td>
			</tr>
		</table>

		<!-- 경매 등록한 사람(판매자)에게만 보여짐 -->
		<c:if test="${currentUser eq item.supplier}">
			<div class="">
				<button type="button">경매 수정</button>
				<button type="button">경매 삭제</button>
				<br>
			</div>
		</c:if>
		<!-- 경매 등록한 사람(판매자)에게만 보여짐 (여기까지) -->

		<a href='<c:url value="/shop/auction/viewProduct.do">
					<c:param name="productId" value="${item.productId}"/>
				</c:url>'>목록보기
		</a>

		<hr>

		<!-- 구매자에게만 보여짐 -->
		<c:if test="${currentUser ne item.supplier}">
			<div class="">
				<p>경매에 참가하세요</p>
				<p>현재 가격보다 더 높은 금액을 제시해야 경매에 참가할 수 있습니다.</p>
	
				<form method="post" name="" action='<c:url value="/shop/auctionDetail.do">
					<c:param name="itemId" value="${item.itemId}"/></c:url>'>
<%-- 					<input type="hidden" name="itemId" value="${item.itemId}"> --%>
					<table border="0">
						<tr>
							<td>입찰 금액 : </td>
							<td><input id="listprice" type="number" min="${item.listprice+1}" class="" name="listprice" required></td>
							<td><button type="submit">입찰</button></td>
						</tr>
					</table>
				</form>
			</div>
		</c:if>
		<!-- 구매자에게만 보여짐 (여기까지) -->

		<!-- 최고 입찰자에게만 보여지는 부분 -->
<!-- 		<div class=""> -->
<!-- 			<p> -->
<!-- 				김나영 님이 현재 최고 입찰자입니다.<br> 입찰 취소 버튼을 누르면 입찰이 취소됩니다.<br> 입찰을 -->
<!-- 				취소하시겠습니까? -->
<!-- 			</p> -->

<!-- 			<button type="button">입찰 취소</button> -->
<!-- 		</div> -->
		<!-- 최고 입찰자에게만 보여지는 부분 (여기까지) -->

		<hr>

		<!-- 경매 마감 시 -->
<!-- 		<div class=""> -->
<!-- 			<p>김나영 님이 현재 최고 입찰자입니다.</p> -->
<!-- 			<p>상품을 구매하려면 Add to Cart를, 경매를 취소하려면 경매 취소 버튼을 눌러주세요.</p> -->

<!-- 			<button type="button">Add to Cart</button> -->
<!-- 			<button type="button">경매 취소</button> -->
<!-- 		</div> -->
		<!-- 경매 마감 시 (여기까지) -->
	</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/Javascript">

var ddaytimer = setInterval (dayGap, 1000)
function dayGap () {
    var dday = new Date("${dday}");//디데이
    var ddayChange = dday.getTime();
    var nowday = new Date();//현재
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
