<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
<head>
 <%@ include file="../common/head.jsp" %>
</head>
<body>
  <div class="wrap">
    <header id="header">
		<%@ include file="../common/header.jsp" %>
	</header>
    <main class="sighin-main">
      <div class="sign-up">
        <form id="sighin" name="frm" method="post">
          <label for="id">ID</label><br>
          <input id="id" name="id" placeholder="아이디를 입력하세요"><br>
          <label for="pw">PASSWORD</label><br>
          <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요"><br>
          <label for="pw">PASSPWORD 확인</label><br>
          <input type="password" id="pwchk" name="pwchk" placeholder="PASSWORD를 한번 더 입력하세요"><br>
          <label for="name">이름</label><br>
          <input type="name" id="name" name="name" placeholder="이름을 입력하세요"><br>
          <input type="submit" value="가입하기">
        </form>
      </div>
    </main>
    <footer>
   <%@ include file="../common/footer.jsp" %>
    </footer>

  </div>
</body>

</html>  