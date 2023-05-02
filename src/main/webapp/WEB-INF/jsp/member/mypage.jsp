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
        <form id="sighin" name="frm" action="../yang/index.html">
          <label for="id">ID</label><br>
          <textarea id="id" readonly>${member.id}</textarea><br>
          <label for="name">이름</label><br>
          <textarea id="name" readonly>${member.name}</textarea><br>
          <label for="regDate">가입일자</label><br>
          <textarea id="regdate" readonly>${member.regdate}</textarea><br>
          <button><a href="modify">회원정보 수정</a></button>
        </form>
      </div>
    </main>
    <footer>
   <%@ include file="../common/footer.jsp" %>
    </footer>

  </div>
</body>

</html>  