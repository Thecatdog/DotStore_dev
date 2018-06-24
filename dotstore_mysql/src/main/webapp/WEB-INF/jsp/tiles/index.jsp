<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/index.css?ver=13" />
<div class="main-background "></div>
	<div class="body-container ">
		<div class="best-seller">
		<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
		  <div class="carousel-inner">		 
		    <div class="carousel-item active">
		    	<h2>C2P Best Seller</h2>
					<c:forEach var="c" items="${c2pItem}">
					<div style='display:inline;'>
						<div class="card" style="width: 13rem; display:inline; float:left;">
						  <img class="card-img-top history-logo" src="/dotstore_mysql/images/archive-black-box.png" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title">${c.itemId}</h5>
						    <small class="card-text">${c.productId}</small>
						    <p class="card-text">${c.listprice}</p>
						  </div>
						</div>
					</div>
					</c:forEach>
		    </div>
		    <div class="carousel-item">
		    	<h2>P2P Best Seller</h2>
				<c:forEach var="p" items="${p2pItem}">
					<div style='display:inline;'>
						<div class="card" style="width: 13rem; display:inline; float:left;">
						  <img class="card-img-top history-logo" src="/dotstore_mysql/images/archive-black-box.png" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title">${p.itemId}</h5>
						    <small class="card-text">${p.productId}</small>
						    <p class="card-text">${p.listprice}</p>
						  </div>
						</div>
					</div>
				</c:forEach>
				  <div class="carousel-caption d-none d-md-block">
				    <h5>...</h5>
				    <p>...</p>
				  </div>				
		    </div>
		    <div class="carousel-item">
		    	<h2>AUCTION Best Seller</h2>
				<c:forEach var="a" items="${auctionBestSellers}">
					<div style='display:inline;'>
						<div class="card" style="width: 13rem; display:inline; float:left;">
						  <img class="card-img-top history-logo" src="/dotstore_mysql/images/archive-black-box.png" alt="Card image cap">
						  <div class="card-body">
						    <h5 class="card-title">${a.itemId}</h5>
						    <small class="card-text">${a.productId}</small>
						    <p class="card-text">${a.listprice}</p>
						  </div>
						</div>
					</div>
				</c:forEach>
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>

			
			
		</div>
	</div>
</div>
