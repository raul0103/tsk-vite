{if 'skladi_page_id' | config}
    {set $items = '@FILE snippets/getResourcesArray.php' | snippet : [
        'parents' => 'skladi_page_id' | config
        'includeTVs' => 'warehouse_photo' 
    ]}
{else}
    {set $items = []}
{/if}

<div class="product-card-main__right">
    {insert "file:sections/product/card-info/v1/right/controls.tpl"}
    {insert "file:sections/product/card-info/v1/right/review.tpl"}

    <div class="bordered-block">
        <div class="d-flex gap-8 fw-700">
            <img width="16" src="/assets/template/img/icon-delivtext.png" />
            Доставка в день заказа
        </div>

        <div class="d-flex gap-8">
            <svg width="16" height="15" viewBox="0 0 16 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M10.0833 10.7167L7.51667 8.18333V4.61667H8.51667V7.76667L10.8 10L10.0833 10.7167ZM7.95 14C6.29444 14 4.88889 13.4139 3.73333 12.2417C2.57778 11.0694 2 9.65 2 7.98333H3C3 9.37222 3.47778 10.5556 4.43333 11.5333C5.38889 12.5111 6.56111 13 7.95 13C9.36111 13 10.5556 12.5056 11.5333 11.5167C12.5111 10.5278 13 9.32778 13 7.91667C13 6.53889 12.5056 5.375 11.5167 4.425C10.5278 3.475 9.33889 3 7.95 3C7.19444 3 6.48611 3.17222 5.825 3.51667C5.16389 3.86111 4.58889 4.31667 4.1 4.88333H5.85V5.88333H2.36667V2.41667H3.36667V4.18333C3.94444 3.50556 4.63056 2.97222 5.425 2.58333C6.21944 2.19444 7.06111 2 7.95 2C8.78333 2 9.56667 2.15556 10.3 2.46667C11.0333 2.77778 11.675 3.20278 12.225 3.74167C12.775 4.28056 13.2083 4.91111 13.525 5.63333C13.8417 6.35556 14 7.13333 14 7.96667C14 8.8 13.8417 9.58333 13.525 10.3167C13.2083 11.05 12.775 11.6889 12.225 12.2333C11.675 12.7778 11.0333 13.2083 10.3 13.525C9.56667 13.8417 8.78333 14 7.95 14Z" fill="#323232"/>
            </svg>
            Возможность возврата товара
        </div>

        <div class="d-flex gap-8">
            <svg width="16" height="14" viewBox="0 0 12 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M6 0C4.54131 0 3.14236 0.579463 2.11091 1.61091C1.07946 2.64236 0.5 4.04131 0.5 5.5C0.5 9.69 5.5 13.72 5.69 13.89C5.77797 13.9606 5.88722 13.9993 6 14C6.1145 14.0005 6.22569 13.9617 6.315 13.89C6.525 13.72 11.5 9.69 11.5 5.5C11.5 4.04131 10.9205 2.64236 9.88909 1.61091C8.85764 0.579463 7.45869 0 6 0ZM6 12.845C4.935 11.905 1.5 8.65 1.5 5.5C1.5 4.30653 1.97411 3.16193 2.81802 2.31802C3.66193 1.47411 4.80653 1 6 1C7.19347 1 8.33807 1.47411 9.18198 2.31802C10.0259 3.16193 10.5 4.30653 10.5 5.5C10.5 8.65 7.065 11.905 6 12.845Z" fill="black"/>
                <path d="M9.00002 4.87997L8.50002 2.87997C8.47264 2.76903 8.40809 2.67082 8.31712 2.60167C8.22615 2.53253 8.11423 2.49664 8.00002 2.49997H4.00002C3.8858 2.49664 3.77389 2.53253 3.68291 2.60167C3.59194 2.67082 3.52739 2.76903 3.50002 2.87997L3.00002 4.87997C2.99755 4.89654 2.99755 4.91339 3.00002 4.92997C2.99768 4.95324 2.99768 4.97669 3.00002 4.99997V7.99997C3.00002 8.13258 3.0527 8.25975 3.14646 8.35352C3.24023 8.44729 3.36741 8.49997 3.50002 8.49997H8.50002C8.63263 8.49997 8.7598 8.44729 8.85357 8.35352C8.94734 8.25975 9.00002 8.13258 9.00002 7.99997V4.99997C9.00236 4.97669 9.00236 4.95324 9.00002 4.92997C9.00248 4.91339 9.00248 4.89654 9.00002 4.87997ZM7.86002 4.49997H6.50002V3.49997H7.61002L7.86002 4.49997ZM4.39002 3.49997H5.50002V4.49997H4.14002L4.39002 3.49997ZM8.00002 7.49997H4.00002V5.49997H5.50002V5.99997C5.50002 6.13258 5.5527 6.25975 5.64646 6.35352C5.74023 6.44729 5.86741 6.49997 6.00002 6.49997C6.13263 6.49997 6.2598 6.44729 6.35357 6.35352C6.44734 6.25975 6.50002 6.13258 6.50002 5.99997V5.49997H8.00002V7.49997Z" fill="black"/>
            </svg>
            Доступен самовывоз
        </div>
    </div>

        {if $_modx->resource.context_key in ['penoplex', 'rockwool', 'tn', 'knauf']}
            {if $_modx->getPlaceholder('localdata').main_contacts.email_prefix != "krasnodar"}
                {"@FILE modules/stocks/snippets/stocks.php" | snippet : []}
            {/if}
        {else}
            {if $items}
            <div class="bordered-block">
                <div class="mb-8 d-flex gap-8">
                    <svg width="16"  height="16" class="svg icon-available" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1">
                        <use xlink:href="/assets/template/img/svg-sprite.svg#icon-available"></use>
                    </svg>
                    <div>
                        <span class="fw-700 color-success">В наличии</span> на {count($items) | declension : 'складе|склад|складах' : true}:
                    </div>
                </div>
                {if $_modx->getPlaceholder('localdata').main_contacts.email_prefix != "krasnodar"}
                <table class="mb-8 w-max-content">
                    <tbody>
                        {foreach $items as $item}
                        <tr class="d-flex gap-16 justify-between">
                            <td>
                                <div class="d-flex gap-8">
                                    <svg width="13" height="14" viewBox="0 0 13 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M8.63851 5.31721C8.63851 6.49827 7.68107 7.45571 6.50001 7.45571C5.31893 7.45571 4.36151 6.49827 4.36151 5.31721C4.36151 4.13615 5.31893 3.17871 6.50001 3.17871C7.68107 3.17871 8.63851 4.13615 8.63851 5.31721ZM8.12851 5.31721C8.12851 6.21661 7.39939 6.94571 6.50001 6.94571C5.60061 6.94571 4.87151 6.21661 4.87151 5.31721C4.87151 4.41782 5.60061 3.68871 6.50001 3.68871C7.39939 3.68871 8.12851 4.41782 8.12851 5.31721Z" fill="black"/>
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12.1056 6.13439C12.1056 8.64791 8.41059 12.0757 7.02044 13.2764C6.71966 13.5362 6.28033 13.5362 5.97955 13.2764C4.58941 12.0757 0.894409 8.64791 0.894409 6.13439C0.894409 3.03852 3.40412 0.528809 6.49999 0.528809C9.59588 0.528809 12.1056 3.03852 12.1056 6.13439ZM11.5956 6.13439C11.5956 6.64515 11.4051 7.24505 11.056 7.90278C10.7099 8.55485 10.2278 9.22684 9.69201 9.87182C8.62052 11.1617 7.37323 12.2978 6.68709 12.8904C6.57778 12.9848 6.42221 12.9848 6.3129 12.8904C5.62675 12.2978 4.37948 11.1617 3.30798 9.87182C2.77221 9.22684 2.29004 8.55485 1.94396 7.90278C1.59486 7.24505 1.40441 6.64515 1.40441 6.13439C1.40441 3.32017 3.68578 1.03881 6.49999 1.03881C9.31422 1.03881 11.5956 3.32017 11.5956 6.13439Z" fill="black"/>
                                    </svg>
                                    <a class="text-underline" href="{$item['uri']}">{$item['pagetitle']}</a>
                                </div>
                            </td>
                            <td class="fw-700">
                                {set $unit = $_modx->resource['unit'][0]}
                                {set $stockCount = '@FILE modules/stocks/snippets/getProductStockByWarehouse.php' | snippet : [
                                    'productId' => $_modx->resource.id,
                                    'context' => $_modx->resource.context_key,
                                    'stockName' => $item['pagetitle']
                                ]}
                                {if $unit == "упаковка"}
                                    {set $unit_declension = "уп."}
                                {elseif $unit == "лист"}
                                    {set $unit_declension = $stockCount | declension : 'л.|л.|л.'}
                                {else}
                                    {set $unit_declension = "шт."}
                                {/if}
                                {if $stockCount > 0}
                                    {$stockCount} {$unit_declension}
                                {else}
                                    Под заказ
                                {/if}
                            </td>
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
                {/if}

                <div class="product-card__delivery">
                    <span
                      data-fancybox=""
                      data-src="#cost-delivery"
                      class="product-card__delivery-link"
                    >
                      <svg
                        class="svg icon-delivery"
                        xmlns="http://www.w3.org/2000/svg"
                        xmlns:xlink="http://www.w3.org/1999/xlink"
                        version="1.1"
                      >
                        <use
                          xlink:href="/assets/template/img/svg-sprite.svg#icon-delivery"
                        ></use>
                      </svg>
                      Узнать стоимость с доставкой
                    </span>
                </div>
            </div>
        {/if}
    {/if}


    {if $_modx->resource.context_key in ['penoplex', 'rockwool', 'tn']}
        {"@FILE modules/restrictions/restrictions.php" | snippet}
    {/if}

    <div class="fw-700">Доставка в Санкт-Петербург и Лен. область</div>
</div>
