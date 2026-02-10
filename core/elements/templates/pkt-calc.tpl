{extends "file:layouts/default.layout.tpl"} {block "page"}
<div class="wrapper">{include "file:blocks/breadcrumbs.tpl"}</div>
<div class="wrapper">
  <h1 class="title-1">{$_modx->resource.pagetitle}</h1>
  {include 'file:sections/pkt-calc-content.tpl'}
</div>
{/block}
