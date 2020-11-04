<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="replytable">
	<c:forEach items="${lists}" var="dto">
		<div>
			<c:catch>
	  			<c:forEach begin="1" end="${dto.depth}">
		  			<div class="replyEmpty">
		  				<span>>>></span>
		  			</div>
	  			</c:forEach>
	  		</c:catch>
	  		<div class="replyContents">
		  		<div>
					<div class="replyId"><h3>${dto.id}</h3></div> <div class="replyDate"><h3>${dto.regDate}</h3></div>
					<div>
						<span>${dto.contents}</span>
					</div>
				</div>
				<div>
					<div title="${dto.num}" class="del">삭제</div>
					<div title="${dto.num}" class="reply">답글</div>
				</div>
				<div id="reply${dto.num}"></div>
			</div>
		</div>
	</c:forEach>
</div>
<c:if test="${pager.startNum gt 1}">
  	<span class="c1" title="${pager.startNum-1}">[이전]</span>
</c:if>

<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
  	<span class="c1" title="${i}">${i}</span>
</c:forEach>
  	
<c:if test="${pager.nextCheck}">
  	<span class="c1" title="${pager.lastNum+1}">[다음]</span>
</c:if>
