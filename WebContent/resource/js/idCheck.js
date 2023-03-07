function validate() {
    let userPw = document.getElementById("mem_pw").value;
    let checkPw = document.getElementById("checkPw").value;
    let userId = document.getElementById("mem_id").value;
    // id정규표현식
    // 숫자나 영문자로 표현 글자수는 5~10글자
    const regExp = /^[a-z0-9]{5,10}$/i;
    if(!regExp.test(userId) || (userPw != checkPw)){ // false일 경우에만 알림창 띄워주기
        alert("유효하지 않은 ID이거나 비밀번호가 같지 않습니다");
        return false;
    }
}