<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="IncludeTop.jsp"%>
<body>
	<div id="" ></div>
	<form method="post" name="" action="">
		<div id="">
			<div id="pop_container" class="">
				<div class="">
					<div id="tab1" class="">
						<ul>
							<li><span><a class="" href="<c:url value="/msg/send.do" />" >쪽지쓰기</a></span></li>
							<li><span class="">받은쪽지</span></li>
							<li><span><a class="" href="<c:url value="/msg/list.do" />" >보낸쪽지</a></span></li>
							<li><span> 검색 <input type="text" id="" name="" class="" title="검색어를 입력하세요." value="">
									<input type="image" id="" src="" class="" alt="검색" title="검색" />
							</span></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="pop-">
				<table class="" border="1" summary="받은쪽지 목록(아이디,이름,제목,날짜 항목)">
					<caption>받은쪽지 목록</caption>

					<thead>
						<tr>
							<th scope="col" class=""><label style="display: inline;"><input
									type="checkbox" id="" name="" value="" class=""></label></th>
							<th scope="col">보낸사람</th>
							<th scope="col">제목</th>
							<th scope="col" class="">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${messageList}">
							<tr>
							<td class="chk"><input type="checkbox" id="" name="wrtInform" value="208290" class="chktype01"></td>
							<td>${m.senderId}</td>
							<td class=""><a href="<c:url value="/msg/detail.do?id=${m.id}"/>"class="">${m.title}</a></td>
							<td><fmt:formatDate value="${m.createAt}" pattern="yyyy-MM-dd" /></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- Paging -->
			<div class="">
				<em title="현재 선택 목록"> <strong class="">1</strong>
				</em> &nbsp;<a class="" href="">2</a>&nbsp;
			</div>
			<button type="button" id="">삭제</button>
		</div>
	</form>
</body>

<%@ include file="IncludeBottom.jsp"%>