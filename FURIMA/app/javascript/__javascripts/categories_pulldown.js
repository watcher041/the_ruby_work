
$(function(){

  // プルダウンのHTMLを生成
  function buildHTML(categories){

    var link_tag, outline = $("<ul>");
    var link_class =$(".header-bottom-left-category-title").find("a").attr("class")
    var base_href = $(".header-bottom-left-category-title").find("a").attr("href") + "/";

    categories.forEach(function(category){
      link_tag = $("<a>", { href: base_href + category.id ,"class":link_class }).text(category.name)
      link_tag = $("<li>").append(link_tag)
      outline.append(link_tag)
    })

    return outline

  }
  
  // カーソルが触れたときに起動
  $(document).on({

    // カーソルが乗ったときに起動
    'mouseenter' : function(enter_event) {
      
      // mouseoverのデフォルト動作をクリアする
      enter_event.preventDefault();

      // カテゴリーのIDを取得できた場合には、子要素を取得
      $.ajax({
        url: $(this).attr("href"),
        type: "GET",
        dataType: "json",
        context: this,
        cache: false
      })
      .done(function(categories){

        // 子要素がなければ選択肢を表示しない
        if( categories.length > 0 ){

          // 「カテゴリから探す」以外に触れたら一掃する
          if( $(this).data("category-id") == 0){
            $(".header-bottom-left-category-field").empty();
          }

          // それ以外の場合は自分の後に表示されている子要素を削除する
          else{
            $(this).closest("ul").nextAll().remove()
          }

          // 選択したフォームの下に新たなフォームを追加
          var html = buildHTML(categories)
          $(".header-bottom-left-category-field").append(html)
        }
          
      })
      .fail(function(error){
        alert(error)
      })
    },
    
    // カーソルが離れたときに起動
    'mouseleave' : function(leave_event){

      // mouseleaveのデフォルト動作をクリアする
      leave_event.preventDefault();

      // 出る前と後の親要素のインデックスを取得する。
      var old_parent = $(this).closest("ul").index();
      var new_parent = $(leave_event.relatedTarget).closest("ul").index();

      // 子要素へ移る場合はオレンジ色のままにする
      if( old_parent < new_parent ){
        $(this).css("color","orange");
      }

      // 親要素に移る場合には、その先の要素全てを黒にする。
      else if(old_parent > new_parent ){
        $(leave_event.relatedTarget).closest("ul").find("a").css("color","");
      }

    }
  },".category_name");

  // カテゴリーリストからカーソルが離れたらすべて消す
  $(".header-bottom-left-category").mouseleave(function(){
    $(".header-bottom-left-category-field").empty();
    $(".header-bottom-left-category-title").find("a").css("color","");
  })

})