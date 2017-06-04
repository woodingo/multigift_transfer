{hook name="orders:items_list_row"}
	{if !$oi.extra.parent}
	<tr>
	    <td style="padding: 5px 10px; background-color: #ffffff; font-size: 12px; font-family: Arial;">
	        <a href="{"products.view&product_id={$oi.product_id}"|fn_url}" target="_blank" title="{$oi.product}">{$oi.product|default:__("deleted_product") nofilter}</a>
	        
	        {hook name="orders:product_info"}
	        {* Edit by mashmedia: Is handled in order_item_information.tpl *}
	        {* {if $oi.product_code}<p style="margin: 2px 0px 3px 0px;">{__("sku")}: {$oi.product_code}</p>{/if} *}
	        {/hook}
	        
	        {* Edit by mashmedia *}
           	{* {if $oi.product_options}<br/>{include file="common/options_info.tpl" product_options=$oi.product_options}{/if} *}
           	
           	{if $oi.extra}
           	<div style="padding-top: 5px;">
				{include file="addons/mm_functions/views/mm_functions/components/order_item_information.tpl" cart_item_extra=$oi.extra}
			</div>
            {/if}
	    </td>
	    <td style="padding: 5px 10px; background-color: #ffffff; text-align: center; font-size: 12px; font-family: Arial;">{$oi.amount}</td>
	    <td style="padding: 5px 10px; background-color: #ffffff; text-align: right; font-size: 12px; font-family: Arial;">{if $oi.extra.exclude_from_calculate}{__("free")}{else}{include file="common/price.tpl" value=$oi.original_price}{/if}</td>
	    {if $order_info.use_discount}
	    <td style="padding: 5px 10px; background-color: #ffffff; text-align: right; font-size: 12px; font-family: Arial;">{if $oi.extra.discount|floatval}{include file="common/price.tpl" value=$oi.extra.discount}{else}&nbsp;-&nbsp;{/if}</td>
	    {/if}
	    {if $order_info.taxes && $settings.General.tax_calculation != "subtotal"}
	        <td style="padding: 5px 10px; background-color: #ffffff; text-align: right; font-size: 12px; font-family: Arial;">{if $oi.tax_value}{include file="common/price.tpl" value=$oi.tax_value}{else}&nbsp;-&nbsp;{/if}</td>
	    {/if}
	
	    <td style="padding: 5px 10px; background-color: #ffffff; text-align: right; white-space: nowrap; font-size: 12px; font-family: Arial;"><b>{if $oi.extra.exclude_from_calculate}{__("free")}{else}{include file="common/price.tpl" value=$oi.display_subtotal}{/if}
	    	{if $oi.extra.mm_print_codes.rounding_advantage && $oi.extra.mm_print_codes.rounding_advantage < 0}
		    	<br />
		    	{include file="common/price.tpl" value=$oi.extra.mm_print_codes.rounding_advantage}
		    {/if}
	    	</b>&nbsp;</td>
	</tr>
	    {/if}
{/hook}