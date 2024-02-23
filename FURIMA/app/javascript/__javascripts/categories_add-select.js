
$(function () {

    // 子要素を表示するHTMLを作成する関数
    function buildView(categories, target) {

        // ターゲットとなるクラス名を付与したselectタグを生成する
        var select_class = $(target).attr("class");
        var select_tag = $("<select>", { "class": select_class });

        // option_tagタグを生成する
        var option_tag = $("<option>", { category: "" }).text("選択してください");
        select_tag.append(option_tag);
        categories.forEach(function (category) {
            option_tag = $("<option>", { category: category.id }).text(category.name);
            select_tag.append(option_tag);
        })

        // selectタグを大枠に追加して表示する
        var outline_class = $(target).parent().attr("class");
        var outline = $("<div>", {"class": outline_class }).html(select_tag);

        return outline;
    }

    // カテゴリーを選択した際に起動
    $(document).on("change", ".category_list", function (event) {

        // changeアクションのデフォルトの動作をクリアする（誤作動を防ぐため）
        event.preventDefault();

        // 取得したDOMからカテゴリーのIDを取得する
        var category_id = $(this).val();

        // 既に前に表示されている子要素を削除する
        $(this).nextAll().remove()

        // 選択したカテゴリーの子要素をデータベースから取得する
        $.ajax({
            url: "/categories/" + category_id,
            type: "GET",
            dataType: "json",
            context: this,
            cache: false
        })
        .done(function (categories) {

            // 子要素がなければ選択肢を表示しない
            if (categories.length != 0) {

                // 選択したフォームの下に新たなoption_tagタグを追加
                var html = buildView(categories, this)
                $(this).after(html)
            }
        })
        .fail(function () {
            console.log("error!")
        })

    })

})