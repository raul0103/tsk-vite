{if $_modx->context.key !== 'onduline1'}
<section class="appeal">

  <div class="wrapper">
    <h2 class="title-2">Видеообращение директора</h2>
    {set $src = '032f8f2cd088290d084bdbc9f118aad0'}
    {'@FILE snippets/VideoLazyLoadRutub.php' | snippet : ['params' => 'src=' ~ $src ~ ',w=1120,h=630']}
  </div>
</section>
{/if}