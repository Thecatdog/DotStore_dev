<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="IncludeTop.jsp"%>

	<div id="">
		<div class=""></div>
		<div class="">
			<div id="" class="">

				<div class="">
					<div id="" class="">
						<ul>
							<li><span><a class="" href="<c:url value="/msg/send.do" />" >쪽지쓰기</a></span></li>
							<li><span><a class="" href="<c:url value="/msg/recv/list.do" />" >받은 쪽지</a></span></li>
							<li><span><a class="" href="<c:url value="/msg/sent/list.do" />" >보낸 쪽지</a></span></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="">
				<table class="" border="1">
					<tbody>
						<tr>
							<th scope="row">제목</th>
							<td colspan="3">${message.title}</td>
						</tr>
						<tr>
							<th scope="row">보낸 사람</th>
							<td>${message.senderId}</td>
							<th scope="row">받은 시간</th>
							<td><fmt:formatDate value="${message.createAt}" pattern="yyyy-MM-dd" /></td>
						</tr>
						<tr>
							<td class="textviewer" colspan="4">
								<p>${message.context}<p>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- Button(삭제, 목록) 시작 -->
				<div class="bbs-rbutton02">
					<span class="button large icon">
						<button type="button" onclick="location.href='<c:url value="/msg.do?id=${message.id}"/>' " >삭제</button>
						<button onclick="goBack()">목록</button>
					</span>
				</div>
				<!-- Button 끝 -->

			</div>
		</div>
	</div>


<%@ include file="IncludeBottom.jsp"%>

<script>
	function goBack() {
	    window.history.back();
	}
</script>
