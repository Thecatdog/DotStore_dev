<title>경매 상품 상세 보기</title>
<script>
    var ddaytimer = setInterval (dayGap, 1000)
    function dayGap () {
        var dday = new Date("June 20, 2018 00:00:00");//디데이
        var ddayChange = dday.getTime();
        var nowday = new Date();//현재
        nowday = nowday.getTime();//밀리세컨드 단위변환
        var distance = ddayChange - nowday;//디데이에서 현재까지 뺀다.
        
        var d = Math.floor(distance / (1000 * 60 * 60 * 24));//일
        
        var h = Math.floor((distance / (1000*60*60)) % 24);//시간
        var m = Math.floor((distance / (1000*60)) % 60);//분
        var s = Math.floor((distance / 1000) % 60);//초
        
        if (distance <= 0) {//당일넘어섰을때, dday로 변경
            document.getElementById("dday-timer").innerHTML = "D-day";
        } else {
            document.getElementById("target-day").innerHTML = dday;
            document.getElementById("time-day").innerHTML = d;
            document.getElementById("time-hour").innerHTML = h;
            document.getElementById("time-minute").innerHTML = m;
            document.getElementById("time-second").innerHTML = s;
        }
    }
</script>

<body id="">
    <div id="">
        <table border="1">
            <tr>
                <td>상품 이름</td>
                <td>라이언 마우스</td>
            </tr>
            <tr>
                <td>상품 설명</td>
                <td>라이언이 그려져 있는 무선 마우스에요. 넘 귀여워요.</td>
            </tr>
            <tr>
                <td>남은 시간</td>
                <td>
                    <div class="counter">
                        <span id="target-day"></span><span class="text_target">까지</span><br>
                        <span id="dday-timer" class="num"></span>
                        <span id="time-day" class="num"></span>
                        <span class="txt">일</span>
                        <span id="time-hour" class="num"></span>
                        <span class="txt">시간</span>
                        <span id="time-minute" class="num"></span>
                        <span class="txt">분</span>
                        <span id="time-second" class="num"></span>
                        <span class="txt">초</span>
                    </div>
                </td>
            </tr>
            <tr>
                <td>현재 가격</td>
                <td>15,000 원</td>
            </tr>
        </table>

        <!-- 경매 등록한 사람(판매자)에게만 보여짐 -->
        <div class="">
            <button type="button">경매 수정</button>
            <button type="button">경매 삭제</button> <br>
        </div>
        <!-- 경매 등록한 사람(판매자)에게만 보여짐 (여기까지) -->
        
        <a href="">목록보기</a>

        <hr>
        <!-- 구매자에게만 보여짐 -->
        <div class="">
            <p>경매에 참가하세요</p>
            
            <form method="post" name="" action="">
                <label for="">입찰 금액</label><br>
                <input id="" type="number" class="" name=""><br>

                <button type="submit">입찰</button>
            </form>
        </div>
        <!-- 구매자에게만 보여짐 (여기까지) -->

        <hr>

        <!-- 최고 입찰자에게만 보여지는 부분 -->
        <div class="">
            <p>김나영 님이 현재 최고 입찰자입니다.<br>
            입찰 취소 버튼을 누르면 입찰이 취소됩니다.<br>
            입찰을 취소하시겠습니까?</p>
                
            <button type="button">입찰 취소</button>
        </div>
        <!-- 최고 입찰자에게만 보여지는 부분 (여기까지) -->

        <hr>

        <!-- 경매 마감 시 -->
        <div class="">
            <p>김나영 님이 현재 최고 입찰자입니다.</p>
            <p>상품을 구매하려면 Add to Cart를, 경매를 취소하려면 경매 취소 버튼을 눌러주세요.</p>
            
            <button type="button">Add to Cart</button>
            <button type="button">경매 취소</button>
        </div>
        <!-- 경매 마감 시 (여기까지) -->
    </div>
</body>