{** block-description:mm_functions_alternative_products_by_product_categories **}
{assign var="alternative_products_by_product_categories_block_content" value=$smarty.request.product_id|fn_mm_functions_get_alternative_products_by_product_categories_block_content:$breadcrumbs}
{if !empty($alternative_products_by_product_categories_block_content)}
	<div id="mm-functions-alternative-products-by-product-categories">
	{if $alternative_products_by_product_categories_block_content.intro_text}
	<p>{$alternative_products_by_product_categories_block_content.intro_text nofilter}</p>
	{/if}
	{include file="blocks/list_templates/grid_list.tpl"
	products=$alternative_products_by_product_categories_block_content.products
	columns=4
	show_empty=true
	show_trunc_name=true
	show_old_price=true
	show_price=true
	show_clean_price=true
	show_list_discount=true
	no_pagination=true
	no_sorting=true
	show_add_to_cart=false
	is_wishlist=false}

	{if $breadcrumbs && $breadcrumbs.1}
	<a href="{{$breadcrumbs.1.link}|fn_url}" class="view-more-link" title="{$breadcrumbs.1.title}">{__("mm_functions_view_more")} {$breadcrumbs.1.title}</a>
	{/if}
	</div>
{/if}
