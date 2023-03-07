function validate(){
    //아이디            4글자이상 13글자 이하
    let regExp= /^[a-z][a-z0-9]{3,12}$/i;
    if(!regExp.test(frm.userId.value)){
        alert("유효하지 않은 ID입니다. 영문자, 숫자 포함 총 4~12자로 입력하세요.");
        frm.userId.value.focus();
        return;
    } 
    //비밀번호
    regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
    if(!regExp.test(frm.userPw.value)){
        alert("유효하지 않은 비밀번호입니다.");
        frm.userPw.value.focus();
        return;
    } 
    
    //비밀번호 일치
    if(frm.userPw.value!= frm.checkPw.value){
        alert('비밀번호가 일치하지 않습니다.');
        frm.checkPw.value="";
        frm.checkPw.value.focus();
        return;
    }
    
    //이름
    regExp= /^[가-힣]{2,}$/;
    if(!regExp.test(frm.userName.value)){
        alert("유효하지 않은 이름입니다.");
        frm.userName.value.focus();
        return;
    }

    //이메일
    regExp = /[a-z0-9]+@[a-z]+\.[a-z]+(\.[a-z]+)?/;
    if(!regExp.test(frm.userEmail.value)){
        alert("유효하지 않은 이메일입니다.");
        frm.userEmail.value.focus();
        return false;
    }
    frm.submit();

}

