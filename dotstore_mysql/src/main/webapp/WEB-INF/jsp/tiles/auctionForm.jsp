<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<title>경매 등록 폼</title>

<body id="">
    <div align="center">
        <p>경매 상품 등록을 위한 작성 폼입니다.</p>

        <form method="POST" name="fm" action="<c:url value="/shop/auctionForm.do"/>"> 
        
        <label for="">Category Id</label><br>
		<select name="categoryId" id="categoryId" onChange="redirect(this.options.selectedIndex)">
		<option value="">---선택하세요---</option>
		<c:forEach var="cate" items="${categories}">
		<option value="${cate}">${cate}</option>
		</c:forEach>
		</select>
		<br>
		            
		<label for="">Product Id</label><br>
		<select name="productId" id="productId">
		<option value="">---카테고리를 먼저 선택해주세요---</option>
		</select><br>
            
            <label for="">상품 이름</label><br>
            <input id="" type="text" class="" name="itemId" required /><br>
             
            <label for="">경매 가격</label><br>
            <input id="" type="number"  class="" name="listprice" required /><br>
             
			<label for="">단일 비용</label><br>
			<input id="" type="number" name="unitcost" /><br>
            
            <label for="">공급자(회사/회원 아이디)</label><br>
            <input type="radio" name="companySupplier" value="member" checked="checked" /> 회원 <br>
            <input type="radio" name="companySupplier" value="company"/> 회사 <br>
            
          <label for="">status</label><br>
          <input type="text" name="status" /><br>
          
          <label for="">attr1</label><br>
          <input type="text" name="attr1" /><br>
          
          <label for="">attr2</label><br>
          <input type="text" name="attr2" /><br>
          
          <label for="">attr3</label><br>
          <input type="text" name="attr3" /><br>
          
          <label for="">attr4</label><br>
          <input type="text" name="attr4" /><br>
          
          <label for="">attr5</label><br>
           <input type="text" name="attr5" /><br> 
            
            <label for="">마감 시간</label><br>
            <input type="date" name="dueTime" required /><br>
            
            <label for="">상품 설명</label><br>
            <textarea rows="" cols="" name="description" required ></textarea><br>
            
            <br><br>

            <div class="" >
<button type="submit" class="btn btn-gradient">등록</button>

<a href='<c:url value="/shop/categoryList.do"/>' 
class="btn btn-gradient">취소</a>
            </div>
        </form>

    </div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/Javascript">

  var temp=document.fm.productId  // c2 : 두번째 name값
  function redirect(x){
//alert(x);
//var arr=new Array("${productsBIRDS}", "${productsCATS}", "${productsDOGS}", "${productsFISH}", "${productsREPTILES}");
var arr=new Array("${productsBIRDS}", "${productsCATS}", "${productsDOGS}", "${productsFISH}", "${productsREPTILES}");
//alert(arr[x-1]);
var str = arr[x-1].substr(1, arr[x-1].length-2);
//alert(str);
var name=str.split(',');
 
temp.length=name.length;
 
for(i=0;i<name.length;i++) {
temp.options[i] = new Option(name[i]);
temp.options[i].value=name[i];
}
 
temp.options[0].selected=true
  }

</script>