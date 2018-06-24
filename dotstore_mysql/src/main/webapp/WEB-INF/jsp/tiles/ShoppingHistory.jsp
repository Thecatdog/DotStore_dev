<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/shoppingHistory.css?ver=8"/>

<%--
    display: none , id 건들지 말것 
--%>
	<div class="history-container">
		<br/>
		<strong style="color:white">최근 본 상품</strong>
		<br/><br/>
		<div class="slider_container">
			<div class="frame">
				<table align="center" style="width:50vw">
					<tr id="noti">
					</tr>
					<strong id="none_noti" style="display:none;">
						<span>저장된 히스토리가 없습니다.</span>
					</strong>
				</table>

			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
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
			
			if(list.length != 0){
				$('#noti').show();
				$('#none_noti').hide();

				var tagList = [];
				for (i = 0; i < 5; i++) {
					var strArray = list[i].split('|');
					var tag = 
						'<td align="center" class="history-item"> <img class="history-logo" border="0" src="/dotstore_mysql/images/archive-black-box.png" /><br/><br/> <b>' 
						+ strArray[0] 
						+ '</b><br/><small>' 
						+ strArray[1] 
						+ '</small><br/><p>' 
						+ strArray[2] 
						+ '</p></td>';
						
					tagList += tag;
				}
				$('#noti').html(tagList);
				
			} else {
				$('#none_noti').show();
			}
		});
	</script>