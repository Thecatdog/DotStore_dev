<%--
    display: none 이것 내비둘 것!
   	id 값 건들지 말것 
--%>
<<<<<<< Updated upstream
<div>
  <strong>쇼핑 히스토리</strong>

  <div class="slider_container">
    <div class="frame">

      <%-- user 가 로그인 되어있는지 확인. --%>

      <ul style="display: none;">

          <%-- jquery  작성 --%>


      </ul>

      <strong class="none_noti">
        <span>쇼핑 히스토리가<br>없습니다.</span>
      </strong>

    </div>
  </div>
</div>
=======
<body>
	
	<!--  쇼핑 히스토리 테스트 -->
	<div>
		<strong>쇼핑 히스토리</strong>
		<div class="slider_container">
			<div class="frame">
				<!-- 리스트 이 있으면 ul 태그의 display:none 지우기 -->	
				<!-- <ul class="noti" style="display:none;"> -->
				<ul class="noti" >
					<li>바보물고기 FISH 1400.0</li>
					<li>바보물고기 FISH 1400.0</li>
					<li>바보물고기 FISH 1400.0</li>
				</ul>
				
				<!-- 리스트 값이 없으면 아래 출력 -->
				<!-- <strong class="none_noti">
					<span>쇼핑 히스토리가<br>없습니다.</span>
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
		 		list.unshift(str); // 앞에서부터 저장
				localStorage.setItem('list', JSON.stringify(list));
			}
		});
	</script>
	<!--  쇼핑 히스토리 테스트 끝 -->

</body>

<%@ include file="IncludeBottom.jsp"%>
>>>>>>> Stashed changes
