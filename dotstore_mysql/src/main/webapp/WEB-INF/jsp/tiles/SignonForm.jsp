<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet"
	href="/dotstore_mysql/style/signonform.css?ver=4" />

<c:if test="${!empty message}">
	<b><font color="red"><c:url value="${message}" /></font></b>
</c:if>

<div class="container" align="center">
	<form class="login-form" action='<c:url value="/shop/signon.do"/>'
		method="POST">
		<c:if test="${!empty signonForwardAction}">
			<input type="hidden" name="forwardAction"
				value='<c:url value="${signonForwardAction}"/>' />
		</c:if>
		<a href="<c:url value="/shop/index.do"/>"> <img class="dot-logo"
			border="0" src="../images/dot-logo.png" /></a>
		<div class="form-group">
			<label for="username">ID</label> <input type="text"
				class="form-control" id="username" name="username"
				aria-describedby="emailHelp" placeholder="Enter User ID">
		</div>
		<div class="form-group">
			<label for="password">PW</label> <input type="password"
				class="form-control" id="password" name="password"
				placeholder="Enter Password">
		</div>
		<input type="submit" id="name" class="btn btn-gradient" value="LOGIN" />
		<br /> <a href="<c:url value="/shop/newAccount.do"/>"
			class="btn btn-gradient btn-sign-up">SIGN UP</a>
	</form>

</div>