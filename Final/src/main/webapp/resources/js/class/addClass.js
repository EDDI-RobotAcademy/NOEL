// 영업시간 타임피커 API
$(document).ready(function () {
  $('input.timepicker').timepicker({});
});

$('.time').timepicker({
  timeFormat: 'HH:mm',
  interval: 60,
  startTime: '24:00',
  dynamic: false,
  dropdown: true,
  scrollbar: true
});

// 파일첨부 시 input에 파일명 출력하는 로직
(function ($) {
  'use strict';
  $(function () {
    $('.file-upload-browse').on('click', function () {
      var file = $(this).parent().parent().parent().find('.file-upload-default');
      file.trigger('click');
    });
    $('.file-upload-default').on('change', function () {
      // $(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
      const list = this.files;
      let fileList = "";
      for (let i = 0; i < list.length; i++) {
        fileList += list[i].name + '     ';
      }
      $(this).parent().find('.form-control').val(fileList);
    });
  });
})(jQuery);

// 주소 API .기준으로 주소 자르는 로직
function addrSlice() {
  const addr = $("#inputAddress1").val();
  const splitWord = addr.split("*");
  $("#inputAddress1").val(splitWord[0]);
  $("#inputAddress2").val(splitWord[1]);
  $("#detailAddress").val(splitWord[2]);
}
addrSlice();

function searchPost() {
  new daum.Postcode({
    oncomplete: function (data) {
      $("#inputAddress1").val(data.zonecode);
      $("#inputAddress2").val(data.roadAddress);
      $("#detailAddress").focus();
    }
  }).open();
}

// 업체번호 유효성검사 로직
$("#inputPhone").on("change", function (event) {
  const phoneValue = $(this).val();
  const phoneComment = $(this).next();
  const phoneReg = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;

  //공백확인
  if (phoneValue == "") {
    phoneComment.text("");
    phoneChkResult = false;
    event.preventDefault();
  } else {
    // 유효성 검사
    if (phoneReg.test(phoneValue)) {
      phoneComment.text("사용가능합니다.");
      phoneComment.css("color", "blue");
      phoneChkResult = true;
    } else {
      phoneComment.text("전화번호 형식을 맞춰주세요.");
      phoneComment.css("color", "red");
      phoneChkResult = false;
      event.preventDefault();
    }
  }
});

// 영업 시간 입력 유/무 체크
$(":submit").on("click", function (event) {
  const openHourValue = $(".time").val();
  if (openHourValue == "") {
    alert("영업 시간을 입력해주세요. ");
    event.preventDefault();
  }
});
