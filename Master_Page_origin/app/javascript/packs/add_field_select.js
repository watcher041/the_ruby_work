
$(function () {

    function buildHTML(data, it) {

        var select = $(it).clone().removeAttr("id").empty();
        var option = $("<option>", { value: "" }).text("選択してください");
        select.append(option);

        data.forEach(function (value) {
            option = $("<option>", { value: value.id }).text(value.name);
            select.append(option);
        })

        var div = $(it).parent().clone().removeAttr("id").html(select);

        return div
    }

    $(document).on("change", ".field_list", function (event) {

        // 選択したフォームより下にある選択肢を削除する
        $(this).parent().nextAll('.field_form').remove()

        var field_id = $(this).val();

        $.ajax({
            url: "/fields/" + field_id,
            type: "GET",
            dataType: "json",
            context: this,
            cache: false
        })
        .done(function (data) {

            // 子要素がなければ選択肢を表示しない
            if (data.length != 0) {

                // 選択したフォームの下に新たなフォームを追加
                var html = buildHTML(data, this)
                $(this).parent().after(html)
            }
        })
        .fail(function () {
            console.log("error!")
        })

    })

})