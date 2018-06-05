<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table id="main-menu">
  <tr>
    <td><a href='<c:url value="/shop/${type}/viewCategory.do">
        <c:param name="categoryId" value="${product.categoryId}"/></c:url>'>
        <b><font color="black" size="2">
          &lt;&lt; ${product.name}</font></b></a>
    </td>
  </tr>
</table>

<div align="center">
  <b><font size="4">${product.name}</font></b>
  <table class="n23">
    <tr bgcolor="#CCCCCC">
      <td><b>Item ID</b></td>
      <td><b>Product ID</b></td>
      <td><b>Description</b></td>
      <td><b>List Price</b></td>
      <td>&nbsp;</td>
    </tr>
    <c:forEach var="item" items="${itemList}">
      <tr bgcolor="#FFFF88">
        <td><b> 
          <a href='<c:url value="/shop/viewItem.do">
            <c:param name="itemId" value="${item.itemId}"/></c:url>'>
              ${item.itemId}
          </a></b></td>
        <td>${item.productId}</td>
        <td>${item.description}</td>
        <td>${item.listprice}</td>
        <td>
          <a href='<c:url value="/shop/addItemToCart.do">
            <c:param name="workingItemId" value="${item.itemId}"/></c:url>'>
              <img border="0" src="../images/button_add_to_cart.gif" alt="" />
          </a></td>
      </tr>
    </c:forEach>
    <tr>
      <td>

      </td>
    </tr>
  </table>
</div>