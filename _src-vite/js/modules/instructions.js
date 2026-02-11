export default function Instructions()
{
    if($('.instruction').length > 0)
    {

        $(".cat-menu__drop-item a").on("click", function (e){
            e.preventDefault();
            let category = $(this).text();
            let h1 = $(this).find("span").data("h1");
            $("h1").text(h1);
            $(".cat-menu__drop-item a").removeClass("active");
            $(this).addClass("active");
            $.ajax({
                method: "get",
                dataType: "html",
                url: window.location.pathname,
                data: { ajax_action: "instruction", category: category, type: $(".documentation-list").data("type")},
                success: function (data) {
                    $(".documentation-list").html("");
                    $(".documentation-list").html(data);
                },
                error: function (data) {
                },
            });

        });
        $(".cat-menu__drop-item-drop-item").on("click", function (e){
            e.stopPropagation();
        });

        $(".cat-menu__drop-item").each(function (elem){
            $(this).on("click", function (e){
                if($(this).hasClass("has-drop")){

                    $(this).toggleClass("open");
                    $(this).find(".cat-menu__drop-item-drop").toggleClass("open");
                }
            })
        });
    }
}
