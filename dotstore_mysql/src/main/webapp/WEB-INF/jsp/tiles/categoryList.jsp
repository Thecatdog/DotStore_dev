<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/categoryList.css?ver=14"/>
<div class="container cateList-container">
	<table>
	<thead>
		<tr>
			<td colspan="5">
				<div class="spanarea">
					<span class="info-message">당신이 원하는 동물의 종류를 선택하세요.</span>
					<hr class="cate-list-line"/>
				</div>
			</td>
		</tr>
	</thead>
		<tr>
			<td>
				<a href="<c:url value="/shop/viewCategory.do?categoryId=DOGS"/>">
	            	<img class="image" border="0" src="/dotstore_mysql/images/dog-logo.png" />
	            </a>
			</td>
			<td>
				<a href="<c:url value="/shop/viewCategory.do?categoryId=FISH"/>">
	            	<img border="0" src="/dotstore_mysql/images/fish-logo.png" />
	            </a>
			</td>
			<td>
				<a href="<c:url value="/shop/viewCategory.do?categoryId=BIRDS"/>">
	            	<img border="0" src="/dotstore_mysql/images/parrot-logo.png" />
	            </a>
			</td>
			<td>
				<a href="<c:url value="/shop/viewCategory.do?categoryId=CATS"/>">
	            	<img border="0" src="/dotstore_mysql/images/cat-logo.png" />
	            </a>
			</td>
			<td>
				<a href="<c:url value="/shop/viewCategory.do?categoryId=REPTILES"/>">
	            	<img border="0" src="/dotstore_mysql/images/reptiles-logo.png" />
	            </a>
			</td>
		</tr>
	</table>
</div>