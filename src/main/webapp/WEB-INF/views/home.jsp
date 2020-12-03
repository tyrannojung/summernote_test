<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>SummerNoteExample</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <!-- 서머노트를 위해 추가해야할 부분 -->
  <script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
  <script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
  <!--  -->
  
</head>
<body>
<div class="container">
  <textarea class="summernote"></textarea>    
</div>
<script>
		$(document).ready(function() {
					var toolbar = [
							[ 'fontname', [ 'fontname' ] ],
							[ 'fontsize', [ 'fontsize' ] ],
							[
									'style',
									[ 'bold', 'italic', 'underline',
											'strikethrough', 'clear' ] ],
							[ 'color', [ 'forecolor', 'color' ] ],
							[ 'table', [ 'table' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'height', [ 'height' ] ],
							[ 'view', [ 'codeview' ] ],
							[ 'insert', [ 'picture', 'link', 'video' ] ] ];
					fontNames: [ 'Arial', 'Arial Black',
							'Comic Sans MS', 'Courier New', '맑은 고딕',
							'궁서', '굴림체', '굴림', '돋음체', '바탕체' ];
					fontSizes: [ '8', '9', '10', '11', '12', '14',
							'16', '18', '20', '22', '24', '28', '30',
							'36', '50', '72' ];

					var setting = {
						height : 300,
						minHeight : null,
						maxHeight : null,
						focus : true,
						lang : 'ko-KR',
						toolbar : toolbar,
						callbacks : { //여기 부분이 이미지를 첨부하는 부분
							onImageUpload : function(files, editor,
									welEditable) {
								for (var i = files.length - 1; i >= 0; i--) {
									uploadSummernoteImageFile(files[i],
											this);
								}
							}
						}
					};

					$('.summernote').summernote(setting);
				});
	</script>
	<script>
		/**
		 * 이미지 파일 업로드
		 */
		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
	</script>
</body>
</html>
