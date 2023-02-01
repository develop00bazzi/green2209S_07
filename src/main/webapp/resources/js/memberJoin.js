// 회원가입 폼 사용 자바스크립트 유효성 검사

// keyUp 함수로 입력할때마다 유효성 검사 처리

// focus가 Out시에 ajax로 중복 검사 처리 (아이디, 닉네임)

// 정규식 확인 순서에 따라 다 지웠을때 html로 뿌린 값이 사라질 수도 있고 안 사라질 수도 있다!

'use strict';

// 아이디 및 닉네임 중복 검사를 위한 변수 설정

let midOverCheckFlag=0;
let nickNameOverCheckFlag=0;
let emailOverCheckFlag=0;

// 아이디 및 닉네임 중복 검사 전 유효성 검사를 마쳤는지 확인을 위한 변수 설정

let regMidFlag=0;
let regPwdFlag=0;
let regRePwdFlag=0;
let regNickNameFlag=0;
let regNameFlag=0;
let regTel2Flag=0;
let regTel3Flag=0;
let regEmailFlag=0;

// 입력 정보 유효성 검사를 위한 정규식

let regMid = /^[a-z0-9_]{5,20}$/;
// let regPwd = /(?=.*[a-zA-Z0-9])(?=.*?[#?!@$%^&*-]).{4,24}/;
let regPwd = /(?=.*[0-9a-zA-Z]).{4,16}$/;
let regNickName = /^[가-힣a-zA-Z0-9]{2,20}$/;
let regName = /^[가-힣a-zA-Z]+$/;
let regEmail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
// let regURL = /^(https?:\/\/)?([a-z\d\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?$/;
// let regPhoneNum = /\d{2,3}-\d{3,4}-\d{4}$/g;

let regTel1=/\d{2,3}$/g;
let regTel2=/\d{3,4}$/g;
let regTel3=/\d{4}$/g;

// keyUp 함수를 이용한 정규식 검사

$(document).ready(function() {

        // 아이디 유효성 검사

        $("#mid").keyup(function() {
            regMidCheck();
        });

        // 회원 아이디 중복 검사

        $("#mid").focusout(function() {
            midOverCheck();
        });

        // 회원 비밀번호 유효성 검사

        $("#pwd").keyup(function() {
            regPwdCheck();
        });

        // 비밀번호 재확인 유효성 검사

        $("#rePwd").keyup(function() {
            regRePwdCheck();
        });

        // 닉네임 유효성 검사

        $("#nickName").keyup(function() {
            regNickNameCheck();
        });

        // 회원 닉네임 중복 검사

        $("#nickName").focusout(function () {
            nickNameOverCheck();
        });

        // 성명 유효성 검사

        $("#name").keyup(function() {
            regNameCheck();
        });

        // 전화번호 입력 유효성 검사

        $("#tel2").keyup(function() {
            regTel2Check();
        });

        $("#tel3").keyup(function() {
            regTel3Check();
        });

        // 이메일 유효성 검사

        $("#email").keyup(function() {
            regEmailCheck();
        });

        // 이메일 중복 검사

        $("#email").focusout(function() {
            emailOverCheck();
        });

});

// 회원가입 버튼 클릭시 다시 한번 유효성 검사 및 내용에 대한 체크 후 회원가입 처리

function joinCheck() {

    let submitFlag=0; // 전송 체크 버튼으로 값이 1일때만 전송 처리

    if(regMidFlag==0) {
        regMidCheck();
    }
    else if(regPwdFlag==0) {
        regPwdCheck();
    }
    else if(regRePwdFlag==0) {
        regRePwdCheck();
    }
    else if(regNickNameFlag==0) {
        regNickNameCheck();
    }
    else if(regNameFlag==0) {
        regNameCheck();
    }
    else if(regTel2Flag==0) {
        regTel2Check();
    }
    else if(regTel3Flag==0) {
        regTel3Check();
    }
    else if(regEmailFlag==0) {
        regEmailCheck();
    }
    else {
        let tel1=joinForm.tel1.value;
        let tel2=joinForm.tel2.value;
        let tel3=joinForm.tel3.value;

        // 주소 하나의 필드로 묶음 처리

        let postcode = joinForm.postcode.value;
        let roadAddress = joinForm.roadAddress.value;
        let detailAddress = joinForm.detailAddress.value+" ";
        let extraAddress = joinForm.extraAddress.value+" ";
        joinForm.address.value =roadAddress+"/"+extraAddress+"/"+detailAddress+"/"+postcode;

        let tel=tel1.trim()+"-"+tel2.trim()+"-"+tel3.trim();
        joinForm.phoneNum.value=tel;

        submitFlag=1;

        if(submitFlag==1) {
            if (midOverCheckFlag == 0) {
                midOverCheck();
            } else if (nickNameOverCheckFlag == 0) {
                nickNameOverCheck();
            }
            else if(emailOverCheckFlag==0) {
                emailOverCheck();
            }
            else {
                joinForm.submit();
            }
        }
        else {
            alert("회원가입을 할 수 없습니다!");
        }
    }
}

// 비밀번호 보였다 안 보이게 하기

$(function(){
    // 눈표시 클릭 시 패스워드 보이기
    $('.pwdEyes').on('click',function(){
        $('.form-group.password').toggleClass('active');

        if( $('.form-group.password').hasClass('active') == true ){
            $(this).find('.fa-eye').attr('class',"fa fa-eye-slash fa-lg").parents('.form-group').find('#pwd').attr('type',"text");
            // i 클래스                // 텍스트 보이기 i 클래스
        }
        else{
            $(this).find('.fa-eye-slash').attr('class',"fa fa-eye fa-lg").parents('.form-group').find('#pwd').attr('type','password');
        }
    });
});

// 비밀번호 확인 보였다 안 보이게 하기

$(function(){
    // 눈표시 클릭 시 패스워드 보이기
    $('.rePwdEyes').on('click',function(){
        $('.form-group.password').toggleClass('active');

        if( $('.form-group.password').hasClass('active') == true ){
            $(this).find('.fa-eye').attr('class',"fa fa-eye-slash fa-lg").parents('.form-group').find('#rePwd').attr('type',"text");
            // i 클래스                // 텍스트 보이기 i 클래스
        }
        else{
            $(this).find('.fa-eye-slash').attr('class',"fa fa-eye fa-lg").parents('.form-group').find('#rePwd').attr('type','password');
        }
    });
});

// 아이디 중복 검사

function midOverCheck() {
    let mid=joinForm.mid.value;

    if(mid.trim()=="") {
        $("#midCheck").html("<font color='red'>&nbsp;아이디를 입력해주시기 바랍니다!</font>");
        joinForm.mid.focus();
        return false;
    }

    else if(regMidFlag==0) {
        $("#midCheck").html("<font color='red'>&nbsp;아이디 형식을 확인해주시기 바랍니다!</font>");
        joinForm.mid.focus();
        return false;
    }
    else {

        $.ajax({
            type:"post",
            url:"/green2209S_07/member/memberMidOverCheck",
            data:{mid:mid},
            success: function(res) {
                if(res=="1") {
                    $("#midCheck").html("<font color='red'>&nbsp;이미 사용중인 아이디입니다!</font>");
                    midOverCheckFlag=0;
                    joinForm.mid.focus();
                    return false;
                }
                else {
                    $("#midCheck").html("<font color='green'>&nbsp;사용 가능한 아이디입니다!</font>");
                    // 아이디 중복 검사 확인 변수 1로 변경
                    midOverCheckFlag=1;
                }
            },
            error: function() {
                alert("전송 오류");
            }
        });
    }
}

// 닉네임 중복 검사

function nickNameOverCheck() {
    let nickName = joinForm.nickName.value;

    if (nickName.trim() == "") {
        $("#nickNameCheck").html("<font color='red'>&nbsp;닉네임을 입력해주시기 바랍니다!</font>");
        joinForm.nickName.focus();
        return false;
    } else if (regNickNameFlag == 0) {
        $("#nickNameCheck").html("<font color='red'>&nbsp;닉네임 형식을 확인해주시기 바랍니다!</font>");
        joinForm.nickName.focus();
        return false;
    } else {

        $.ajax({
            type: "post",
            url: "/green2209S_07/member/memberNickNameOverCheck",
            data: {nickName: nickName},
            success: function (res) {
                if (res == "1") {
                    $("#nickNameCheck").html("<font color='red'>&nbsp;이미 사용중인 닉네임입니다!</font>");
                    nickNameOverCheckFlag=0;
                    joinForm.nickName.focus();
                    return false;
                } else {
                    $("#nickNameCheck").html("<font color='green'>&nbsp;사용 가능한 닉네임입니다!</font>");
                    // 닉네임 중복 검사 확인 변수 1로 변경
                    nickNameOverCheckFlag = 1;
                }
            },
            error: function () {
                alert("전송 오류");
            }
        });
    }
}

// 이메일 중복 검사

function emailOverCheck() {
    let email = joinForm.email.value;

    if (email.trim() == "") {
        $("#emailCheck").html("<font color='red'>&nbsp;이메일을 입력해주시기 바랍니다!</font>");
        joinForm.email.focus();
        return false;
    }
    else if (regEmailFlag == 0) {
        $("#emailCheck").html("<font color='red'>&nbsp;이메일 형식을 확인해주시기 바랍니다!</font>");
        joinForm.email.focus();
        return false;
    }
    else {

        $.ajax({
            type: "post",
            url: "/green2209S_07/member/memberEmailOverCheck",
            data: {email: email},
            success: function (res) {
                if (res == "1") {
                    $("#emailCheck").html("<font color='red'>&nbsp;이미 사용중인 이메일입니다!</font>");
                    emailOverCheckFlag=0;
                    joinForm.email.focus();
                    return false;
                } else {
                    $("#emailCheck").html("<font color='green'>&nbsp;사용 가능한 이메일입니다!</font>");
                    // 이메일 중복 검사 확인 변수 1로 변경
                    emailOverCheckFlag = 1;
                }
            },
            error: function () {
                alert("전송 오류");
            }
        });
    }
}

// 아이디 유효성 검사

function regMidCheck() {
    let mid=joinForm.mid.value;
    if (mid.trim().indexOf(" ")!=-1) {
        $("#midCheck").html("<font color='red'>&nbsp;아이디 (ID)에는 공백을 포함할 수 없습니다!</font>");
        joinForm.mid.focus();
        regMidFlag=0;
        return false;
    }
    else if (mid.trim()=="") {
        $("#midCheck").html("<font color='red'>&nbsp;아이디를 입력해주세요!</font>");
        joinForm.mid.focus();
        regMidFlag=0;
        return false;
    }
    else if (!regMid.test(mid)) {
        $("#midCheck").html("<font color='red'>&nbsp;5~20자의 영문 소문자, 숫자와 특수기호(_)만 사용 가능합니다.</font>");
        joinForm.mid.focus();
        regMidFlag=0;
        return false;
    }
    else {
        $("#midCheck").html("");
        regMidFlag=1;
    }
}

// 비밀번호 유효성 검사

function regPwdCheck() {
    let pwd=joinForm.pwd.value;
    if(pwd.trim().indexOf(" ")!=-1) {
        $("#pwdCheck").html("<font color='red'>&nbsp;비밀번호에는 공백 사용이 불가능합니다!</font>");
        regPwdFlag=0;
        joinForm.pwd.focus();
        return false;
    }
    else if (pwd.trim()=="") {
        $("#pwdCheck").html("<font color='red'>&nbsp;비밀번호를 입력해주시기 바랍니다!</font>");
        regPwdFlag=0;
        joinForm.pwd.focus();
        return false;
    }
    else if (!regPwd.test(pwd)) {
        $("#pwdCheck").html("<font color='red'>&nbsp;8~16자 영문 대 소문자, 숫자, 특수문자 (키보드 0~9)를 사용하세요.</font>");
        regPwdFlag=0;
        joinForm.pwd.focus();
        return false;
    }
    else {
        $("#pwdCheck").html("");
        regPwdFlag=1;
    }
}

// 비밀번호 재확인 유효성 검사

function regRePwdCheck() {
    let rePwd=joinForm.rePwd.value;
    if(rePwd.trim().indexOf(" ")!=-1) {
        $("#pwdCheck").html("<font color='red'>&nbsp;비밀번호에는 공백 사용이 불가능합니다!</font>");
        regRePwdFlag=0;
        joinForm.rePwd.focus();
        return false;
    }
    else if (rePwd.trim()=="") {
        $("#rePwdCheck").html("<font color='red'>&nbsp;비밀번호 재확인을 해주시기 바랍니다!</font>");
        regRePwdFlag=0;
        joinForm.rePwd.focus();
        return false;
    }
    else if (joinForm.pwd.value!=rePwd) {
        $("#rePwdCheck").html("<font color='red'>&nbsp;입력하신 비밀번호와 일치하지 않습니다!</font>");
        regRePwdFlag=0;
        joinForm.rePwd.focus();
        return false;
    }
    else {
        $("#rePwdCheck").html("");
        regRePwdFlag=1;
    }
}

// 닉네임 유효성 검사

function regNickNameCheck() {
    let nickName=joinForm.nickName.value;
    if(nickName.trim().indexOf(" ")!=-1) {
        $("#nickNameCheck").html("<font color='red'>&nbsp;닉네임에는 공백 사용이 불가능합니다!</font>");
        regNickNameFlag=0;
        joinForm.nickName.focus();
        return false;
    }
    else if (nickName.trim()=="") {
        $("#nickNameCheck").html("<font color='red'>&nbsp;닉네임을 입력해주시기 바랍니다!</font>");
        regNickNameFlag=0;
        joinForm.nickName.focus();
        return false;
    }
    else if (!regNickName.test(nickName)) {
        $("#nickNameCheck").html("<font color='red'>&nbsp;1~20자 영문 대소문자 및 한글, 숫자만 사용 가능합니다.</font>");
        regNickNameFlag=0;
        joinForm.nickName.focus();
        return false;
    }
    else {
        $("#nickNameCheck").html("");
        regNickNameFlag=1;
    }
}

// 성명 유효성 검사
function regNameCheck() {
    let name=joinForm.name.value;
    if(name.trim().indexOf(" ")!=-1) {
        $("#nameCheck").html("<font color='red'>&nbsp;성명은 공백 사용이 불가능합니다!</font>");
        regNameFlag=0;
        joinForm.name.focus();
        return false;
    }
    else if (name.trim()=="") {
        $("#nameCheck").html("<font color='red'>&nbsp;성명을 입력해주시기 바랍니다!</font>");
        regNameFlag=0;
        joinForm.name.focus();
        return false;
    }
    else if (!regName.test(name)) {
        $("#nameCheck").html("<font color='red'>&nbsp;한글 및 영문만 사용 가능합니다!</font>");
        regNameFlag=0;
        joinForm.name.focus();
        return false;
    }
    else {
        $("#nameCheck").html("");
        regNameFlag=1;
    }
}

// 전화번호 2 유효성 검사

function regTel2Check() {
    let tel2=joinForm.tel2.value;
    if(tel2.trim().indexOf(" ")!=-1) {
        $("#telCheck").html("<font color='red'>&nbsp;전화번호에는 공백 사용이 불가능합니다!</font>");
        regTel2Flag=0;
        joinForm.tel2.focus();
        return false;
    }
    else if (tel2.trim()=="") {
        $("#telCheck").html("<font color='red'>&nbsp;전화번호를 입력해주세요!</font>");
        regTel2Flag=0;
        joinForm.tel2.focus();
        return false;
    }
    else if (!regTel2.test(tel2)) {
        $("#telCheck").html("<font color='red'>&nbsp;전화번호 형식에 맞지 않습니다!</font>");
        regTel2Flag=0;
        joinForm.tel2.focus();
        return false;
    }
    else {
        $("#telCheck").html("");
        regTel2Flag=1;
    }
}

// 전화번호 3 유효성 검사

function regTel3Check() {
    let tel3=joinForm.tel3.value;
    if(tel3.trim().indexOf(" ")!=-1) {
        $("#telCheck").html("<font color='red'>&nbsp;전화번호에는 공백 사용이 불가능합니다!</font>");
        regTel3Flag=0;
        joinForm.tel3.focus();
        return false;
    }
    else if (tel3.trim()=="") {
        $("#telCheck").html("<font color='red'>&nbsp;전화번호를 입력해주세요!</font>");
        regTel3Flag=0;
        joinForm.tel3.focus();
        return false;
    }
    else if (!regTel3.test(tel3)) {
        $("#telCheck").html("<font color='red'>&nbsp;전화번호 형식에 맞지 않습니다!</font>");
        regTel3Flag=0;
        joinForm.tel3.focus();
        return false;
    }
    else {
        $("#telCheck").html("");
        regTel3Flag=1;
    }
}

// 이메일 유효성 검사

function regEmailCheck() {
    let email=joinForm.email.value;
    if(email.trim().indexOf(" ")!=-1) {
        $("#emailCheck").html("<font color='red'>&nbsp;이메일에는 공백 사용이 불가능합니다!</font>");
        regEmailFlag=0;
        joinForm.email.focus();
        return false;
    }
    else if (email.trim()=="") {
        $("#emailCheck").html("<font color='red'>&nbsp;이메일을 입력해주세요!</font>");
        regEmailFlag=0;
        joinForm.email.focus();
        return false;
    }
    else if (!regEmail.test(email)) {
        $("#emailCheck").html("<font color='red'>&nbsp;이메일 형식에 맞지 않습니다!</font>");
        regEmailFlag=0;
        joinForm.email.focus();
        return false;
    }
    else {
        $("#emailCheck").html("");
        regEmailFlag=1;
    }
}