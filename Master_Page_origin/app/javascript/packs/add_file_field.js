

// HTMLの読み込みを終了した後に実行
$(function(){
  
  // 画像がファイル選択された場合に起動
  $(document).on("change","input[type='file']",function(event){

    // 変数の定義
    var files = this.files;
    var it = this;
    var ul =  $("<ul>")
    var outline = $(this).parent().clone().empty();
    var reader;

    // 選択したフォームより下にある選択肢を削除すると同時に、選択したフォームからidを削除
    $(this).removeAttr("id").parent().nextAll().remove()

    // 一度選択して再度選択した場合、表示されていた名前を消す
    $(this).nextAll().remove();

    // 選択したものには削除ボタン、同時に次の選択ボタンを追加
    $(this).after( $("<p>").attr({class:"file_remove"}).text("削除") );
    $(outline).append(  $("<input>").attr({type:"file", multiple: "multiple", name:$(this).attr("name") }) )
    $(this).parent().after(outline);
    
    // ファイルをひとつずつ読み取り、表示
    $.each(files,function(k,file){

      // FileReaderオブジェクトを作成します
      reader = new FileReader();
      
      // ファイルをデータURLとして読み込む
      reader.readAsDataURL(file);

      // 画像の読み込みが完了したら処理が実行されます
      reader.onload = function () {

        // 選択したファイルのリストのHTMLを作成
        $(ul).append($("<li>").text(file.name))

      }
    })

    // 全てのファイルへ処理を終了後、追加したファイルのリスト表示
    $(it).parent().append(ul)

  })

  // 選択肢が一つだけになった場合、属性にrequiredを追加
  $(document).on("click",".file_remove",function(){
    if( $(this).parent().length == 1 ){
      $(this).parent().next().find("input").attr({required:"required"})
    }
    $(this).parent().remove()
  })

})