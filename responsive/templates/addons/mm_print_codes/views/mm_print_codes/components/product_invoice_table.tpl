<table id="mm_print_codes_product_invoice" class="{if $show_minimal_invoice}minimal-invoice{/if}{if $table_class}{if $show_minimal_invoice} {/if}{$table_class}{/if}" style="width: 100%;{if $show_minimal_invoice}display:block;{/if}" border="0">
	<tbody>
		<tr>
			<td>{__("quantity")}:</td>
			<td class="product-invoice-final-quantity">{$product_invoice_quantity}</td>
		</tr>
		<tr>
			<td>{__("mm_print_codes_article")}:</td>
			<td>{$product_name}</td>
		</tr>
		<tr>
			<td>{__("sku")}:</td>
			<td>{$product_invoice_combination_code}</td>
		</tr>
		
		{foreach from=$selected_product_option_names_and_variant_names key=option_name item=variant_name}
		<tr>
			<td>{$option_name}:</td>
			<td>{if $variant_name != ""}{$variant_name}{else}<span class="red-text-value">{__("mm_print_codes_choose_a")} {$option_name|strtolower}</span>{/if}</td>
		</tr>
		{/foreach}
		<tr>
			<td>{__("mm_print_codes_type_print")}:</td>
			<td>{$product_invoice_print}</td>
		</tr>
		{if $show_dividers}
			<tr class="product-invoice-divider-row"><td colspan="2" style="vertical-align: middle;padding-top:5px;padding-bottom:15px;"><hr style="border-color: #ccc;"/></td></tr>
		{/if}
		{if !$show_minimal_invoice}
			<tr>
				<td>{__("mm_print_codes_piece_price")}:</td>
				<td>{include file="common/price.tpl" class="price_part" span_id="stuksprijs" value=$product_invoice_piece_price}</td>
			</tr>
			
			{if $product_invoice_total_price != $product_invoice_total_excl_tax}
			<tr>
				<td>{__("mm_print_codes_total_price")}:</td>
				<td>{include file="common/price.tpl" class="price_part" span_id="subtotaal_prijs" value=$product_invoice_total_price}</td>
			</tr>
			{/if}
			{if $product_invoice_rounding_advantage}
			<tr>
				<td>{__("mm_print_codes_price_rounding_advantage")}:</td>
				<td>{include file="common/price.tpl" class="price_part" span_id="afrondingsvoordeel" value=$product_invoice_rounding_advantage} {if $show_tooltips}&nbsp;<a class="cm-tooltip" title="{__("mm_print_codes_rounding_advantage_tooltip")}"><i class="fa fa-info-circle"></i></a>{/if}</td>
			</tr>
			{/if}
			{if $product_invoice_startup_configuration_costs}
			<tr>
				<td>{__("mm_print_codes_startup_configuration_costs")}:</td>
				<td style="color:green;">{$product_invoice_startup_configuration_costs}</td>
			</tr>
			{/if}
			<tr>
				<td>{__("mm_print_codes_shipping_costs")}&nbsp;{__("mm_print_codes_shipping_costs_to")}{if $country_code}&nbsp;{$country_code|upper}&nbsp;{if $country_name}<a title="{$country_name}" class="cm-tooltip">{/if}<i class="ty-flag ty-flag-{$country_code|lower}"></i>{if $country_name}</a>{/if}{/if}{if $show_shipping_estimate_button}&nbsp;<i class="icon-flight"></i>(<a id="opener_shipping_estimation_block" class="cm-dialog-opener cm-dialog-auto-size shipping-edit-link" data-ca-target-id="shipping_estimation_block" href="{$current_url}" rel="nofollow"><span>{__("change")}</span></a>){/if}:</td>
				<td style="{if $free_shipping}color:green;{/if}">
					{if $free_shipping}{__("mm_print_codes_free_shipping")}{else}{$product_invoice_shipping_costs nofilter}{/if}
					{if $show_tooltips}&nbsp;<a class="cm-tooltip" title="{$shipping_costs_tooltip_text}"><i class="fa fa-info-circle"></i></a>{/if}</td>
			</tr>
			{if $show_dividers}
			<tr class="product-invoice-divider-row"><td colspan="2" style="vertical-align: middle;padding-top:5px;padding-bottom:15px;"><hr style="border-color: #ccc;"/></td></tr>
			{/if}
		{/if}
		
		{assign var="is_medium_order_amount" value=$product_invoice_total_excl_tax|fn_mm_print_codes_is_medium_order_amount}
		{assign var="is_large_order_amount" value=$product_invoice_total_excl_tax|fn_mm_print_codes_is_large_order_amount}
		
		{assign var="product_invoice_total_incl_tax" value=$product_invoice_total_excl_tax*1.21}
		<tr class="product-invoice-totals-row">
			<td>{__("mm_print_codes_total_excl_tax")}:</td>
			<td>{if $is_large_order_amount}<strike>{/if}{include file="common/price.tpl" span_id="totaalprijs_exclusief_btw" class="price_part" value=$product_invoice_total_excl_tax}{if $show_tooltips && $is_medium_order_amount}<a class="cm-tooltip" title="{__('mm_print_codes_medium_order_notification', ['[product_name]' => $product_name|lower])}"><i class="fa fa-info-circle"></i></a>{/if}{if $is_large_order_amount}</strike>{/if}</td>
		</tr>
		
		{if $show_minimal_invoice}
		{assign var="product_invoice_total_tax" value=$product_invoice_total_incl_tax-$product_invoice_total_excl_tax}
		<tr class="product-invoice-totals-row">
			<td>{__("mm_print_codes_total_tax")}:</td>
			<td>{include file="common/price.tpl" class="price_part" span_id="btw_prijs" value=$product_invoice_total_tax}</td>
		</tr>
		<tr class="product-invoice-totals-row{if $show_minimal_invoice} minimal-invoice-totals-row{/if}">
			<td>{__("mm_print_codes_total_incl_tax")}:</td>
			<td>{include file="common/price.tpl" class="price_part" span_id="totaalprijs_inclusief_btw" value=$product_invoice_total_incl_tax}</td>
		</tr>
		{/if}
		
		{if $is_large_order_amount}
		<tr>
			<td colspan="2">
				{if empty($product_id)}
					{assign var="product_id" value=0}
				{/if}
				{$product_id|fn_mm_print_codes_get_large_order_amount_message nofilter}
			</td>
		</tr>
		{/if}
		{if $show_buttons}
		<tr class="product-invoice-divider-row"><td colspan="2" style="vertical-align: middle;padding-top:10px;padding-bottom:25px;"><hr style="border-color:#ccc;margin-bottom:2px;"/><hr style="border-color: #ccc;margin:0;"/></td></tr>
		<tr>
			<td class="product-price-calculations-additional-buttons">
				<a id="product-invoice-email-invoice-button" class="cm-tooltip cm-dialog-opener cm-dialog-auto-size" title="{__("mm_print_codes_email_invoice_tooltip")}" data-ca-target-id="product-invoice-email-invoice-popup"><i class="fa fa-envelope-o"></i></a>
				<div class="product-options hidden" id="product-invoice-email-invoice-popup" title="{__("mm_print_codes_invoice_email_for_product", ['[product]' => $product_name|lower])}">
					<p class="product-invoice-email-invoice-popup-text-above">{__("mm_print_codes_invoice_email_form_text_above", ['[product]' => $product_name|lower])}</p>
					<p>
						<input id="product-invoice-email-send-invoice-input" type="text" placeholder="{__("mm_print_codes_invoice_your_email_address")}" class="cm-required cm-email" />
						{include file="buttons/button.tpl" but_role="text" but_text="{__("send")}" but_icon="fa fa-chevron-right" but_id="product-invoice-email-send-invoice-button" but_meta="ty-btn__primary" but_onclick="fn_mm_print_codes_email_pdf_invoice();"}
					</p>
					<p class="product-invoice-email-invoice-popup-text-below notes">{__("mm_print_codes_invoice_email_form_text_below")}</p>
				</div>
				
				<a id="product-invoice-print-pdf-invoice-button" class="cm-tooltip" title="{__("mm_print_codes_print_invoice_tooltip")}" onclick="return fn_mm_print_codes_print_pdf_invoice();"><i class="fa fa-print"></i></a>
			</td>
			<td class="product-price-calculations-order-buttons">{include file="buttons/add_to_cart.tpl" but_id="button_add_to_cart" but_name="dispatch[mm_print_codes.add_to_cart]" but_target="product_invoice_form" but_role=$but_role block_width=$block_width obj_id=$obj_id product=$product but_meta=$add_to_cart_meta}</td>
		</tr>
		{/if}
	</tbody>
</table>
{if $include_google_rich_snippets && !empty($product)}
	<div itemprop="offers" itemscope="" itemtype="http://schema.org/Offer">
		{assign var="total_combination_stock" value=$product.product_id|fn_mm_functions_get_total_combinations_stock_of_product}
		{if !empty($total_combination_stock) || !empty($product.is_custom_made) && $product.is_custom_made == "Y"}
		<link itemprop="availability" href="http://schema.org/InStock" />
		{else}
		<link itemprop="availability" href="http://schema.org/OutOfStock" />
		{/if}
		<meta itemprop="priceCurrency" content="{$currencies[$smarty.const.CART_PRIMARY_CURRENCY].currency_code}" />
		{if $show_minimal_invoice}
			{math equation="(x / y) / z" x=$product_invoice_total_incl_tax y=1.21 z=$product_invoice_quantity assign="mm_print_codes_invoice_minimal_invoice_product_price" format="%.4f"}
			<meta itemprop="price" content="{$mm_print_codes_invoice_minimal_invoice_product_price}" />									
		{else}
		<meta itemprop="price" content="{$product.price|fn_format_price:$primary_currency}" />									
		{/if}
		<meta itemprop="itemCondition" itemtype="http://schema.org/OfferItemCondition" content="http://schema.org/NewCondition"/>
	</div>
{/if}