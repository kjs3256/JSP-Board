<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 스타일시트 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<title>회원 탈퇴</title>
</head>
<script>
	function checkIt(){
		if(!document.myForm.pass.value){
			alert("비밀번호를 입력하지 않았습니다.");
			document.myForm.pass.focus();
			return false;
		}
	}
</script>
<body>
<div class="container">
	<div class="jumbotron" style="margin:100px; margin-left:200px; margin-right:200px;">
		<form name="myForm" method="post" action="deleteUserAction.jsp"
		onsubmit="return checkIt()">
			<table class="table">
				<tr><th colspan="2" class="text-center"><h2>회원 탈퇴(탈퇴 시 게시글도 모두 삭제됩니다.)</h2></th></tr>
				<tr><td>비밀번호</td>
					<td><input type="password" name="pass" class="form-control col-sm-5"></td>
				</tr>
			</table>
			<div class="text-center">
				<input type="submit" class="btn btn-danger" value="회원탈퇴">
				<input type="button" class="btn btn-primary" value="취소"
						onClick="javascript:window.location='main.jsp'">
			</div>
		</form>
	</div>
</div>
<!-- 애니메이션 담당 JQuery -->
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<!-- 부트스트랩 JS -->
<script src="js/bootstrap.js"></script>
<!-- JS -->
<script src="js/script.js"></script>
</body>
</html>