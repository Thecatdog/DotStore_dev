<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/index.css?ver=5" />
<div class="main-background "></div>
	<div class="body-container ">
		<div class="best-seller">
			<h1>C2P BEST SELLER</h1>
			<table>
				<c:forEach var="c" items="${c2pBestSellers}">
					<tr>
						<td>
							<img class="history-logo" border="0" src="/dotstore_mysql/images/archive-black-box.png" /><br/><br/>
							<b>${c.itemId}</b><br/>
							<small>${c.productId}</small><br/>
							<p>${c.listprice}</p>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<%-- <h1>P2P BEST SELLER</h1>
			<table>
				<c:forEach var="p" items="${p2pBestSellers}">
					<tr>
						<td>
							<img class="history-logo" border="0" src="/dotstore_mysql/images/archive-black-box.png" /><br/><br/>
							<b>${p.itemId}</b><br/>
							<small>${p.productId}</small><br/>
							<p>${p.listprice}</p>
						</td>
					</tr>
				</c:forEach>
			</table> --%>
			
			<h1>AUCTION BEST SELLER</h1>
			<table>
				<c:forEach var="a" items="${auctionBestSellers}">
					<tr>
						<td>
							<img class="history-logo" border="0" src="/dotstore_mysql/images/archive-black-box.png" /><br/><br/>
							<b>${a.itemId}</b><br/>
							<small>${a.productId}</small><br/>
							<p>${a.listprice}</p>
						</td>
					</tr>
				</c:forEach>
			</table>
			
		</div>
	</div>
</div>
