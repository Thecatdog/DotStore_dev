<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/auctionForm.css?ver=3"/>

<div align="center" class="auctionForm-container container">
<p>Auction Product FORM</p>
	<form method="POST" name="fm" action="<c:url value="/shop/auctionForm.do"/>"> 
		<table>
			<thead>
				<tr>
					<td><label for="categoryId">Category</label></td>
					<td>
						<select name="categoryId" id="categoryId" onChange="redirect(this.options.selectedIndex)">
						<option value="">---선택하세요---</option>
						<c:forEach var="cate" items="${categories}">
						<option value="${cate}">${cate}</option>
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td><label for="productId">Product</label></td>
					<td>
						<select name="productId" id="productId">
						<option value="">---카테고리를 먼저 선택해주세요---</option>
						</select>
					</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label for="itemId">상품 이름</label></td>
					<td><input id="itemId" type="text" class="form-control" name="itemId" required /></td>
				</tr>
				<tr>
					<td><label for="listprice">경매 가격</label></td>
					<td><input id="listprice" type="number"  class="form-control" name="listprice" required /></td>
				</tr>
				<tr>
					<td><label for="unitcost">단일 비용</label></td>
					<td><input id="unitcost" type="number" name="unitcost" class="form-control"/></td>
				</tr>
				<tr>
					<td><label for="companySupplier">공급자(회사/회원 아이디)</label></td>
					<td>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" name="companySupplier" value="member" checked="checked" class="custom-control-input"/> 회원
						</div>
						<div class="custom-control custom-radio custom-control-inline">
		            		<input type="radio" name="companySupplier" value="company" class="custom-control-input"/> 회사
		            	</div>
					</td>
				</tr>
				<tr>
					<td><label for="status">status</label></td>
					<td><input type="text" name="status" class="form-control" /></td>
				</tr>
				<tr>
					<td><label for="attr1">attr1</label></td>
					<td><input type="text" name="attr1" class="form-control" /></td>
				</tr>
				<tr>
					<td><label for="attr2">attr2</label></td>
					<td><input type="text" name="attr2" class="form-control"/></td>
				</tr>
				<tr>
					<td><label for="attr3">attr3</label></td>
					<td><input type="text" name="attr3" class="form-control" /></td>
				</tr>
				<tr>
					<td><label for="attr4">attr4</label></td>
					<td><input type="text" name="attr4" class="form-control" /></td>
				</tr>
				<tr>
					<td><label for="attr5">attr5</label></td>
					<td><input type="text" name="attr5" class="form-control"/></td>
				</tr>
				<tr>
					<td><label for="dueTime">마감 시간</label></td>
					<td><input type="date" name="dueTime" required /></td>
				</tr>
				<tr>
					<td><label for="description">상품 설명</label></td>
					<td><textarea rows="" cols="" name="description" class="form-control" required ></textarea></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"><button type="submit" class="btn btn-gradient">등록</button>
					<a href='<c:url value="/shop/categoryList.do"/>' class="btn btn-gradient">취소</a></td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

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