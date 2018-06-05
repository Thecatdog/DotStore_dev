<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/top.css?ver=11" />
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
					<span class="welcome-msg">환영합니다, <b>${userSession.account.firstName}</b>
						님!
					</span>
					<a class="fas fa-user icon" href="#"></a>
					<a class="fas fa-envelope icon"
						href="<c:url value="/msg/recv/list.do" />"></a>
					<a class="fas fa-shopping-cart icon" href="#"></a>
					<a href="<c:url value="/shop/signoff.do"/>"
						class="btn btn-gradient">LOGOUT</a>
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
