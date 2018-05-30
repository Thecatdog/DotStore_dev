<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link type="text/css" rel="stylesheet"
	href="/dotstore_mysql/style/accountform.css?ver=9" />

<div align="center">
	<form:form commandName="accountForm" method="post">
		<form:errors cssClass="error" />
		<br>
		<br>
		<table class="account-table" align="center">
			<tr>
				<td><a href="<c:url value="/shop/index.do"/>"> <img
						class="dot-logo" border="0" src="../images/dot-logo.png" /></a></td>
			</tr>
			<tr>
				<td>
				<hr class="account-hr"/>
				<table class="n13" align="center">
					<tr>
						<td class="label">ID</td>
						<td><c:if test="${accountForm.newAccount}">
								<form:input path="account.username" class="form-control" />
								<B><form:errors path="account.username" cssClass="error" /></B>
							</c:if> <c:if test="${!accountForm.newAccount}">
								<c:out value="${accountForm.account.username}" />
							</c:if></td>
					</tr>
					<tr>
						<td class="label">Password</td>
						<td><form:password path="account.password" class="form-control" /> <B><form:errors
									path="account.password" cssClass="error" /></B></td>
					</tr>
					<tr>
						<td class="label">Repeat Aassword</td>
						<td><form:password path="repeatedPassword" class="form-control"/> <B><form:errors
									path="repeatedPassword" cssClass="error" /></B></td>
					</tr>
				</table>
				<%@ include file="IncludeAccountFields.jsp"%>

				</td>
			</tr>
		</table>
		<br />
		<button type="submit" class="btn btn-gradient">SUBMIT</button>
	</form:form>
	<p></p>
<%-- 	<h3>
		<b><a href='<c:url value="/shop/listOrders.do"/>'>My Orders</a></b>
	</h3>
 --%>
</div>
