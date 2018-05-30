<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/msgList.css?ver=35"/>

<div class="container msg-container">
	<nav class="nav nav-pills flex-column flex-sm-row">
	  <a class="flex-sm-fill text-sm-center nav-link msg-tab <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/dotstore_mysql/msg/recv/list.do'}">active</c:if>" href="<c:url value="/msg/recv/list.do" />">받은메세지</a>
	  <a class="flex-sm-fill text-sm-center nav-link msg-tab <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/dotstore_mysql/msg/sent/list.do'}">active</c:if>" href="<c:url value="/msg/sent/list.do" />">보낸메세지</a>
	</nav>
	<form method="POST" action="<c:url value="/msg.do"/>">
		<table class="table table-hover div-body">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">제목</th>
					<th scope="col">보낸사람</th>
					<th scope="col">날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="m" items="${messageList}">
					<tr>
						<td class="chk"><input name="delList" type="checkbox"
							value="${m.id}" /></td>
						<td class="message-title"><a class="message-title" href="<c:url value="/msg/detail.do?id=${m.id}"/>" class="">${m.title}</a></td>
						<td class="">${m.senderId}</td>
						<td><fmt:formatDate value="${m.createAt}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<table class="table table-hover div-footer">
			<tfoot>
				<tr class="btn-group-msg">
					<td>
						<button class="btn-gradient btn-msg-del" type="submit"><i class="fas fa-trash-alt msg-icon"></i></button>
					</td>
					<td colspan="2">
						<div class="input-group mb-3">
							<input type="text" class="form-control"
								placeholder="검색어를 입력하세요."
								aria-label="message keyword"
								aria-describedby="basic-addon2" id="searchKey" name="searchKey">
							<div class="input-group-append">
								<button class="btn btn-search" type="submit" name="search"><i class="fas fa-search"></i></button>
							</div>
						</div> 
					</td>
					<td>
						<a class="btn-gradient btn-msg-send" href="<c:url value="/msg/send.do" />" >메세지 보내기</a>
					</td>
				</tr>
				<tr>
					<td class="page-num" colspan="4">
					<c:forEach var="page" begin="1" end="${pageLen}">
							<c:choose>
								<c:when test="${currPage eq page}">
									<em title="현재 선택 목록"><strong class="">${page}</strong>
								</c:when>
								<c:otherwise>
									</em> &nbsp;<a class="" href="<c:url value="?page=${page}"/>">${page}</a>&nbsp;
						</c:otherwise>
							</c:choose>
					</c:forEach> <!-- Paging Numbering End --></td>
				</tr>
			</tfoot>

		</table>
	</form>

</div>

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
	