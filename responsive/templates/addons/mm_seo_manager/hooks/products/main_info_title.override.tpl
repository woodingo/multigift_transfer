{hook name="products:main_info_title"}
{if !$hide_title}
	<h1 class="ty-product-block-title" itemprop="name">
		{strip}
		{if $product.heading_overrule != ""}
			{$product.heading_overrule|fn_mm_seo_manager_get_pattern_with_replaced_tags:$product}
		{else}
			{$product.product nofilter}
		{/if}
		{/strip}
	</h1>
{/if}

{hook name="products:brand"}
    <div class="brand">
        {include file="views/products/components/product_features_short_list.tpl" features=$product.header_features}
    </div>
{/hook}
{/hook}
