{if !$cart.products.$key.extra.parent}
    <li class="ty-order-products__item">
    	{* Add by mashmedia, fetch extra data by combination hash *}
    	{assign var="product_cart_id" value=$product.combination_hash}
    	
        <a href="{"products.view?product_id=`$product.product_id`"|fn_url}" class="ty-order-products__a">{$product.product nofilter}</a>
        {if !$product.exclude_from_calculate}
            {include file="buttons/button.tpl" but_href="checkout.delete?cart_id=`$key`&redirect_mode=`$runtime.mode`" but_meta="ty-order-products__item-delete delete" but_target_id="cart_status*" but_role="delete" but_name="delete_cart_item"}
        {/if}
        <div class="ty-order-products__price">
			{__("mm_functions_x_products", ["[amount]" => $cart.products.$product_cart_id.extra.mm_print_codes.quantity])}
            
            {* Edit by mashmedia: Don't show price *}
            {* &nbsp;x&nbsp;{include file="common/price.tpl" value=$product.display_price} *}
        </div>
        
        {* Edit by mashmedia: Show options *}
        {* {include file="common/options_info.tpl" product_options=$product.product_options no_block=true} *}
        
        {* Add by mashmedia: Additional info *}
        {if $cart.products.$product_cart_id.extra}
			{include file="addons/mm_functions/views/mm_functions/components/order_item_information.tpl" cart_item_extra=$cart.products.$product_cart_id.extra}
        {/if}
		
		{assign var="product_url_with_cart_id" value="products.view?product_id=`$product.product_id`&cid=`$product_cart_id`"|fn_url}
		<a class="clearfix" href="{$product_url_with_cart_id}">{__("mm_print_codes_change_options")}</a>
        
        {hook name="block_checkout:product_extra"}{/hook}
    </li>
{/if}