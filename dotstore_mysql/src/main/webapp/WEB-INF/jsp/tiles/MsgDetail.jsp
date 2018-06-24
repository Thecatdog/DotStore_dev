<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link type="text/css" rel="stylesheet"
	href="/dotstore_mysql/style/msgDetail.css?ver=5" />
<div class="container msg-container">
	<nav class="nav nav-pills flex-column flex-sm-row">
		<a
			class="flex-sm-fill text-sm-center nav-link msg-tab <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/dotstore_mysql/msg/recv/list.do'}">active</c:if>"
			href="<c:url value="/msg/recv/list.do" />">받은메세지</a> <a
			class="flex-sm-fill text-sm-center nav-link msg-tab <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/dotstore_mysql/msg/sent/list.do'}">active</c:if>"
			href="<c:url value="/msg/sent/list.do" />">보낸메세지</a> <a
			class="flex-sm-fill text-sm-center nav-link msg-tab"
			href="<c:url value="/msg/send.do" />">메세지 보내기</a>
	</nav>

	<div align="center">
		<table class="table table-hover div-body">
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">${message.title}</td>
				</tr>
				<tr>
					<th scope="row">보낸 사람</th>
					<td>${message.senderId}</td>
					<th scope="row">받은 시간</th>
					<td><fmt:formatDate value="${message.createAt}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<td class="textviewer" colspan="4">
						<p>${message.context}
						<p>
					</td>
				</tr>
			</tbody>
		</table>

	</div>
	<div class="bbs-rbutton02">
		<span class="button large icon">
			<button class="btn-gradient btn-msg-send" type="button"
				onclick="location.href='<c:url value="/msg.do?id=${message.id}"/>' ">
				<i class="fas fa-trash-alt"></i>
			</button>
			<button class="btn-gradient btn-msg-send" type="button"
				onclick="location.href='<c:url value="/msg/send.do">
							<c:param name="messageId" value="${message.id}"/>
							</c:url>'">
				<i class="fas fa-share-square"></i>
			</button>
			<button class="btn-gradient btn-msg-send" onclick="goBack()">
				<i class="fas fa-list-ul"></i>
			</button>
		</span>
	</div>

</div>



<script>
	function goBack() {
		window.history.back();
	}
</script>
