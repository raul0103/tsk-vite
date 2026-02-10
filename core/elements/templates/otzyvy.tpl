{extends "file:layouts/default.layout.tpl"}

{block "page"}
    <div class="wrapper">
        {insert "file:blocks/breadcrumbs.tpl"}
    </div>
  
    <div class="wrapper">
      {insert 'file:sections/otzyvy/otzyvy-page-block.tpl'}
    </div>

    {insert "file:sections/payment.tpl"}
    {insert "file:sections/faq.tpl"}
    {insert "file:sections/districts-map.tpl"}
    {insert "file:sections/appeal.tpl"}
    {insert "file:sections/advantages.tpl"}
    {insert "file:sections/steps.tpl"}
    {insert "file:sections/partners.tpl"}
{/block}
