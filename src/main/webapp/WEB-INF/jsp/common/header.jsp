<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
      <div class="top">
        <h1><a href="${pageContext.request.contextPath}/">OringVape</a></h1>
      </div>
    <div class="nav-wrap">
      <nav>
        <ul class="clearfix gnb">
          <li><a href="${pageContext.request.contextPath}/">홈</a></li>
          <li><a href="${pageContext.request.contextPath}/board/notice">게시판</a>
          <ul class="gnb-dropdown">
            <li><a href="${pageContext.request.contextPath}/board/notice">공지사항</a></li>
            <li><a href="${pageContext.request.contextPath}/board/free">자유게시판</a></li>
          </ul>
        </li>
        </ul>
      </nav>
    </div>
