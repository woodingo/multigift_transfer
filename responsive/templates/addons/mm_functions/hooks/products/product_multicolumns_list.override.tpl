{assign var="product_combinations_grouped_by_color_params" value=['product_id'=>$product.product_id,'get_icon'=>true,'get_detailed'=>true,'get_combination'=>true,'get_product_name'=>true,'product_data'=>$product]}
{assign var="product_combinations_grouped_by_color" value=$product_combinations_grouped_by_color_params|fn_mm_functions_get_product_combinations_grouped_by_color}
<div class="ty-grid-list__image">
	{if $product.while_supplies_last == "Y"}<div class="while_supplies_last_label"></div>{/if}
	{include file="views/products/components/product_icon.tpl" product=$product show_gallery=true product_combinations_grouped_by_color=$product_combinations_grouped_by_color add_color_variant_and_stock_message_to_alt=false}
    {assign var="discount_label" value="discount_label_`$obj_prefix``$obj_id`"}
    {$smarty.capture.$discount_label nofilter}
</div>

<div class="ty-grid-list__item-name">
    {if $item_number == "Y"}
        <span class="item-number">{$cur_number}.&nbsp;</span>
        {math equation="num + 1" num=$cur_number assign="cur_number"}
    {/if}

    {assign var="name" value="name_$obj_id"}
    {$smarty.capture.$name nofilter}
</div>

<div class="express_product_list_label_container">
{if $product.express_product != "0"}<div class="express_product_list_label cm-tooltip" title="{__('mm_product_express_label_text')}"></div>{/if}
</div>

{if $product.is_custom_made == "Y" && $product.only_by_request == "Y"}
<div class="ty-grid-list__price"><span class="ty-price-update"><span class="ty-price"><span class="ty-price-num notbold">{__("mm_functions_custom_made_by_request_price_text")}</span></span></span></div>
{else}
	<div class="ty-grid-list__price {if $product.price == 0}ty-grid-list__no-price{/if}">
	    {assign var="old_price" value="old_price_`$obj_id`"}
	    {if $smarty.capture.$old_price|trim}{$smarty.capture.$old_price nofilter}{/if}

	    {assign var="price" value="price_`$obj_id`"}
	    {$smarty.capture.$price nofilter}

	    {assign var="clean_price" value="clean_price_`$obj_id`"}
	    {$smarty.capture.$clean_price nofilter}

	    {assign var="list_discount" value="list_discount_`$obj_id`"}
	    {$smarty.capture.$list_discount nofilter}
	</div>
{/if}

{assign var="number_of_ratings_and_avg_rating" value=$obj_id|fn_mm_functions_get_number_of_ratings_and_avg_rating}
<div class="grid-list__rating">
{if $number_of_ratings_and_avg_rating}
	{include file="addons/discussion/views/discussion/components/stars.tpl" stars=$number_of_ratings_and_avg_rating.avg_rating|fn_get_discussion_rating}
	<span class="ty-grid-list__number-of-ratings">({$number_of_ratings_and_avg_rating.number_of_ratings})</span>
{/if}
</div>

<div class="ty-grid-list__control">
    {if $settings.Appearance.enable_quick_view == 'Y'}
        {include file="views/products/components/quick_view_link.tpl" quick_nav_ids=$quick_nav_ids}
    {/if}

    {if $show_add_to_cart}
        <div class="button-container">
            {assign var="add_to_cart" value="add_to_cart_`$obj_id`"}
            {$smarty.capture.$add_to_cart nofilter}
        </div>
    {/if}
</div>

{include file="addons/mm_color_codes/views/mm_color_codes/components/product_global_colors_grouped_by_color_code.tpl" product=$product product_combinations_grouped_by_color=$product_combinations_grouped_by_color}

{if $product.is_custom_made == "Y"}
<div class="product_custom_made">
	<img src="/images/CustomMadeCMYK.png" title="{__("mm_functions_custom_made_product_label")}" />
	<span>{__("mm_functions_custom_made_product_label")}</span>
</div>
{else}
<div class="product_stock">
	{if $obj_id|fn_mm_functions_product_is_sold_out}
		{__("mm_functions_sold_out_label")}
	{else}
		{assign var="total_combination_stock" value=$obj_id|fn_mm_functions_get_total_combinations_stock_of_product}
		{if $total_combination_stock > 0 && !$product.price}
			{__("mm_functions_price_by_request_label")}
		{else if $total_combination_stock > 0}
			{__("mm_functions_current_stock")}: {$total_combination_stock}
		{else}
			{__("mm_functions_soon_available")}
		{/if}
	{/if}
</div>
{/if}
