<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div align="center">
  <p>
    <font size="4"><b>My Orders</b></font>
  </p>
  <table class="n23">
    <tr bgcolor="#CCCCCC">
      <td><b>Order ID</b></td> <td><b>Date</b></td> <td><b>Total Price</b></td>
    </tr>
    <c:forEach var="order" items="${orderList}">
      <tr bgcolor="#FFFF88">
        <td>
          <b><a href='<c:url value="/shop/viewOrder.do">
              <c:param name="orderId" value="${order.orderId}"/></c:url>'>
              <font color="black"><c:out value="${order.orderId}" /></font>
            </a></b></td>
        <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy/MM/dd" /></td>
        <td><fmt:formatNumber value="${order.totalPrice}" pattern="#,###" />원</td>
      </tr>
    </c:forEach>
  </table>
</div>

