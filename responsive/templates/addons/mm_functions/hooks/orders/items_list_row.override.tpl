{hook name="orders:items_list_row"}
    {if !$product.extra.parent}
        <tr class="ty-valign-top">
            <td>
                {if $product.is_accessible}<a href="{"products.view?product_id=`$product.product_id`"|fn_url}">{/if}
                    {$product.product nofilter}
                {if $product.is_accessible}</a>{/if}

                {if $product.extra.is_edp == "Y"}
                    <div class="ty-right"><a href="{"orders.order_downloads?order_id=`$order_info.order_id`"|fn_url}">[{__("download")}]</a></div>
                {/if}
                {* Edit by mashmedia: Is handled in order_item_information.tpl *}
                {* {if $product.product_code}
                    <div class="ty-orders-detail__table-code">{__("sku")}:&nbsp;{$product.product_code}</div>
                {/if} *}
                {hook name="orders:product_info"}
                	{* Edit by mashmedia *}
                   	{* {if $product.product_options}{include file="common/options_info.tpl" product_options=$product.product_options inline_option=true}{/if} *}
                   	{if $product.extra.mm_print_codes}
						{include file="addons/mm_functions/views/mm_functions/components/order_item_information.tpl" cart_item_extra=$product.extra}
                    {/if}
                {/hook}
            </td>
            <td class="ty-right">
                {if $product.extra.exclude_from_calculate}{__("free")}{else}{include file="common/price.tpl" value=$product.original_price}{/if}
            </td>
            <td class="ty-center">&nbsp;{$product.amount}</td>
            {if $order_info.use_discount}
                <td class="ty-right">
                    {if $product.extra.discount|floatval}{include file="common/price.tpl" value=$product.extra.discount}{else}-{/if}
                </td>
            {/if}
            {if $order_info.taxes && $settings.General.tax_calculation != "subtotal"}
                <td class="ty-center">
                    {if $product.tax_value|floatval}{include file="common/price.tpl" value=$product.tax_value}{else}-{/if}
                </td>
            {/if}
            <td class="ty-right">
                 &nbsp;{if $product.extra.exclude_from_calculate}{__("free")}{else}{include file="common/price.tpl" value=$product.display_subtotal}
                 {if $product.extra.mm_print_codes.rounding_advantage && $product.extra.mm_print_codes.rounding_advantage < 0}
			    	<br />
			    	{include file="common/price.tpl" value=$product.extra.mm_print_codes.rounding_advantage}
			    {/if}
                 {/if}
             </td>
        </tr>
    {/if}
{/hook}