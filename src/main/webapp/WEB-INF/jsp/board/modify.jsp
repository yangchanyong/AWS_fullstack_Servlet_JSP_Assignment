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
    <main class="write-main">
     <form method="post">
      <div class="write-wrap">
      	<textarea id="writer" name="writer" cols="29" style="resize: none;" readonly>${member.id}</textarea>
        <textarea id="title" name="title" placeholder="제목을 입력해주세요" cols="70" style="resize: none;"></textarea> <hr>
        <textarea id="content" name="content" placeholder="내용을 입력해주세요" cols="99" rows="20" style="resize: none;"></textarea> <hr>
        <div class="btn-wrap">
          <button>수정</button>
          <button><a href="list?${cri.fullQueryString}">취소</a></button>
        </div>
       </div>
     </form>
    </main>
    <footer>
   <%@ include file="../common/footer.jsp" %>
    </footer>

  </div>
</body>

</html>  