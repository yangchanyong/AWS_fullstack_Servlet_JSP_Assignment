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
    <main class="notice-main">
      <div class="notice-wrap">
        <table class="board">
          <thead>
            <tr>
              <td>연번</td>
              <td>제목</td>
              <td>작성일</td>
            </tr>
          </thead>
          <tbody>
            <tr>
            <c:forEach var="board" items="${boards}" varStatus="stat">
              <td>${board.bno}</td>
              <td><a href="view?bno=${board.bno}&${page.cri.fullQueryString}">${board.title}</a></td>
              <td>${board.regdate}</td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
      <div class="writing">
          <div class="paging">
           <c:if test="${page.doublePrev}">
             <div><a href="notice?pageNum=${page.startPage - 1}&${page.cri.queryString}"><<</a></div>
           </c:if>
           <c:if test="${page.prev}">
             <div><a href="notice?pageNum=${page.cri.pageNum - 1}&${page.cri.queryString}"><</a></div>
           </c:if>
           <c:forEach begin="${page.startPage}" end="${page.endPage}" var="i">
             <div><a href="notice?pageNum=${i}&${page.cri.queryString}">${i}</a></div>
           </c:forEach>
           <c:if test="${page.next}">
           <div><a href="notice?pageNum=${page.cri.pageNum + 1}&amount=${page.cri.amount}">></a></div>
           </c:if>
           <c:if test="${page.doubleNext}">
           <div><a href="notice?pageNum=${page.endPage + 1}&amount=${page.cri.amount}">>></a></div>
           </c:if>
          </div>
        <div>
          <button>
            <a href="detail">글쓰기</a>
          </button>
        </div>
      </div>
    </main>
    <footer>
   <%@ include file="../common/footer.jsp" %>
    </footer>

  </div>
</body>

</html>  