
$(function(){

  // 親カテゴリーをクリックするとスクロールする
  $("a[data-category-index]").on("click",function(){
    let num = $(this).data("category-index");
    $("html,body").animate({scrollTop:$('#'+ num).offset().top});
  })

  // 一番上に戻るボタンを押すとスクロールする関数
  $("#scroll_to_top").click(function() {

    // ページの一番上までスクロールさせます。
    $('body, html').animate({scrollTop:0});

  });
  

})