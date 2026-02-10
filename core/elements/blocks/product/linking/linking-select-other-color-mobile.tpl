{if isset($linksData) && $linksData.cvet?}
    {set $colorGroups = $linksData.cvet}
     <div class="linking-select-other-color-mobile">
         <label class="linking-select-other-color-mobile__label" for="linking-select-other-color-mobile__select">Палитра:</label>
         <div class="linking-select-other-color-mobile__wrap">
            <button type="button" class="linking-select-other-color-mobile__btn js-linking-colors-btn">
                <span class="selections__item-media linking-select-other-color-mobile__swatch" data-val="{$cvet}"></span>
                <span class="linking-select-other-color-mobile__current">{$cvet}</span>
            </button>
            <ul class="linking-select-other-color-mobile__list js-linking-colors-list" aria-hidden="true">
                {foreach $colorGroups as $group}
                    {foreach $group as $id => $val}
                        <li class="linking-select-other-color-mobile__item">
                            <a href="{$_modx->makeUrl($id)}" class="linking-select-other-color-mobile__option" data-val="{$val}" >
                                <span class="selections__item-media colors-select__option euv-custom-select__option" data-val="{$val}" data-value="{$val}"></span>
                                <span class="linking-select-other-color-mobile__text">{$val}</span>
                            </a>
                        </li>
                    {/foreach}
                {/foreach}
            </ul>
         </div>
     </div>
     <script>
         (function(){
            var btn = document.querySelector('.js-linking-colors-btn');
            var list = document.querySelector('.js-linking-colors-list');
            var sw = document.querySelector('.linking-select-other-color-mobile__swatch');
            var cur = document.querySelector('.linking-select-other-color-mobile__current');
            if (!btn || !list || !sw || !cur) return;
            function closeList(){
                list.setAttribute('aria-hidden','true');
                list.classList.remove('is-open');
                document.removeEventListener('click', onDocClick);
            }
            function onDocClick(e){
                if (!list.contains(e.target) && !btn.contains(e.target)) closeList();
            }
            btn.addEventListener('click', function(){
                var isOpen = list.classList.toggle('is-open');
                list.setAttribute('aria-hidden', String(!isOpen));
                if (isOpen) document.addEventListener('click', onDocClick);
            });
            list.addEventListener('click', function(e){
                var link = e.target.closest('.linking-select-other-color-mobile__option');
                if (!link) return;
                e.preventDefault();
                var val = link.getAttribute('data-val');
                if (val) {
                    sw.setAttribute('data-val', val);
                    cur.textContent = val;
                }
                var url = link.getAttribute('href');
                closeList();
                if (url) { window.location.href = url; }
            });
         })();
     </script>
 {/if}


