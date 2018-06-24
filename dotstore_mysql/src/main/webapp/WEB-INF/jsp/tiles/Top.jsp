<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/top.css?ver=14" />
<div class="top-container">
	<nav class="navbar navbar-expand-lg top-nav-color">
		<a class="navbar-brand" href="<c:url value="/shop/index.do"/>"> <img
			class="dot-logo" border="0" src="/dotstore_mysql/images/dot-logo.png" /></a>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link category-item" href="<c:url value="/shop/c2p/categoryList.do"/>">C2P</a>
				<a class="nav-item nav-link category-item" href="<c:url value="/shop/p2p/categoryList.do"/>">P2P</a>
				<a class="nav-item nav-link category-item" href="<c:url value="/shop/auction/categoryList.do"/>">AUCTION</a>
			</div>
			<form class="go-sign-form">
				<c:if test="${!empty userSession.account}">
					<span class="welcome-msg">환영합니다, <b id="userId">${userSession.account.username}</b> <a class="fas fa-user icon" href="<c:url value="/shop/myAuctionList.do"/>"></a>
						님!
					</span><br/>
					<span class="point-msg">가용포인트 : <span id="pointVal"></span></span><br/>
					<div class="icons-small">
						<a class="fas fa-envelope icon"
							href="<c:url value="/msg/recv/list.do" />"></a>
						<a href="<c:url value="/shop/viewCartList.do"/>"
							class="fas fa-shopping-cart icon"></a>
						<a href="<c:url value="/daily.do"/>"
							class="fas fa-calendar-alt icon"></a></br>
						<a href="<c:url value="/shop/signoff.do"/>"
							class="btn btn-gradient">LOGOUT</a>	
					</div>
				</c:if>
				<c:if test="${empty userSession.account}">
					<a href="<c:url value="/shop/signonForm.do"/>"
						class="btn btn-gradient">LOGIN</a>
					<a href="<c:url value="/shop/newAccount.do"/>"
						class="btn btn-gradient">SIGN UP</a>
				</c:if>
			</form>
		</div>
	</nav>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	
	/* 
		1. user가 있는지를 먼저 확인하기
		-> sessionStroage에 point 값 있을 경우 -> 그냥 포인트 갔다 쓰기
		-> sessionStroage에 point 값 없을 경우 -> ajax통신으로 포인트 가지고 오기 -> sessionStroage에 저장
		2. user가 없으면 -끝- 
	*/
	
	$(document).ready(function(){
		
		var userId = $('#userId').html();
		console.log(userId);
		
		if(userId != null){
			var point = sessionStorage.getItem('point');
			if( point != null){
				sessionStorage.removeItem('point');
			}
			
			//ajax-call
			$.ajax({
	            url: "/dotstore_mysql/top.do",
	            type: "POST",
	            data : {userId: userId},
	            dataType: "text",
	            success: function (data) {
	            	console.log("성공?!" + data);
	            	sessionStorage.setItem('point', data); // 가져왔으면 sessionstroage에 넣기
	            	$('#pointVal').html(data + "P");
	            },
	            error : function(e1, e2){
	                console.log("error!");
	            }
	        });
	    }
	});
</script>