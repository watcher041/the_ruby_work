
// HTMLの読み込みを終了した後に実行
$(function(){
  
  // 画像がファイル選択された場合に起動
  $("#file_get_field").on("change",function(event){

    // イベントから画像のファイル情報を抜き出す
    var files = this.files;

    // 各ファイルごとに読み込み終了後、imgタグで表示するようにする
    var reader,outline,image,edit,label,name;
    var file_num = $(".field-area-image").length;
    var label = $(".field-area-label").find("input").clone().removeAttr("id").addClass("field-area-image-input");
    
    // 今プレビューで表示されている分のindex番号を取得
    if( file_num === 0  ){
      var index_array = [10]
    }
    else {
      var index_array = [];
      $(".field-area-image").each(function(key,node){
        index_array.push( $(node).data("index") );
      })
    }

    $.each(files,function(k,file){

      // 存在しない番号になるまで探す
      while(index_array.includes(k)){
        k += 1
      }

      // FileReaderオブジェクトを作成します
      reader = new FileReader();
      
      // ファイルをデータURLとして読み込む
      reader.readAsDataURL(file);
  
      // 画像の読み込みが完了したら処理が実行されます
      reader.onload = function () {

        // 大枠を用意
        outline = $("<div>").addClass("field-area-image").attr("data-index",k)
    
        // 画像を表示する
        image = $("<div>").addClass("field-area-image-outline").append( $("<img>").attr("src",this.result) );
        $(outline).append(image);

        // ボタンを配置する親を作成
        edit = $("<div>").addClass("field-area-image-edit");

        // 編集ボタンの追加
        name = label.attr("name").replace(/[0-9]/,k);
        label =  $("<label>").text("変更").append( label.attr("name",name) );
        edit.append(label);

        // 削除ボタンの追加
        $(edit).append( $("<label>").addClass("image-remove").text("削除") );
        $(outline).append(edit);

        // 画像投稿フォームにプレビューを表示する
        $(".field-area-label").before(outline);

        // 10枚以上になれば追加しない
        if ( file_num + 1 >= 10){
          $(".field-area-label").css("display","none");
          return false; // breakの役割
        }
      }
    })

  })
  
  // データの変換があれば画像を変更する
  $(document).on("change",".field-area-image-input",function(event){

    var file = this.files[0];
    var img = $(this).parents(".field-area-image").find("img")

    // FileReaderオブジェクトを作成します
    var reader = new FileReader();
      
    // ファイルをデータURLとして読み込む
    reader.readAsDataURL(file);

    // 画像の読み込みが完了したら処理が実行されます
    reader.onload = function () {

      $(img).attr("src",this.result)

    }

  })

  // データの削除を行う
  $(document).on("click",".image-remove",function(event){

    // 10枚あるときに削除した場合は画像入力欄を表示する。
    if ( $(".field-area-image").length == 10 ){
      $(".field-area-label").css("display","flex");
    }

    // 削除ボタンが押された要素の本体を削除
    $(this).parents(".field-area-image").remove();


  })

})