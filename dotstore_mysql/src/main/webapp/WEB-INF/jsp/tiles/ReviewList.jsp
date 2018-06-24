
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/reviewList.css?ver=9"/>

<hr />
  	
<c:if test="${!empty userSession.account}">
	<div id="reviewInput">
	<c:if test="${isWritable}">
		<form method="POST" action="<c:url value="/shop/${item.itemId}/review.do"/>">
		   	<div class="input-group">
		      <textarea class="form-control" name="content" rows="3"></textarea>
		      <span class="input-group-btn">
		        <button class="btn btn-secondary" id="comment_submit" type="submit" style="width: 50px;">입력</button>
		      </span>
			 </div>
	    </form>   
	</c:if>
	</div>       
</c:if>

 <div class="container review-container">
	<ul id="reviewList" class="list_review">
		<c:forEach var="r" items="${reviewList}" varStatus="i">                
		    <li>
		    <!--  id 값 바꾸면 안됌 -->
		        <div id="review_content">
		            <p class="contentTag" id="contentTag">상품평 : ${r.content}</p>
		            <div class="info_review" style="overflow:visible">
		                <span class="txt_user" style="padding-top:5px">작성자 : ${r.userId} 
		                	<span class="txt_date"><fmt:formatDate value="${r.createAt}" pattern="yyyy-MM-dd" /></span>
		                </span>
		                
		                <!-- 유저가 수정, 삭제 권한이 있을 경우 버튼 보여주기 -->
		                <c:if test="${userSession.account.username == r.userId}">
			                <span class="link_del" >
			                	<a class="remove btn btn-gradient" href='<c:url value="/review.do">
			                	<c:param name="reviewId" value="${r.reviewId}"/>
			                	<c:param name="itemId" value="${r.itemId}"/>
			                	</c:url>'>삭제</a>
							</span>
							<span class="link_edit" ><a class="edit btn btn-gradient" href="javascript:edit('${i.index}', '${r.content}')">수정</a></span>
						</c:if>
						 <c:if test="${!i.last }"><hr> </c:if>
						
					</div>
				</div>
				
				<!--  수정시에만 작동 : id 값 바꾸면 안됌 -->
				<div id="review_edit" style="display:none">
	                <div id="editInput" class="edit_layer" >
						<span class="input-group">
					      <textarea class="editContent" id="editContent" name="content" rows="3" ></textarea>
					      <span class="input-group-btn">
					      <input class="btn btn-gradient" id="replyBtn" type="button" value="수정" onclick="updateReview('${i.index}', '${r.reviewId}')">
					    </span>
	                </div>
				</div>
		    </li>
	    </c:forEach>
	  </ul>
  </div>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	
	function edit(index, content){
	 	//alert(index);
	 	/* $("div#review_content:eq(index)").hide();
	 	 $("div#review_edit:eq(index)").show(); */
	 
	 	$('div#review_content').eq(index).hide();
	 	$('div#review_edit').eq(index).show();
	 	$('textarea#editContent').eq(index).val(content);
	 	$('#reviewInput').hide();
	 	
	 	$('a.remove').hide();
	 	$('a.edit').hide();

	}
	
	function updateReview(index, reviewId){
		var content = $('textarea#editContent').eq(index).val();
		
		 var data = {
			reviewId : reviewId,
            content : content
        }
		//alert(data.content)
		 
        $.ajax({
            url: "/dotstore_mysql/edit/review.do",
            type: "POST",
            data : JSON.stringify(data),
            dataType: "json",
            contentType : "application/json",
            success: function () {
            	console.log("성공?!");
            	$('div#review_edit').hide();
            	$('div#review_content').show();
            	$('#reviewInput').show();
            	$('p#contentTag').eq(index).text(content);
            	
            	$('a.remove').show();
        	 	$('a.edit').show();
            },
            error : function(e1, e2){
                console.log("error!");
            }
        });
    }

</script>
