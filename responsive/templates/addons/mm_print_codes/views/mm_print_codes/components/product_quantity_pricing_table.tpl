{assign var="product_print_types_with_two_or_more_colors_are_present" value=false}

{if !$table_style}{assign var="table_style" value="width:100%;font-size:10px;"}{/if}
{if !$left_top_cell_style}{assign var="left_top_cell_style" value="width:180px;text-align:left;"}{/if}
{if !$th_style}{assign var="th_style" value="font-weight:bold;text-align:center;"}{/if}
{if !$tr_style}{assign var="tr_style" value="height:23px;"}{/if}
{if !$td_price_cell}{assign var="td_price_cell" value="width:80px;text-align:center;font-size:"}{/if}

<table id="product-quantity-pricing-table" cellpadding="{if $cellpadding}{$cellpadding}{else}0{/if}" cellspacing="{if $cellspacing}{$cellspacing}{else}0{/if}" border="{if $border}{$border}{else}0{/if}"{if $table_style} style="{$table_style}"{/if}>
	<thead>
		<th class="product-quantity-pricing-table-left-top-cell" style="{if $th_style}{$th_style}{/if}{if $left_top_cell_style}{$left_top_cell_style}{/if}"></th>
		{foreach from=$product_pricing_quantities_with_at_least_one_price item=product_pricing_quantity name=product_pricing_quantities}
			{if $smarty.foreach.product_pricing_quantities.iteration <= 5}
		<th{if $th_style} style="{$th_style}"{/if}>{$product_pricing_quantity}</th>
			{/if}
		{/foreach}
	</thead>
	<tbody>
		{foreach from=$product_print_types_and_final_quantity_pricings item=print_type_quantity_pricings name=product_printing_types_and_final_quantity_pricings}
		{if $print_type_quantity_pricings.number_of_colors > 2}
			{assign var="product_print_types_with_two_or_more_colors_are_present" value=true}
			{if $show_expand_and_collapse_buttons}
				{assign var="product_print_type_expand_collapse_row_class" value="more_than_two_colors_row"}
			{else}
				{assign var="product_print_type_expand_collapse_row_class" value=""}
			{/if}
		{else}
			{assign var="product_print_type_expand_collapse_row_class" value=""}
		{/if}
		<tr class="{$product_print_type_expand_collapse_row_class}"{if $tr_style} style="{$tr_style}"{/if}>
			<td{if $include_data_attributes} data-print-code-id="{$print_type_quantity_pricings.print_code_id}" data-number-of-colors="{$print_type_quantity_pricings.number_of_colors}"{/if} class="product-quantity-pricing-table-print-type-cell">{$print_type_quantity_pricings.print_code_id|fn_mm_print_codes_get_print_type_lang_value:$print_type_quantity_pricings.number_of_colors}<br />
			{foreach from=$product_pricing_quantities_with_at_least_one_price item=quantity_with_at_least_one_price name=product_pricing_quantities_with_at_least_one_price}
			{if $smarty.foreach.product_pricing_quantities_with_at_least_one_price.iteration <= 5}
				<td class="product-quantity-pricing-table-price-cell{if $print_type_quantity_pricings.quantities.$quantity_with_at_least_one_price} is-clickable{/if}"{if $td_price_cell} style="{$td_price_cell}"{/if}>
				{if $print_type_quantity_pricings.quantities.$quantity_with_at_least_one_price}
					{include file="common/price.tpl" value=$print_type_quantity_pricings.quantities.$quantity_with_at_least_one_price}
				{else}
					-
				{/if}
				</td>
			{/if}
			{/foreach}
		</tr>
		{/foreach}
	</tbody>
</table>
{if $show_notes}<span class="notes">{__("mm_print_codes_product_quantity_pricing_table_notes")}</span>{/if}
{if $show_expand_and_collapse_buttons && $product_print_types_with_two_or_more_colors_are_present}
	<a class="print-types-table-expander-collapser-button print-types-table-expander-button cm-tooltip" title="{__("mm_print_codes_print_types_table_expander_button_tooltip_collapsed")}"><i class="ty-icon-down-micro"></i></a>
	<a class="print-types-table-expander-collapser-button print-types-table-collapser-button cm-tooltip" title="{__("mm_print_codes_print_types_table_expander_button_tooltip_expanded")}" style="display: none;"><i class="ty-icon-up-micro"></i></a>
{/if}