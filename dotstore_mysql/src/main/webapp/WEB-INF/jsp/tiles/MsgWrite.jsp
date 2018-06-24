<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link type="text/css" rel="stylesheet"
	href="/dotstore_mysql/style/msgWrite.css?ver=10" />

<div class="container msg-container">
	<nav class="nav nav-pills flex-column flex-sm-row">
		<a
			class="flex-sm-fill text-sm-center nav-link msg-tab <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/dotstore_mysql/msg/recv/list.do'}">active</c:if>"
			href="<c:url value="/msg/recv/list.do" />">받은메세지</a> <a
			class="flex-sm-fill text-sm-center nav-link msg-tab <c:if test="${requestScope['javax.servlet.forward.request_uri'] eq '/dotstore_mysql/msg/sent/list.do'}">active</c:if>"
			href="<c:url value="/msg/sent/list.do" />">보낸메세지</a>
	</nav>
	<form method="POST" name="" action="send.do">
		<div class="">
			<div class="table-space">
				<table class="table table-hover">
					<thead>
						<tr>
							<td colspan="2"><h4>MESSAGE FORM</h4></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row"><label for="wrtTitle">제목</label></th>
							<td><input id="" type="text" class="" name="title" maxlength="256" value="" required></td>
						</tr>
						<tr>
							<th scope="row"><label for="recevPerson">받는사람</label></th>
							<td><input id="" type="text" class="" name="receiverId"
								maxlength="256" value="${msg.senderId}"></td>
						</tr>
						<tr>
							<th scope="row"><label for="wrtContent">내용</label></th>
							<td class="">
								<c:choose>
								<c:when test="${!empty msg}">
									<textarea id="" name="context" class="">
		------------------------------------------
		받은 메시지 전문 
		제목   ${msg.title}
		보낸이  ${msg.senderId}
		내용 
			${msg.context}
									</textarea>
								</c:when>
								<c:otherwise>
									<textarea id="" name="context" class="" ></textarea>
								</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</tbody>
				</table>
				<button class="btn btn-gradient" type="submit">전송</button>
			</div>
		</div>
	</form>

</div>