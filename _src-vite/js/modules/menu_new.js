

export default function MenuNewV2(){
    console.log('started MenuNewV2');
    if($('.menu_new_v2').length){
        console.log('finded MenuNewV2');
        $('.menu_new_v2').find('.mm_block_main_item').eq(0).addClass('active');
        $('.menu_new_v2').find('.mm_block_inner').eq(0).addClass('active');
        

        $('.menu_new_v2').find('.mm_block_main_item').on('click', function(){
            $('.menu_new_v2').find('.mm_block_main_item').removeClass('active');
            $(this).addClass('active');
            var id=$(this).attr('data-category');
            $('.menu_new_v2').find('.mm_block_inner').removeClass('active');
            $('#'+id).addClass('active');
        })
    }
} 