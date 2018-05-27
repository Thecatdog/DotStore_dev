<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<title>경매 등록 폼</title>

<body id="">
    <div align="center">
        <p>경매 상품 등록을 위한 작성 폼입니다.</p>

        <form:form commandName="auctionForm" method="post">
            <label for="">상품 이름</label><br>
            <form:input path="auction.name" /><br>
             
            <label for="">상품 설명</label><br>
            <form:input path="auction.description" /><br>
             
            <label for="">경매 시작 가격</label><br>
            <form:input path="auction.startPrice" /><br>
             
            <label for="">마감 시간 설정</label><br>
            <form:input path="auction.deadline" /><br>
            <br><br>

            <div class="" >
                <span class="">
                    <button type="submit" id="">등록</button>
                </span>
                <span class="">
                    <button type="button" id="">
                    	<a href='<c:url value="/shop/auctionList.do"/>'>취소</a>
                    </button>
                </span>
            </div>
        </form:form>

    </div>
</body>

