<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <%@ include file="common/head.jsp" %>
</head>
<body>
  <div class="wrap">
    <header id="header">
	<%@ include file="common/header.jsp" %>
	</header>
    <main class="index-main">
      <div class="slider-wrap">
        <div class="slider">
          <img src="${pageContext.request.contextPath}/img/slider/dreamer.png">
          <img src="${pageContext.request.contextPath}/img/slider/immortal.png">
          <img src="${pageContext.request.contextPath}/img/slider/purge.png">
        </div>
        <h3>신규 멕모드 추천!</h3>
        <p>신규 멕모드 3종 출시</p>
      </div>
      <aside>
      <%if(session.getAttribute("member") == null) { %>
        <a href="member/sighin"><div>로그인</div></a>
        <a href="member/contract">회원가입</a>
        <a href="">ID/PW찾기</a>
     <%}else { %>
        <a><div class="sighin-menu">${member.name}님 안녕</div></a>
        <a href="member/mypage">마이페이지</a>
        <a href="member/sighout">로그아웃</a>
     <% } %>
      </aside>
     
      <div class="card-wrap">
        <h2>사용 후기</h2>
        <div class="card">
          <a href="">
           <div>
               <img src="${pageContext.request.contextPath}/img/bmi.jpg">
             </div>
              <div>
               <h3>BMI 250w 후기</h3>
               <h4>터치 되는거 빼곤 영 별로인 BMI 후기</h4>
            </div>
         </a>
        </div>
        <div class="card">
          <a href="">
           <div>
               <img src="${pageContext.request.contextPath}/img/goon.jpg">
             </div>
              <div>
                <h3>GOON25 RDA 후기</h3>
                <h4>25mm 폐호흡 무화기 528custom 군25 리뷰</h4>
            </div>
         </a>
        </div>
        <div class="card">
          <a href="">
           <div>
               <img src="${pageContext.request.contextPath}/img/dot aid.jpg">
             </div>
              <div>
                <h3>dot aid 후기</h3>
                <h4>닷은 이쁜 쓰레기인가</h4>
            </div>
         </a>
        </div>
        <div class="card">
          <a href="">
           <div>
               <img src="${pageContext.request.contextPath}/img/pandora.jpg">
             </div>
              <div>
                <h3>pandora mtl rta 후기</h3>
                <h4>천상의 맛 지옥의 빌드 판도라 rta!</h4>
            </div>
         </a>
        </div>
      </div>  
      <div class="photo-wrap">
        <h2>Vape Tricks</h2>
        <div class="photo">
          <div>
            <img src="${pageContext.request.contextPath}/img/vape tricks/vain.png">
            <a>bane</a>
          </div>
        </div>
        <div class="photo">
          <a href=""></a>
          <div>
            <img src="${pageContext.request.contextPath}/img/vape tricks/1.jpg">
            <a>oring</a>
          </div>
        </div>
        <div class="photo">
          <a href=""></a>
          <div>
            <img src="${pageContext.request.contextPath}/img/vape tricks/제목 없음.png">
            <a>oring</a>
          </div>
        </div>
      </div>
    </main>

    <footer>
   <%@ include file="common/footer.jsp" %>
    </footer>

  </div>
</body>

</html>  