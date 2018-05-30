

<%--
    display: none , id 건들지 말것 
--%>
<body>
	<div>
		<strong>ì¼í íì¤í ë¦¬</strong>
		<div class="slider_container">
			<div class="frame">
				<!-- <ul class="noti" style="display:none;"> -->
				<ul class="noti" >
					<li>금붕어 FISH 1400.0</li>
					<li>금붕어 FISH 1400.0</li>
					<li>금붕어 FISH 1400.0</li>
				</ul>

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



