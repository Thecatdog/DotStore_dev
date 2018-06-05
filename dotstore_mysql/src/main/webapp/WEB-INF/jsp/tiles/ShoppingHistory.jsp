<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/shoppingHistory.css?ver=7"/>

<%--
    display: none , id 건들지 말것 
--%>
	<div class="history-container">
		<br/>
		<strong style="color:white">최근 본 상품</strong>
		<br/><br/>
		<div class="slider_container">
			<div class="frame">
				<!-- <ul class="noti" style="display:none;"> -->
				<table align="center" style="width:10vw">
					<tr>
						<td align="center" class="history-item">
							<img class="history-logo" border="0" src="/dotstore_mysql/images/archive-black-box.png" /><br/><br/>
							<b>금붕어</b><br/>
							<small>FISH</small><br/>
							<p>가격</p>
						</td>
					</tr>
				</table>
				<!-- <ul class="noti">
					<li>금붕어 FISH 1400.0</li>
					<li>금붕어 FISH 1400.0</li>
					<li>금붕어 FISH 1400.0</li>
				</ul> -->

				<!-- <strong class="none_noti">
					<span>저장된 히스토리가 없습니다.</span>
				</strong>
					 -->
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			/* localStorage */
			var out = localStorage.getItem('list');
			var list = JSON.parse(out);
			if ( list == null) list = [];
			
			var id = $('#itemName').html();
			var category = $('#cate').html();
			var price = $('#price').html();
			var str = id+'|'+category+'|'+price;
			
			if(id != null) {
		 		list.unshift(str);
				localStorage.setItem('list', JSON.stringify(list));
			}
		});
	</script>