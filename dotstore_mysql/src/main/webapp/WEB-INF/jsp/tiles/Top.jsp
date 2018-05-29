<%@ page pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet" href="../style/top.css?ver=8" />
<div class="top-container">
	<nav class="navbar navbar-expand-lg top-nav-color">
		<a class="navbar-brand" href="<c:url value="/shop/index.do"/>"> <img
			class="dot-logo" border="0" src="../images/dot-logo.png" /></a>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link category-item" href="<c:url value="/shop/categoryList.do"/>">C2P</a>
				<a class="nav-item nav-link category-item" href="#">P2P</a>
				<a class="nav-item nav-link category-item" href="<c:url value="/shop/auctionList.do"/>">AUCTION</a>
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
<%-- <div class="container top-div">
	<table>
		<!--  class="top"> -->
		<tr>
			<td><a href="<c:url value="/shop/index.do"/>"> <img
					border="0" src="../images/store-logo.png" /></a></td>
			<td style="text-align: right"><a
				href="<c:url value="/shop/viewCart.do"/>"> <img border="0"
					name="img_cart" src="../images/cart.gif" /></a> <img border="0"
				src="../images/separator.gif" /> <c:if
					test="${empty userSession.account}">
					<a href="<c:url value="/shop/signonForm.do"/>"> <img border="0"
						name="img_signin" src="../images/sign-in.gif" /></a>
				</c:if> <c:if test="${!empty userSession.account}">
					<a href="<c:url value="/shop/signoff.do"/>"> <img border="0"
						name="img_signout" src="../images/sign-out.gif" /></a>
					<img border="0" src="../images/separator.gif" />
					<a href="<c:url value="/shop/editAccount.do"/>"> <img
						border="0" name="img_myaccount" src="../images/my_account.gif" /></a>
				</c:if> <img border="0" src="../images/separator.gif" />&nbsp; <a
				href="../help.html"><img border="0" name="img_help"
					src="../images/help.gif" /></a></td>
			<td style="text-align: left">
				<form action="<c:url value="/shop/searchProducts.do"/>"
					method="post">
					<input type="hidden" name="search" value="true" /> <input
						type="text" name="keyword" size="14" />&nbsp; <input
						src="../images/search.gif" type="image" />
				</form>
			</td>
		</tr>
	</table>

	<%@ include file="IncludeQuickHeader.jsp"%>

</div>

 --%>