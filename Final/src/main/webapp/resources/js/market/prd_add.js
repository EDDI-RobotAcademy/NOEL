

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

