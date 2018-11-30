<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board1</title>
<style type="text/css">
	#pagingContainer {
		text-align: right;
	}
	#listTitle {
		max-width: 100px; 
		overflow: hidden; 
		white-space: nowrap; 
		text-overflow: ellipsis;
	}
	
	#listWriter {
		max-width: 100px; 
		overflow: hidden; 
		white-space: nowrap; 
		text-overflow: ellipsis;
	}
	.boardContainer {
		display: block;
		width : 100%;
	}
	
	.boardContainer > table {
		width : 100%;
	}
</style>

<script type="text/javascript">

	function fn_formSubmit(){
		fnCheckValidation();
		document.SearchForm.submit();	
	}
	
	function fnCheckValidation(){
		
		var check1 = $("#searchType1").is(":checked");
		var check2 = $("#searchType2").is(":checked");
		
		if(check1 == false && check2 == false){
			return swal('체크박스를 선택해서 다시 검색 해주세요.');
		}
	}

</script>

</head>
<body>

<div class="boardContainer">
	<a href="boardFormWrite.ino">글쓰기</a>
	<br /><br />
	                    
	<table class="table table-hover">
	    <caption>자유게시판</caption>
	    <colgroup>
	        <col width='8%' />
	        <col width='*%' />
	        <col width='15%' />
	        <col width='15%' />
	        <col width='8%' />
	    </colgroup>
	    <thead class="table-secondary">
	        <tr>
		        <th scope="col">번호</th> 
		        <th scope="col">제목</th>
		        <th scope="col">등록자</th>
		        <th scope="col">등록일</th>
		        <th scope="col">조회수</th>
	        </tr>
	    </thead>
	    <tbody>
	        <c:forEach var="listview" items="${listview}" varStatus="status">    
	            <c:url var="link" value="boardRead.ino">
	                <c:param name="brd_seq" value="${listview.brd_seq}" />
	            </c:url>        
	            <tr>
	                <%-- <td><c:out value="${listview.brd_seq}"/></td> --%>
	                <td scope="row">
	                	${searchVO.totRow-((searchVO.page-1)*searchVO.displayRowCount + status.index) }
	                </td>
	                <td id="listTitle"><a href="${link}"><c:out value="${listview.brd_title}"/></a></td>
	                <td id="listWriter"><c:out value="${listview.brd_writer}"/></td>
	                <td><c:out value="${listview.req_date}"/></td>
	                <td scope="row"><c:out value="${listview.brd_hit}"/></td>
	           </tr>
	        </c:forEach>
	    </tbody>
	    
	</table>
	
	<div id="pagingContainer">
		<form id="SearchForm" name="SearchForm" method="post">
			<jsp:include page="/WEB-INF/views/common/pagingforSubmit.jsp" />
			
			<div>
				<%-- <select>
					<option name="searchType" value="brd_title" <c:if test="${fn:indexOf(searchVO.searchType, 'brd_title')!=-1}"></c:if>>제목</option>
					<option name="searchType" value="brd_memo" <c:if test="${fn:indexOf(searchVO.searchType, 'brd_memo')!=-1}"></c:if>>내용</option>
				</select> --%>
				<input type="checkbox" id="searchType1" name="searchType" value="brd_title" <c:if test="${fn:indexOf(searchVO.searchType, 'brd_title')!=-1}">checked="checked"</c:if>/>
				<label class="chkselect" for="searchType1">제목</label>
				<input type="checkbox" id="searchType2" name="searchType" value="brd_memo" <c:if test="${fn:indexOf(searchVO.searchType, 'brd_memo')!=-1}">checked="checked"</c:if>/>
				<label class="chkselect" for="searchType2">내용</label>
				<input type="text" name="searchKeyword" style="width:150px;" maxlength="50" value='<c:out value="${searchVO.searchKeyword}"/>' onkeydown="if(event.keyCode == 13) { fn_formSubmit();}">
				<input name="btn_search" value="검색" class="btn_sch" type="button" onclick="fn_formSubmit()" />
			</div>
		</form>
	</div>
	    

</div>

</body>
</html>