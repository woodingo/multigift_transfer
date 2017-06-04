{hook name="orders:totals"}
	{if $order_info.payment_id}
    <tr class="ty-orders-summary__row">
        <td>{__("payment_method")}:</td>
        <td style="width: 57%" data-ct-orders-summary="summary-payment">
            {hook name="orders:totals_payment"}
                {$order_info.payment_method.payment} {if $order_info.payment_method.description}({$order_info.payment_method.description}){/if}
            {/hook}
        </td>
    </tr>
    {/if}
    
    {if $order_info.shipping}
    <tr class="ty-orders-summary__row">
        <td>{__("shipping_method")}:</td>
        <td data-ct-orders-summary="summary-ship">
        {hook name="orders:totals_shipping"}
        {if $use_shipments}
            <ul>
                {foreach from=$order_info.shipping item="shipping_method"}
                    <li>{if $shipping_method.shipping} {$shipping_method.shipping} {else} – {/if}</li>
                {/foreach}
            </ul>
        {else}
            {foreach from=$order_info.shipping item="shipping" name="f_shipp"}
                {if $shipments[$shipping.group_key].carrier && $shipments[$shipping.group_key].tracking_number}
                    {include file="common/carriers.tpl" carrier=$shipments[$shipping.group_key].carrier tracking_number=$shipments[$shipping.group_key].tracking_number}

                    {$shipping.shipping}&nbsp;({__("tracking_num")}<a {if $smarty.capture.carrier_url|strpos:"://"}target="_blank"{/if} href="{$smarty.capture.carrier_url nofilter}">{$shipments[$shipping.group_key].tracking_number}</a>)
                {else}
                    {$shipping.shipping}
                {/if}
                {if !$smarty.foreach.f_shipp.last}<br>{/if}
            {/foreach}
        {/if}
        {/hook}
        </td>
    </tr>
    <tr><td colspan="2">&nbsp;</td></tr>
	{/if}

    {assign var="negative_order_rounding_advantage" value=0}
	{foreach from=$order_info.products key=item_id item=order_item}
		{if $order_item.extra.mm_print_codes.rounding_advantage}
			{assign var="negative_order_rounding_advantage" value=$negative_order_rounding_advantage+$order_item.extra.mm_print_codes.rounding_advantage}
		{/if}
	{/foreach}
	{if $negative_order_rounding_advantage !== 0}
	<tr class="ty-orders-summary__row">
        <td>{__("mm_print_codes_price_rounding_advantage")}:&nbsp;</b></td>
        <td>{include file="common/price.tpl" value=$negative_order_rounding_advantage}&nbsp;<a class="cm-tooltip" title="{__("mm_print_codes_rounding_advantage_tooltip")}"><i class="fa fa-info-circle"></i></a></td>
    </tr>
    {/if}

    {if $order_info.display_shipping_cost|floatval}
        <tr class="ty-orders-summary__row">
            <td>{__("shipping_cost")}:&nbsp;</td>
            <td data-ct-orders-summary="summary-shipcost">{include file="common/price.tpl" value=$order_info.display_shipping_cost}</td>
        </tr>
    {/if}

    {if $order_info.discount|floatval}
    <tr class="ty-orders-summary__row">
        <td class="ty-strong">{__("including_discount")}:</td>
        <td class="ty-nowrap" data-ct-orders-summary="summary-discount">
            {include file="common/price.tpl" value=$order_info.discount}
        </td>
    </tr>
    {/if}

    {if $order_info.subtotal_discount|floatval}
        <tr class="ty-orders-summary__row">
            <td class="ty-strong">{__("order_discount")}:</td>
            <td class="ty-nowrap" data-ct-orders-summary="summary-sub-discount">
                {include file="common/price.tpl" value=$order_info.subtotal_discount}
            </td>
        </tr>
    {/if}

    {if $order_info.coupons}
        {foreach from=$order_info.coupons item="coupon" key="key"}
            <tr class="ty-orders-summary__row">
                <td class="ty-nowrap">{__("coupon")}:</td>
                <td data-ct-orders-summary="summary-coupons">{$key}</td>
            </tr>
        {/foreach}
    {/if}
	
	<tr class="ty-orders-summary__row">
        <td>{__("mm_print_codes_total_excl_tax")}:&nbsp;</td>
        <td data-ct-orders-summary="summary-subtotal">
        	{assign var="display_subtotal" value=$order_info.display_subtotal}
        	{if $order_info.display_shipping_cost|floatval}
            	{assign var="display_subtotal" value=$display_subtotal+$order_info.display_shipping_cost|floatval}
        	{/if}
        	
        	{if $negative_order_rounding_advantage !== 0}
        		{assign var="display_subtotal" value=$display_subtotal+$negative_order_rounding_advantage}
        	{/if}
        	
        	{include file="common/price.tpl" value=$display_subtotal}
        </td>
    </tr>

    {if $order_info.taxes}
        <tr class="taxes">
            <td><strong>{__("taxes")}:</strong></td>
            <td>&nbsp;</td>
        </tr>
        {foreach from=$order_info.taxes item=tax_data}
            <tr class="ty-orders-summary__row">
                <td class="ty-orders-summary__taxes-description">
                    {$tax_data.description}
                    {include file="common/modifier.tpl" mod_value=$tax_data.rate_value mod_type=$tax_data.rate_type}
                    {if $tax_data.price_includes_tax == "Y" && ($settings.Appearance.cart_prices_w_taxes != "Y" || $settings.General.tax_calculation == "subtotal")}
                        {__("included")}
                    {/if}
                    {if $tax_data.regnumber}
                        {$tax_data.regnumber})
                    {/if}
                </td>
                <td class="ty-orders-summary__taxes-description" data-ct-orders-summary="summary-tax-sub">{include file="common/price.tpl" value=$tax_data.tax_subtotal}</td>
            </tr>
        {/foreach}
    {/if}
    {if $order_info.tax_exempt == "Y"}
        <tr class="ty-orders-summary__row">
            <td>{__("tax_exempt")}</td>
            <td>&nbsp;</td>
        <tr>
    {/if}

    {if $order_info.payment_surcharge|floatval && !$take_surcharge_from_vendor}
        <tr class="ty-orders-summary__row">
            <td>{$order_info.payment_method.surcharge_title|default:__("payment_surcharge")}:&nbsp;</td>
            <td data-ct-orders-summary="summary-surchange">{include file="common/price.tpl" value=$order_info.payment_surcharge}</td>
        </tr>
    {/if}
    <tr class="ty-orders-summary__row">
        <td class="ty-orders-summary__total">{__("total")}:&nbsp;</td>
        <td class="ty-orders-summary__total" data-ct-orders-summary="summary-total">{include file="common/price.tpl" value=$order_info.total}</td>
    </tr>
{/hook}