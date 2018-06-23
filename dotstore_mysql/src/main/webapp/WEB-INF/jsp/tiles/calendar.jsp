
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<!-- calendar를 위한 라이브러리들 지우면 안됨 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
<!-- calendar를 위한 라이브러리들 지우면 안됨 -->

<div id="calendar" style="max-width:900px; margin:40px auto;"></div>

<script type="text/javascript">
$(document).ready(function(){
	var userId = $('#userId').html();
	console.log(userId);
	var dataList;
	$.ajax({
        url: "/dotstore_mysql/daily.do",
        type: "POST",
        data : {userId: userId},
        dataType: "JSON",
        success: function (dataList) {
        	console.log("성공?!" + dataList);        	
        },
        error : function(e1, e2){
            console.log("error!");
        }
    });
	
	$(function() {
	  $('#calendar').fullCalendar({
	    header: {
	      right: 'custom2 prevYear,prev,next,nextYear'
	    }
	  });
	});
});
</script>
