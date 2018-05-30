<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="Top.jsp"%>
<link type="text/css" rel="stylesheet" href="../style/categoryList.css?ver=9"/>
<div class="container cateList-container">
	<table>
	<thead>
		<tr>
			<td colspan="5"><span>당신이 원하는 동물의 종류를 선택하세요.</span></td>
		</tr>
	</thead>
		<tr>
			<td>
				<a href="<c:url value="/shop/viewCategory.do?categoryId=DOGS"/>">
	            	<img border="0" src="../images/dog-logo.png" />
	            </a>
			</td>
			<td>
				<a href="<c:url value="/shop/viewCategory.do?categoryId=FISH"/>">
	            	<img border="0" src="../images/fish-logo.png" />
	            </a>
			</td>
			<td>
				<a href="<c:url value="/shop/viewCategory.do?categoryId=BIRDS"/>">
	            	<img border="0" src="../images/parrot-logo.png" />
	            </a>
			</td>
			<td>
				<a href="<c:url value="/shop/viewCategory.do?categoryId=CATS"/>">
	            	<img border="0" src="../images/cat-logo.png" />
	            </a>
			</td>
			<td>
				<a href="<c:url value="/shop/viewCategory.do?categoryId=REPTILES"/>">
	            	<img border="0" src="../images/reptiles-logo.png" />
	            </a>
			</td>
		</tr>
	</table>
</div>