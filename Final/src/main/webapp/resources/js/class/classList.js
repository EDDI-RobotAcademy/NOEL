/**
 * 
 */

const tag = $(".storeList-tag-content>ul>li");
const tabCategory = $(".tabCategory").text();
const tabSort = $(".tabSort");
const tabSortText = $(".tabSort").text();
tag.on("click", function () {
    const index = tag.index(this);
    if (index < tag.length) {
        for (i = 0; i < tag.length; i++) {
            $(tag).eq(i).removeAttr("back-color");
        }
    }
    $(tag).eq(index).attr("class", "back-color");
    console.log(tabCategory);
});
tag.eq(tabCategory).click();

const sort = $(".storeList-sort-content>form>ul>button");
sort.on("click", function () {
    const sortindex = sort.index(this);
    if (sortindex < sort.length) {
        for (i = 0; i < sort.length; i++) {
            $(sort).eq(i).css("color", "black");
        }
    }
    $(sort).eq(sortindex).css("color", "#FF9F45");
});

tabSort.on("click", function () {
    if (tabSortText == "new") {
        sort.eq(0).css("background-color", "white");
    }
    if (tabSortText == "grade") {
        sort.eq(0).css("background-color", "#ffc107");
        sort.eq(0).css("border", "1px solid #ffc107");
        $("[name=storeListSort]").eq(0).val('new');
    }
    if (tabSortText == "reviewCount") {
        sort.eq(1).css("background-color", "#ffc107");
        sort.eq(1).css("border", "1px solid #ffc107");
        $("[name=storeListSort]").eq(1).val('new');
    }
});

tabSort.click();

const locationTag = $(".storeList-map-content>div");
locationTag.on("click", function () {
    const index = locationTag.index(this);
    const TagText = document.querySelector(".storeList-map-content>div>p");

    if (index < locationTag.length - 1) {
        const locationTagText = locationTag.eq(index).text();
        TagText.innerText = locationTagText + " 지역 맛집 찾기";
    }
});

