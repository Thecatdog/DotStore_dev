<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="IncludeTop.jsp"%>
<body id="">
	<div id="">
		<form method="POST" name="" action="send.do">
			<div class="">
				<div id="">
					<!-- 탭부분 -->
					<div class="">
						<div id="">
							<ul>
								<li><span class="" >쪽지쓰기</span></li>
								<li><span><a class="" href="<c:url value="/msg/list.do" />">받은쪽지</a></span></li>
								<li><span><a class="" href="<c:url value="/msg/list.do" />" >보낸쪽지</a></span></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="">
					<table class="" border="1">
					
						<tbody>
							<tr>
								<th scope="row"><label for="wrtTitle">제목</label></th>
								<td><input id="" type="text" class="" name="title"
									maxlength="256" value=""></td>
							</tr>
							<tr>
								<th scope="row"><label for="recevPerson">받는사람</label></th>
								<td><input id="" type="text" class="" name="receiverId"
									maxlength="256" value=""></td>
							</tr>
							<tr>
								<th scope="row"><label for="wrtContent">내용</label></th>
								<td class=""><textarea id="" name="context" class=""></textarea></td>
							</tr>
						</tbody>
					</table>
					<button type="submit">전송</button>
				</div>
			</div>
		</form>
	</div>
</body>

<%@ include file="IncludeBottom.jsp"%>