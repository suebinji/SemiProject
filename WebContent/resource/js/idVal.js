function validate(){
    //아이디            4글자이상 13글자 이하
    let regExp= /^[a-z][a-z0-9]{3,12}$/i;
    if(!regExp.test(frm.mem_id.value)){
        alert("유효하지 않은 ID입니다. 영문자, 숫자 포함 총 4~12자로 입력하세요.");
        frm.mem_id.value.focus();
        return;
    } 
    //비밀번호
    regExp = /^[a-z\d!@#$%^&*]{8,15}$/i;
    if(!regExp.test(frm.mem_pw.value)){
        alert("유효하지 않은 비밀번호입니다.");
        frm.mem_pw.value.focus();
        return;
    } 
    
    //비밀번호 일치
    if(frm.mem_pw.value!= frm.mem_rpw.value){
        alert('비밀번호가 일치하지 않습니다.');
        frm.mem_rpw.value="";
        frm.mem_rpw.value.focus();
        return;
    }
    
    //이름
    regExp= /^[가-힣]{2,}$/;
    if(!regExp.test(frm.mem_name.value)){
        alert("유효하지 않은 이름입니다.");
        frm.mem_name.value.focus();
        return;
    }

    //이메일
    /*regExp = /[a-z0-9]+@[a-z]+\.[a-z]+(\.[a-z]+)?/;
    if(!regExp.test(frm.userEmail.value)){
        alert("유효하지 않은 이메일입니다.");
        frm.userEmail.value.focus();
        return false;
    }*/
    frm.submit();

}

