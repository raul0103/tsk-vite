<?php

require_once MODX_CORE_PATH . "elements/class/Product/SimilarProduct.php";

class Product
{
    public SimilarProduct $similarProduct;
    public modX $modx;
    protected $context;

    public function getContext(): string
    {
        return $this->context;
    }

    public function getId(): int
    {
        return $this->id;
    }
    protected $id;

    public function __construct(modX &$modx)
    {
        $this->modx = $modx;
        $this->id = isset($modx->resource->id)? $modx->resource->id: 0;
        $this->context = isset($modx->resource->context_key)? $modx->resource->context_key: "";
        $this->similarProduct = new SimilarProduct($this);
    }

    /**
     * @param mixed $id
     */
    public function setId($id): void
    {
        $this->id = $id;
    }

    public function setContext($context)
    {
        $this->context = $context;
    }
}