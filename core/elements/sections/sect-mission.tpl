{set $data = [
"image1" =>  $_modx->runSnippet("@FILE snippets/imageExist.php", [
"path" => "/assets/template/img/about/" ~ $_modx->resource.context_key ~ "/",
"image" => "mission-1",
]),
"image2" =>  $_modx->runSnippet("@FILE snippets/imageExist.php", [
"path" => "/assets/template/img/about/" ~ $_modx->resource.context_key ~ "/",
"image" => "mission-2",
]),
"image3" =>  $_modx->runSnippet("@FILE snippets/imageExist.php", [
"path" => "/assets/template/img/about/" ~ $_modx->resource.context_key ~ "/",
"image" => "mission-3",
]),
"image4" =>  $_modx->runSnippet("@FILE snippets/imageExist.php", [
"path" => "/assets/template/img/about/" ~ $_modx->resource.context_key ~ "/",
"image" => "mission-4",
]),

"rockwool" => [
"text1" => "Мы стремимся предоставлять качественные теплоизоляционные материалы по доступной цене и помогать клиентам находить оптимальные решения для их проектов.",
"text2" => "Подход к клиентам: индивидуальный подбор продукции, быстрые сроки поставки, гарантированное качество.",
"text3" => "Надежность, честность и стремление к долгосрочному сотрудничеству.",
],

"tn" => [
"text1" => "Наша цель — предлагать надежные теплоизоляционные материалы по выгодной цене и помогать клиентам подбирать лучшие решения для их проектов.",
"text2" => "Наш подход к клиентам: персональный подбор товаров, оперативная доставка и гарантированное качество.",
"text3" => "Доверие, порядочность и ориентированность на долгосрочное сотрудничество.",
],

"penoplex" => [
"text1" => "Мы стремимся предлагать надежные теплоизоляционные материалы по выгодной цене и помогать клиентам выбирать оптимальные решения для их проектов.",
"text2" => "Наш подход к клиентам включает персональный подбор продукции, оперативную доставку и гарантированное качество.",
"text3" => "Доверие, порядочность и ориентация на долгосрочное сотрудничество.",
],


"knauf" => [
"text1" => "Мы предлагаем надежные теплоизоляционные материалы по выгодной цене и помогаем клиентам выбирать лучшие решения для их проектов",
"text2" => "Индивидуальный подход к каждому клиенту: подбор продукции, оперативная доставка, гарантированное качество.",
"text3" => "Надежность, открытость и ориентация на долгосрочные отношения.",
],

"isover" => [
"text1" => "Наша цель — предоставлять надежные утеплители по выгодной стоимости и поддерживать клиентов в подборе эффективных решений.",
"text2" => "Для каждого клиента — индивидуальный подбор товаров, оперативная поставка и надежное качество.",
"text3" => "Доверие, прозрачность и фокус на стабильные партнерские отношения.",
],


"paroc" => [
"text1" => "Мы предлагаем проверенные утеплители по разумной цене и помогаем находить наиболее эффективные решения для каждого проекта.",
"text2" => "Персональный подход к каждому клиенту: точный подбор товаров, быстрая доставка и гарантированное качество.",
"text3" => "Надежность, честность и ориентация на долгосрочные партнерские связи.",
],

]}


<section class="sect-mission">
    <div class="wrapper">
        <div class="sect-mission__container">
            <div class="sect-mission__row sect-mission__row--first">
                <div class="sect-mission__card">
                    <div class="sect-mission__card-image">

                        <img src="{$data['image1']}">
                    </div>
                </div>
                <div class="sect-mission__card">
                    <div class="sect-mission__card-content">
                        <p class="sect-mission__card-text">
                            {$data[$_modx->resource.context_key]["text1"]}
                        </p>
                    </div>
                </div>
                <div class="sect-mission__card mobile-hide">
                    <div class="sect-mission__card-image">

                        <img src="{$data['image2']}">
                    </div>
                </div>
            </div>

            <div class="sect-mission__row sect-mission__row--second">
                <div class="sect-mission__card mobile-order-2">
                    <div class="sect-mission__card-image">
                        <img src="{$data['image3']}">
                    </div>
                </div>
                <div class="sect-mission__card">
                    <div class="sect-mission__card-content">
                        <p class="sect-mission__card-text">
                            {$data[$_modx->resource.context_key]["text2"]}
                        </p>
                    </div>
                </div>
                <div class="sect-mission__card mobile-order-3">
                    <div class="sect-mission__card-image">
                        <img src="{$data['image4']}">
                    </div>
                </div>
                <div class="sect-mission__card mobile-order-4">
                    <div class="sect-mission__card-content">
                        <p class="sect-mission__card-text">
                            {$data[$_modx->resource.context_key]["text3"]}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


