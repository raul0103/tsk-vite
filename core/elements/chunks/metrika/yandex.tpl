<!-- Yandex.Metrika counter -->
{if $virtual_seo_yandexID}
<script type="text/javascript">
    (function(m,e,t,r,i,k,a) { m[i]=m[i]||function() { (m[i].a=m[i].a||[]).push(arguments) } ;
        m[i].l=1*new Date();k=e.createElement(t),a=e.getElementsByTagName(t)[0],k.async=1,k.src=r,a.parentNode.insertBefore(k,a) } )
    (window, document, "script", "https://mc.yandex.ru/metrika/tag.js", "ym");
    ym( {$virtual_seo_yandexID} , "init", {
        clickmap:true,
        trackLinks:true,
        accurateTrackBounce:true,
        webvisor:true,
        ecommerce:"dataLayer"
    } );
</script>
<!-- /Yandex.Metrika counter -->
{if $_modx->getPlaceholder('checkHost') === 'prod'}
    <!-- Yandex.Metrika counter -->
    <noscript><img src="https://mc.yandex.ru/watch/{$virtual_seo_yandexID}" style="position:absolute; left:-9999px;" alt="" /></noscript>
    <!-- /Yandex.Metrika counter -->
{/if}
{else}
    <!--not set -->
{/if}
