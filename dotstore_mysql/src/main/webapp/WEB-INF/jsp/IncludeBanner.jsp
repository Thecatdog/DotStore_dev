<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 이거 쓰지말고 타일즈에 있는 Banner.jsp로 쓸것 -->

<br>
<c:if test="${userSession.account.bannerOption}">
  <table class="top">
    <tr>
      <td align="center"><c:out value="${userSession.account.bannerName}" escapeXml="false" /> &nbsp;</td>
    </tr>
  </table>
</c:if>
