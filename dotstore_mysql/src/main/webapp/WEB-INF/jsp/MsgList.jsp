<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="IncludeTop.jsp"%>

<body>
	<div id="">
		<div id="pop_container" class="">
			<div class="">
				<div id="tab1" class="">
					<ul>
						<li><span><a class="" href="<c:url value="/msg/send.do" />" >쪽지쓰기</a></span></li>
						<li><span><a class="" href="<c:url value="/msg/recv/list.do" />">받은쪽지</span></li>
						<li><span><a class="" href="<c:url value="/msg/sent/list.do" />" >보낸쪽지</a></span></li>
						<form method="GET" action="<c:url value="/msg/search/list.do" /> ">
							<li><span> 검색 
								<input type="text" id="searchKey" name="searchKey" title="검색어를 입력하세요."/>
								<button type="submit" name="search">검색</button>
							</span></li>
						</form>
					</ul>
				</div>
			</div>
		</div>
			
		<form method="POST" action="<c:url value="/msg.do"/>">
			<div class="pop-">
				<table class="" border="1" summary="받은쪽지 목록(아이디,이름,제목,날짜 항목)">
					<caption>쪽지 목록</caption>

					<thead>
						<tr>
							<th scope="col" class="">
								<label style="display: inline;">
									<input type="checkbox" id="" name="" value="" class="">
								</label>
							</th>
							<th scope="col">보낸사람</th>
							<th scope="col">제목</th>
							<th scope="col">날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${messageList}">
							<tr>
							<td class="chk"><input name="delList" type="checkbox" value="${m.id}" /></td>
							<td>${m.senderId}</td>
							<td class=""><a href="<c:url value="/msg/detail.do?id=${m.id}"/>"class="">${m.title}</a></td>
							<td><fmt:formatDate value="${m.createAt}" pattern="yyyy-MM-dd" /></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<!-- Paging Numbering Start -->
			<div class="">
			<c:forEach var="page" begin="1" end="${pageLen}">
				<c:choose>
					<c:when test="${currPage eq page}">
						<em title="현재 선택 목록"><strong class="">${page}</strong>
					</c:when>
					<c:otherwise>
						</em> &nbsp;<a class="" href="<c:url value="?page=${page}"/>" >${page}</a>&nbsp;
					</c:otherwise>
				</c:choose>			
			</c:forEach>
			<!-- Paging Numbering End -->
			</div>
			<button type="submit">삭제</button>
		</div>
	</form>
	
	<!-- <script type="text/javascript">
		$(document).ready(function(){
			$('#search').click(function(){
				$.ajax({
					type: "post",
					url: "/msg/search",
					data: "key=" + $('#searchKey').val(),
					success: function(){
						// 모르겟
					}
				});
			});
		});
	</script> -->
	
</body>

<%@ include file="IncludeBottom.jsp"%>