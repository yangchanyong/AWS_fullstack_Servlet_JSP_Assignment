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
    <main class="detail-main">
      <div class="detail-wrap">
        <p>${board.title}</p> <hr>
        <p>${board.content}</p> <hr>
      </div>
      <div class="btn-wrap">
        <button><a href="modify?bno=${board.bno}&${cri.fullQueryString}">수정</a></button>
        <button><a href="remove?bno=${board.bno}&${cri.fullQueryString}">삭제</a></button>
        <button><a href="free?${cri.fullQueryString}">목록</a></button>
      </div>
      <div class="replies" id="replyArea">
        <p>댓글</p>
        <div>
          <textarea id="commentArea" placeholder="댓글을 입력하세요"></textarea>
          <button>댓글 작성</button>
        </div>
        <ul class="replies">
          <li>
            <div>
              <p>댓글이 없습니다</p>
            </div>
          </li>
        </ul>
      </div>
    </main>
    <footer>
   <%@ include file="../common/footer.jsp" %>
    </footer>

  </div>
  <script>
 	$(".btn-remove").click(function() {
 		return confirm("정말 삭제 하시겠습니까?");
 	});
	let contextPath = '${pageContext.request.contextPath}';
	let replyPath = contextPath + "/reply"
	let bno = '${board.bno}';
	// 댓글작성과 이어짐
	let writer = '${member.id}';
	
	// ajax를 function으로 묶어줘야 새로고침을 안함
	showList();
	function showList() {
		$.ajax({
			url : replyPath,
			data : {bno:bno},
			success : list
		});
	}
	
	// 댓글 목록
	function list(replies) {
      // console.log(replies);
      let str = "";
      
      if(!replies.length) {
    	str = `<li>
            <div>
            <p>댓글이 없습니다</p>
          </div>
        </li>`;
        $(".replies").html(str);
        return;
      }
      
      
      for(let i in replies) {
        let r = replies[i];
        console.log(r.rno, r.content, r.regDate, r.writer, r.bno);
        
        let isMine = writer === r.writer
        str += `
        <li data-rno="\${r.rno}">
          <div>
            <ahref="">
              <span>\${r.writer}</span>
              <span>\${r.regDate}</span>
              </a>
              <div>`;
          str += isMine ? '<a href=""></a>' : ''
          str += `</div>
              </div>
              <div>
                <p>\${r.content}</p>
                </div>
                </li>
        `;
      }
      // json 분석 (db에 저장된 댓글 출력)
      $(".replies").html(str);
    }

	// 댓글 작성
    $("#commentArea").next().click(function() {
      //console.log($("#commentArea").val()); //session 체크가 필요함
      let content = $("#commentArea").val();
      if(!writer) {
    	  alert("로그인 후 작성하세요");
    	  location.href = contextPath + "/member/login?href=" + encodeURIComponent(location.pathname + location.search + '#replyArea');
    	  return;
      }
      else if(!content) {
    	  alert("댓글 내용을 입력하세요");
    	  return;
      }
      // 비동기처리
      // console.log({bno:bno, content:content, writer:writer}); // 객체 확인용
      $.ajax ({
    	url : replyPath,
    	data : {bno:bno, content:content, writer:writer},
    	method : "POST",
    	success : function(data) {
    		alert("댓글이 성공적으로 작성되었습니다");
    		$("#commentArea").val("");
    		showList();
    	}
      })
    })


    // 댓글 삭제
    $(".replies").on("click", "li a.text-danger", function() {
      event.preventDefault();
      if(!confirm("댓글을 삭제하시겠습니까?")) {
    	  return false;
      }
      console.log($(this).closest("li").data("rno"));
      let rno = $(this).closest("li").data("rno");
      $.ajax ({
      	url : replyPath + "?rno=" + rno,
      	data : {rno:rno},
      	method : "DELETE",
      	success : function(data) {
      		// console.log(data)
      		if(data == 1) {
      			alert("댓글이 성공적으로 삭제되었습니다");
      			showList();
      		}
      	}
      })
    })
    
 </script>
</body>

</html>  