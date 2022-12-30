//주소 추가 api
function sample6_execDaumPostcode() {
    new daum.Postcode(
        {
            oncomplete : function(data) {
                var addr = '';
                var extraAddr = '';

                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== ''
                        && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== ''
                        && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', '
                            + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("marketer_addr4").value = extraAddr;

                } else {
                    document.getElementById("marketer_addr4").value = '';
                }
                document.getElementById('marketer_addr1').value = data.zonecode;
                document.getElementById("marketer_addr2").value = addr;
                document.getElementById("marketer_addr3").focus();
            }
        }).open();
}


// 파일첨부 시 input에 파일명 출력하는 로직(add)
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

