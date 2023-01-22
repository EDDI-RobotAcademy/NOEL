
function chk_form() {
    document.getElementById('updateForm').submit();
}



// 파일첨부 시 input에 파일명 출력하는 로직
(function ($) {
    'use strict';
    $(function () {
        $('.file-upload-browse').on('click', function () {
            var file = $(this).parent().parent().parent().find('.file-upload-default');
            file.trigger('click');
        });
        $('.file-upload-default').on('change', function () {
            //$(this).parent().find('.form-control').val($(this).val().replace(/C:\\fakepath\\/i, ''));
            const list = this.files;
            let fileList = "";
            for (let i = 0; i < list.length; i++) {
                fileList += list[i].name + '     ';
            }
            const p = $("<p>");
            const fileInput = $("<input>");
            const delBtn = $("<button>");
            fileInput.attr("type","text");
            fileInput.addClass("form-control");
            fileInput.addClass("file-upload-info");
            delBtn.attr("type","button");
            delBtn.attr("onclick","deleteImg(this,${classImgList.classNum},'${classImgList.imgPath}');" );
            delBtn.text("삭제");
            delBtn.addClass("imgDelBtn");
            delBtn.addClass("btn btn-brand");
            //delBtn.attr("onclick","deleteImg(this,${classImgList.classNum},'${classImgList.imgPath}');" ");
            p.append(fileInput);
            p.append(delBtn);
            $(".input-group").append(p);

            fileInput.val(fileList);
        });
    });

})(jQuery);

//사진 삭제하는 로직
function deleteImg(obj, classNum, imgPath){
    const imgNoInput = $("<input>");
    imgNoInput.attr("name","imgNoList");
    imgNoInput.val(classNum);
    imgNoInput.hide();

    const imgpathInput = $("<input>");
    imgpathInput.attr("name","imgpathList");
    imgpathInput.val(imgPath);
    imgpathInput.hide();

    $("#updateForm").append(imgNoInput).append(imgpathInput);
    $(obj).parent().remove();
}