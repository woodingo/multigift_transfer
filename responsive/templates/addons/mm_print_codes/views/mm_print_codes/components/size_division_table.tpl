{* Add by mashmedia, fetch extra print info by cart item id for filling in form *}

{if $cart_item_id_to_fill_form_by != "" && $smarty.session.cart.products.$cart_item_id_to_fill_form_by}
	{assign var="fill_form_by_cart_item_id_from_url" value=true}
	{assign var="cart_item_extra_data" value=$smarty.session.cart.products.$cart_item_id_to_fill_form_by.extra.mm_print_codes}
	{assign var="cart_item_quantity_is_different" value=!$cart_item_extra_data.quantity|in_array:$product_pricing_quantities_with_at_least_one_price}
{else}
	{assign var="fill_form_by_cart_item_id_from_url" value=false}
	{assign var="cart_item_quantity_is_different" value=false}
{/if}


<span class="span4"><label for="product-invoice-option-{$size_option_id}">{__("mm_print_codes_in_which")} {__("mm_functions_option_name_size")|lower}?</label></span>
<span class="span8">
	<div class="product-invoice-size-option-division-container">
		<table id="product-invoice-size-option-division-table">
			<thead>
				<tr>
					<th>{__("mm_functions_option_name_size")}</th>
					<th>{__("mm_print_codes_size_division_desired_amount")}</th>
					<th>{__("mm_print_codes_size_division_available_amount")}</th>
					<th><span class="incoming_stock">{__("mm_print_codes_size_division_incoming_amount")}</span></th>
					<th><span class="incoming_stock">{__("mm_print_codes_size_division_incoming_amount_date")}</span></th>
				</tr>
			</thead>
			<tbody>
				{foreach from=$product_size_combinations item=variant}
				{assign var="size_combination" value="{$variant['size_combination']}"}
				<tr>
					<td>{$variant.size_variant_name}</td>
					<td><input type="text" name="product_invoice_size_{$size_combination}" class="product-invoice-input product-invoice-input-size-amount product_invoice_size_{$size_combination} cm-value-integer" 
					value="{if $fill_form_by_cart_item_id_from_url && $cart_item_extra_data.size_division.{$variant.size_variant_name}}{$cart_item_extra_data.size_division.{$variant.size_variant_name}}{else}0{/if}" maxlength="4" /></td>
					<td><span class="product_invoice_size_current_stock_{$size_combination}">0</span></td>
					<td><span class="incoming_stock product_invoice_size_incoming_stock_{$size_combination}">-</span></td>
					<td><span class="incoming_stock product_invoice_size_incoming_stock_date_{$size_combination}">-</span></td>
				</tr>
				{/foreach}
			</tbody>
			<tfoot>
				<tr>
					<td>{__("mm_print_codes_size_division_total_divided")}</td>
					<td><span id="product_invoice_size_total_divided">0</span></td>
					<td colspan="3"><span id="product_invoice_size_division_corresponding_text">{__("mm_print_codes_size_division_total_does_not_correspond")}</span></td>
				</tr>
			</tfoot>
		</table>
		<div id="product-invoice-size-division-notification"></div>
	</div>
</span>