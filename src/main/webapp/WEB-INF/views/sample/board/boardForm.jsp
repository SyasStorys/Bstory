<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>board1</title>

<style type="text/css">
	tbody > tr> td{
		padding: 2px;
		margin : 5px;
	}
	
</style>

<script type="text/javascript">

	function fnSave(){
		InfoValidationCnk();
		
		var brdSeq = $("#brd_seq").val();
		
		if(brdSeq == null || brdSeq == ''){
			boardForm.submit();
			return swal('작성 되었습니다.');
		}
		else {
			boardForm.submit();
			return swal('수정 되었습니다.');
		}
		
	}
	
	function fnDelete(){
		
		var brdSeq = $("#brd_seq").val();
		
		swal({
		  title: "삭제 하시겠습니까?",
		  text: "현재 게시물을 삭제 합니다!",
		  icon: "warning",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
		    swal("현재 게시물이 삭제 되었습니다.!", {
		      icon: "success",
		    });
		    
		    location.href="boardDelete.ino?brd_seq="+brdSeq;
		    
		  } else {
		    swal("삭제 되지 않았습니다!");
		  }
		});
	}

	function InfoValidationCnk(){
		var brdWriter = $("#brd_writer").val();
		var brdTitle = $("#brd_title").val();
		var brdMemo = $("#brd_memo").val();
		
		if(brdWriter == null || brdWriter == '' || brdWriter == undefined){
			return swal('작성자를 입력해주세요.');
		}
		if(brdTitle == null || brdTitle == '' || brdTitle == undefined){
			return swal('제목을 입력해주세요.');
		}
		if(brdMemo == null || brdMemo == '' || brdMemo == undefined){
			return swal('내용을 입력해주세요.');
		}
	}
</script>
</head>
<body>
    <form name="boardForm" action="boardSave.ino" method="post">
        <table class="table">
            <caption>자유게시판</caption>
            <colgroup>
                <col width='15%' />
                <col width='*%' />
            </colgroup>
            <tbody>
                <tr>
                    <td>작성자</td>
                    <td>
                    	<c:if test="${result.brd_writer == null}">
                    		<input type="text" id="brd_writer" name="brd_writer" style="width: 100%;" maxlength="20" value="">
                    	</c:if>
                    	<c:if test="${result.brd_writer != null}">
                    		<input type="text" id="brd_writer" name="brd_writer" style="width: 100%;" maxlength="20" readonly value="${result.brd_writer}"> 
                    	</c:if>
                    </td> 
                </tr>
                <tr>
                    <td>제목</td> 
                    <td><input type="text" id="brd_title" name="brd_title" style="width: 100%;" value="${result.brd_title}"></td> 
                </tr>
                <tr>
                    <td>내용</td> 
                    <td><textarea id="brd_memo" name="brd_memo" style="width: 100%;" escapeXml="false">${result.brd_memo}</textarea></td> 
                </tr>
                <tr>
                	<td>첨부</td>
                	<td>
                		<input type="file" id="uploadFile" name="uploadFile" accept="image/*" multiple="multiple" />
                	</td>
                </tr>
                <tr>
                	<td>미리보기</td>
                	<td>
                		<img id="preview" width="150" alt="" />
                		<a id="download" download="thumbnail.jpg" target="_blank">
                			<img id="thumbnail" src="" width="100" alt="" />
                		</a>
                	</td>
                </tr>
            </tbody>
        </table>  
        <div id="btnOption" style="float: right;">
	        <c:choose>
	        	<c:when test="${result.brd_seq == null || result.brd_seq == ''}">
	        		<a href="#" onclick="fnSave()">저장</a>	
	        	</c:when>
	        	<c:otherwise>
	        		<a href="#" onclick="history.back(-1)">뒤로가기</a>
		        	<a href="#" onclick="fnDelete()">삭제</a>
		        	<a href="#" onclick="fnSave()" >수정</a>
	        	</c:otherwise>
	        </c:choose>
	        <input type="hidden" id="brd_seq" name="brd_seq" value="${result.brd_seq}" />
        </div>  
        
    </form>

	<script type="text/javascript">
	
		var file = document.querySelector('#uploadFile');
	
		file.onchange = function () {
		    var fileList = file.files ;
	
		    // 읽기
		    var reader = new FileReader();
		    reader.readAsDataURL(fileList [0]);
	
		    //로드 한 후
		    reader.onload = function  () {
		        //로컬 이미지를 보여주기
		        document.querySelector('#preview').src = reader.result;
	
		        //썸네일 이미지 생성
		        var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
		        tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
		        tempImage.onload = function () {
		            //리사이즈를 위해 캔버스 객체 생성
		            var canvas = document.createElement('canvas');
		            var canvasContext = canvas.getContext("2d");
	
		            //캔버스 크기 설정
		            canvas.width = 100; //가로 100px
		            canvas.height = 100; //세로 100px
	
		            //이미지를 캔버스에 그리기
		            canvasContext.drawImage(this, 0, 0, 100, 100);
	
		            //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
		            var dataURI = canvas.toDataURL("image/jpeg");
	
		            //썸네일 이미지 보여주기
		            document.querySelector('#thumbnail').src = dataURI;
	
		            //썸네일 이미지를 다운로드할 수 있도록 링크 설정
		            document.querySelector('#download').href = dataURI;
		        };
		    };
		};
	
	</script>        
</body>
</html>