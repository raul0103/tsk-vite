<section class="catalog-banner">
    <div class="catalog-banner__content">
        <p class="catalog-banner__header">Не знаете, что вам подходит?</p>
        <p class="catalog-banner__subheader">Правильная консультация <span class="catalog-banner__special-text">сэкономит Вам до 40%</span> бюджета!</p>
        <p class="catalog-banner__text">Оставьте заявку и получите бесплатную консультацию по подбору
            {if $_modx->context.key == 'krovlya'}
                кровли
            {elseif $_modx->context.key == 'kirpich-m'}
                кирпича
            {elseif $_modx->context.key == 'pilomat'}
                пиломатериала
            {elseif $_modx->context.key == 'fasady-pro'}
                деревянных фасадов
            {elseif $_modx->context.key == 'fasad'}
                фасадов
            {elseif $_modx->context.key == 'armatura-178'}
                арматуры
            {elseif $_modx->context.key == 'asconcrete'}
                асфальтобетона
            {elseif $_modx->context.key == 'plitaosb'}
                плит ОСБ
            {elseif $_modx->context.key == 'pro-fanera'}
                фанеры
            {elseif $_modx->context.key == 'plity-mdvp'}
                плит МДВП
            {elseif $_modx->context.key == 'policarbonat'}
                поликарбоната
            {elseif $_modx->context.key == 'drova'}
                дров
            {elseif $_modx->context.key == 'ugol'}
                угля
            {elseif $_modx->context.key == 'pellety'}
                пеллетов
            {elseif $_modx->context.key == 'brikety'}
                топливных брикетов
            {else}
                утеплителя
            {/if}
            под Ваши требования</p>
        <form class="catalog-banner__form" method="post">
            <input type="text" class="catalog-banner__input" name="NAME" placeholder="Ваше имя">
            <input type="tel" class="catalog-banner__input" name="PHONE" placeholder="Укажите номер телефона*">

            <label class="catalog-banner__privacy-wrap privacy">
                <span class="custom-checkbox">
                    <input class="custom-checkbox__input" type="checkbox" checked="" name="privacy">
                    <span class="custom-checkbox__checkmark"></span>
                </span>
                <span class="privacy__text">согласен(на) с <span
                            class="privacy__link" data-fancybox data-type="ajax"
                            data-src="/confidential/">политикой конфиденциальности</span> сайта</span>
            </label>

            <button class="catalog-banner__btn-submit">Отправить</button>
            <input type="text" name="mobilephone" class="fmobilephone">
        </form>
    </div>

    {set $banner_data = "@FILE snippets/apiGetBanner.php" | snippet : [
    'id' => $_modx->resource.id,
    'parent' => $_modx->resource.parent,
    'position' => 'catalog',
    ]}

    {set $desktop_image = ""}
    {set $mobile_image = ""}

    {set $banner_groups = $banner_data['data']}
    {if $banner_data['status'] && !empty($banner_groups)}
        {set $banner_group = $banner_groups[0]}

        {set $banners = $banner_group['banners_by_type']}
        {set $button_settings = $banner_group['button']}
        {set $button_classname = $banner_group['data']['button-classname']}

        {if isset($banners['desktop']['image_url'])}
            {set $desktop_image = $banners['desktop']['image_url']}
        {/if}

        {if isset($banners['mobile']['image_url'])}
            {set $mobile_image = $banners['mobile']['image_url']}
        {/if}
    {/if}

    <style>
        .catalog-banner__img
        {
            background-image: url({$desktop_image})
        }

        {if $mobile_image}
            @media screen and (max-width: 772px) {
                .catalog-banner__img{
                    background-image: url({$mobile_image})
                }
            }
        {/if}
    </style>
    <div class="catalog-banner__img"></div>
</section>
