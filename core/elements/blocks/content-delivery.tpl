{* &nbsp; в ячейках таблицы нужны, чтобы выравнивание по центру (text-align: center) выглядело лучше *}

<article class="block-delivery">
  <table class="block-delivery__table">
    <tbody>
      <tr>
        <th>
          <span>Способ доставки</span>
        </th>
        <th>
          <span>MAX длина груза, м</span>
        </th>
        <th>
          <span>Стоимость доставки по СПб</span>
        </th>
      </tr>
      <tr>
        <td>
          Машина до 1,5 тн до 18 м3
        </td>
        <td>
          4
        </td>
        <td>
          от 2 400  руб
        </td>
      </tr>
      <tr>
        <td>
          Машина до 2,5 тн до 32 м3
        </td>
        <td>
          6
        </td>
        <td>
          от 3 200 руб
        </td>
      </tr>
      <tr>
        <td>
          Машина до 5 тн до 35 м3
        </td>
        <td>
          6
        </td>
        <td>
          от 4 400 руб
        </td>
      </tr>
      <tr>
        <td>
          Машина до 10 тн до 37 м3
        </td>
        <td>
          8
        </td>
        <td>
          от 6 000 руб
        </td>
      </tr>
      <tr>
        <td>
          Машина до 20 тн до 80 м3
        </td>
        <td>
          13,5
        </td>
        <td>
          от 10 800 руб
        </td>
      </tr>

      <tr class="block-delivery__table-row block-delivery__table-row_border-top_bold">
        <td>
          Манипулятор до 5 тн
        </td>
        <td>
          6
        </td>
        <td>
          от 7 200 руб
        </td>
      </tr>
      <tr>
        <td>
          Манипулятор до 10 тн
        </td>
        <td>
          8
        </td>
        <td>
          от 13 500 руб
        </td>
      </tr>
      <tr>
        <td>
          Манипулятор до 20 тн
        </td>
        <td>
          13,5
        </td>
        <td>
          от 16 200 руб
        </td>
      </tr>
    </tbody>
  </table>

  {if $_modx->resource.context_key == 'pilomat'}
  <p class="block-delivery__pre-btn-text">Во вторник, четверг и субботу доставка газелью от 1590 рублей в районе 30 км от КАД</p>
  {/if}

  <span data-src="#header-callback" data-fancybox class="block-delivery__btn custom-btn">Заказать с доставкой</span>

  {if $_modx->resource.context_key == 'pilomat'}
  <div class="content-block block-delivery__features">
    <p class="block-delivery__text block-delivery__text_img_gruzovik">Доставляем объем до 40 м3 через 2 часа после
      обращения
      <p class="block-delivery__text block-delivery__text_img_doski">Оплата после проверки качества и количества
        материала на объекте
        <p class="block-delivery__text block-delivery__text_img_doski">Погрузочные работы продукции на нашем складе
          производятся <b>бесплатно</b>
          <p class="block-delivery__text block-delivery__text_img_doski">Покрытие пиломатериалов огне-био-защитой от 900
            ₽ за м3
            <p class="block-delivery__text block-delivery__text_img_kraska"><a href="/pokraska/"
                class="link-bold">Окрашивание</a> пиломатериалов по низким ценам
              <p class="block-delivery__text block-delivery__text_img_doski">Любая форма оплаты: расчетный счет, по
                qr-коду - через СБП, через терминал или наличными
  </div>
  {/if}

  {if ($_modx->resource.context_key == 'plitaosb') && ($_modx->resource.id == '66728')}
    {set $advantures = [
         ["text" => "Срок доставки от 2 часов при наличии материала на складе", "key" => "fast-delivery"],
         ["text" => "Самовывоз материала в любое время", "key" => "24-hours" ],
         ["text" => "Погрузочные работы продукции на нашем складе производятся бесплатно", "key" => "service"],
         ["text" => "Оплата после проверки качества и количества материала на объекте", "key" => "tick"],
         ["text" => "Любая форма оплаты: расчетный счет, по qr-коду - через СБП, через терминал или наличными", "key" => "credit-card-payment"]
    ]}

    <div class="content-block block-delivery__features">
      {foreach $advantures as $item}
        <p class="block-delivery__text block-delivery__text_img_{$item['key']}">{$item['text']}</p>
      {/foreach}
    </div>
  {/if}


  <div class="content-block">
    {if $_modx->resource.context_key != 'pilomat'}
        {if ('is_block_delivery_intro' in keys $_modx->getPlaceholder('localdata'))}
          {if $_modx->getPlaceholder('localdata').is_block_delivery_intro != ''}
            <p class="block-delivery__intro">
              {$_modx->getPlaceholder('localdata').is_block_delivery_intro}
            </p>
          {/if}
        {else}
          <p class="block-delivery__intro">
            Во вторник, четверг и субботу доставка газелью от 1590 рублей в районе 30 км от КАД
          </p>
        {/if}
    {/if}

    <p>Срок доставки: от 2 часов при наличии материала на складе, либо в выбранный Вами интервал времени.</p>
    <p>
      Окончательную стоимость доставки по Санкт-Петербургу и Ленинградской области рассчитывается менеджером, учитывая
      местоположение Вашего объекта и требуемого объема. <br />Оформление заказа и доставки осуществляется по телефону
      <a href="tel:{$_modx->getPlaceholder('localdata').offices.0.phone}">{$_modx->getPlaceholder('localdata').offices.0.phone}</a>, форме обратной связи или по почте 
      <a href="mailto:{$_modx->config.mail_1}">{$_modx->config.mail_1}</a>.
    </p>
  </div>

  {if $_modx->resource.context_key == 'plitaosb' && ($_modx->resource.id == '66728')}
    {include "file:sections/sect-plitaosb-delivery.tpl"}
  {/if}
</article>