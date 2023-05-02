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
        <main id="sighinMain">
      <div class="sighin-wrap">
        <form id="sighin" name="frm" method="post">
          <label for="id">ID</label><br>
          <input id="id" name="id" placeholder="아이디를 입력하세요"><br>
          <label for="pw">PASSWORD</label><br>
          <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력하세요"><br>
          <label><input type="checkbox" name="chk" value="remember-me">아이디 저장</label><br> 
          <output name="result"></output>
          <input type="submit" value="로그인">
        </form>
      </div>
    </main>
    <footer>
   <%@ include file="../common/footer.jsp" %>
    </footer>

  </div>
</body>

</html>  