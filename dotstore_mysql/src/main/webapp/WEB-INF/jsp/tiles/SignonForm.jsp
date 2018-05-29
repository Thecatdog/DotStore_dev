<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet"
	href="../style/signonform.css?ver=4" />

<c:if test="${!empty message}">
	<b><font color="red"><c:url value="${message}" /></font></b>
</c:if>

<div class="container" align="center">
	<form class="login-form" action='<c:url value="/shop/signon.do"/>'
		method="POST">
		<a href="<c:url value="/shop/index.do"/>">
		<img class="dot-logo" border="0" src="../images/dot-logo.png" /></a>
		<div class="form-group">
			<label for="username">ID</label>
			<input
				type="email" class="form-control" id="username" name="usename"
				aria-describedby="emailHelp" placeholder="Enter User ID">
		</div>
		<div class="form-group">
			<label for="password">PW</label> 
			<input
				type="password" class="form-control" id="password" name="password"
				placeholder="Enter Password">
		</div>
		<button type="submit" class="btn btn-gradient">LOGIN</button>
		<br />
		<a href="<c:url value="/shop/newAccount.do"/>" class="btn btn-gradient btn-sign-up">SIGN UP</a>
		<%-- 
    <c:if test="${!empty signonForwardAction}">
      <input type="hidden" name="forwardAction"
        value='<c:url value="${signonForwardAction}"/>' />
    </c:if>
    <table>
      <tr>
        <td colspan="2">Please enter your username and password. <br />&nbsp;
        </td>
      </tr>
      <tr>
        <td>Username:</td>
        <td><input type="text" name="username" size="20" value="j2ee" /></td>
      </tr>
      <tr>
        <td>Password:</td>
        <td><input type="password" name="password" size="20" value="j2ee" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><input name="update" type="image" src="../images/button_submit.gif" /></td>
      </tr>
    </table> --%>
	</form>
</div>