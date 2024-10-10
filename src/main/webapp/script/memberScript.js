function inputCheck() {
	//alert("test");
	var frm = document.form1;

	if (!frm.name.value.trim()) {
		alert("이름을 입력하세요");
		frm.name.focus();
		return false;
	}
	if (!frm.id.value) {
		alert("아이디를 입력하세요");
		frm.id.focus();
		return false;
	}
	if (!frm.pwd.value) {
		alert("비밀번호를 입력하세요");
		frm.pwd.focus();
		return false;
	}
	if (!frm.repwd.value) {
		alert("재확인을 입력하세요");
		frm.repwd.focus();
		return false;
	}
	if (frm.pwd.value != frm.repwd.value) {
		alert("비밀번호가 틀림니다.");
		frm.repwd.value = "";
		frm.repwd.focus();
		return false;
	}

	frm.submit();
}

function login() {
	var frm = document.form1;

	if (!frm.id.value) {
		alert("아이디를 입력해주세요");
		frm.name.value = "";
		frm.name.foucs();
		return false;
	}
	if (!frm.pwd.value) {
		alert("비밀번호를 입력해주세요");
		frm.pwd.value = "";
		frm.pwd.foucs();
		return false;
	}
	frm.submit();
}

function checkId() {
	var sId = document.form1.id.value;
	if(sId == "") {
		alert("먼저 아이디를 입력하세요.");
		document.form1.id.focus();
	} else {
		window.open("checkId.jsp?id="+sId, "", "width=350 height=100")
	}
}
function checkModify(){
	var frm = document.form1;
	
	
		if (!frm.pwd.value) {
			alert("비밀번호를 입력하세요");
			frm.pwd.value = "";
			frm.pwd.focus();
			return false;
		}
		if (!frm.repwd.value) {
			alert("재확인 비밀번호를 입력하세요");
			frm.repwd.focus();
			return false;
		}
		if (frm.pwd.value != frm.repwd.value) {
			alert("비밀번호가 틀림니다. 다시 입력해주세요.");
			frm.repwd.value = "";
			frm.repwd.focus();
			return false;
		}
		if (!frm.gender[0].checked && !frm.gender[1].checked){
			alert("성별을 선택해 주세요.")
			return false;
		}
		if (!frm.email1.value) {
			alert("이메일을 입력하세요");
			frm.email1.value = "";
			frm.email1.focus();
			return false;
		}
		if (!frm.email2.value) {
			alert("이메일을 입력하세요");
			frm.email2.value = "";
			frm.email2.focus();
			return false;
		}
		if (!frm.tel1.value) {
			alert("전화번호를 입력하세요");
			frm.tel1.value = "";
			frm.tel1.focus();
			return false;
		}
		if (!frm.tel2.value) {
			alert("전화번호를 입력하세요");
			frm.tel2.value = "";
			frm.tel2.focus();
			return false;
		}
		
		frm.submit();
	}







