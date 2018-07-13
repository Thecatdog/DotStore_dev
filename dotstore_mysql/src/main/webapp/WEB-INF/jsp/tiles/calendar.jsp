
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link type="text/css" rel="stylesheet" href="/dotstore_mysql/style/calendar.css?ver=8"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
<!-- calendar를 위한 라이브러리들 지우면 안됨 -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src='https://fullcalendar.io/releases/fullcalendar/3.9.0/lib/moment.min.js'></script>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css'rel='stylesheet'/>
<link href='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.print.css' rel='stylesheet' media='print'/>
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.js'></script>
<!-- calendar를 위한 라이브러리들 지우면 안됨 -->
<div class="container calendar-container">
	<div id="calendar" style="max-width:900px; margin:40px auto;"></div>
</div>


<script type="text/javascript">
$(document).ready(function(){
	
	//??? 모르겟는게 이미 출석체크를 햇으면 버튼비활성화 시키기는것

	  $('#calendar').fullCalendar({
	    header: {
	      right: 'custom2 prevYear,prev,next,nextYear'
	    },
	    customButtons: {
            <c:if test="${isCheck}">
	        custom2: {
	          text: '출석체크하기',
	          id: 'check',
	          click: function() {	         	            
	            var userId = $('#userId').html();
	            var data = {
	            		userId: userId,
	            		point: sessionStorage.getItem('point')
	            }
	            
	        	$.ajax({
	                url: "/dotstore_mysql/daily/check.do",
	                type: "POST",
	                data : JSON.stringify(data),
	                contentType: "application/json",
	                dataType: "JSON",
	                success: function (pointAndDate) {
	                	$(".fc-custom2-button").prop('disabled', true);
	                	$(".fc-custom2-button").html('출석완료');
	                	
	                	sessionStorage.removeItem('point');
    	            	sessionStorage.setItem('point', pointAndDate.point); // 가져왔으면 sessionstroage에 넣기
    	            	$('#pointVal').html(pointAndDate.point + "P");
	                	
	                	 var dateStr = moment(pointAndDate.date);
	                	 $('#calendar').fullCalendar('renderEvent', {
	                        title: '출석',
	                        start: dateStr,
	                        allDay: true,
	                        color: 'purple',   
	        			 	textColor: 'white'
	                      });  
  
	                },
	                error : function(e1, e2){
	                    console.log("error!");
	                }
	            }); // ajax 끝 
	            
	          }
	        }
            </c:if>
	    },
	    eventSources: [
	    	{
				url: '/dotstore_mysql/daily.do',
				type: 'POST',
				dataType: "JSON",
				success: function (data) {

                },
				error: function() {
					alert('there was an error while fetching events!');
				},
				color: 'purple',   
			 	textColor: 'white' 
	    	}
	    ]
	  });
	
	   // 색칠하기
	   
});
</script>
