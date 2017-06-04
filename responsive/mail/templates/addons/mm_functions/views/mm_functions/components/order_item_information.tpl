{if $cart_item_extra}
	{assign var="product_options_inventory_row" value=$cart_item_extra.mm_print_codes.options_inventory_row}
	{assign var="supplier_company_id" value=$cart_item_extra.mm_print_codes.supplier_company_id}
	{assign var="product_id" value=$cart_item_extra.mm_print_codes.product_id}
	{assign var="print_code_id" value=$cart_item_extra.mm_print_codes.print_code_id}
	{assign var="number_of_colors" value=$cart_item_extra.mm_print_codes.number_of_colors}
	{assign var="quantity" value=$cart_item_extra.mm_print_codes.quantity}
	{assign var="color_code" value=$cart_item_extra.mm_print_codes.color_code}
	{assign var="artwork_option_id" value=$cart_item_extra.mm_print_codes.artwork_option_id}
	{assign var="order_id" value=0}
	{if !empty($order_info.order_id)}
		{assign var="order_id" value=$order_info.order_id}
	{elseif !empty($smarty.request.order_id)}
		{assign var="order_id" value=$smarty.request.order_id}
	{/if}
	
	<table class="order_item_information" border="0" style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">
		<tbody>
		{if $product_options_inventory_row}
		<tr>
			<td style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">{__("sku")}:</td>
			<td style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">{$product_options_inventory_row.product_code}</td>
		</tr>
		{/if}
		
		{if $color_code}
		<tr>
			<td style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">{__("mm_functions_option_name_color")}:</td>
			<td style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">{$supplier_company_id|fn_mm_color_codes_get_color_code_translation:$color_code}</td>
		</tr>
		{/if}
		
		{if $cart_item_extra.mm_print_codes.size_division}
		<tr>
			<td style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">{__("mm_functions_option_name_size")}:</td>
			<td style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">{foreach from=$cart_item_extra.mm_print_codes.size_division key=size item=amount name=name}
					{$size}: {$amount}<br />
				{/foreach}
			</td>
		</tr>
		{/if}
		
		{if $order_id && $cart_item_extra.custom_files.$artwork_option_id.0.file}
		<tr>
			<td style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">{__("mm_functions_option_name_artwork")}:</td>
			<td style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">
				{assign var="uploaded_artwork_image_url" value="artwork.download&order_id={$order_id}&file={$cart_item_extra.custom_files.$artwork_option_id.0.file}&filename={$cart_item_extra.custom_files.$artwork_option_id.0.name}"|fn_url:'C'}
				<a href="{$uploaded_artwork_image_url}">{__("mm_functions_click_here_to_download_artwork")}</a>
		</tr>
		{elseif !$order_id && $cart_item_extra.custom_files.$artwork_option_id.0.file}
		<tr>
			<td style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">{__("mm_functions_option_name_artwork")}{$order_id}:</td>
			<td style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">
				{assign var="uploaded_artwork_image" value=$cart_item_extra.custom_files.$artwork_option_id.0}
				<a href="{$uploaded_artwork_image.detailed|fn_url:'C'}">{__("mm_functions_click_here_to_download_artwork")}</a>
			</td>
		</tr>
		{/if}
		
		{if $print_code_id && $number_of_colors && $quantity}
			{if $order_info.lang_code}{assign var="lang_code" value=$order_info.lang_code}{else}{assign var="lang_code" value=$smarty.const.CART_LANGUAGE}{/if}
			{assign var="print_lang_var" value=$print_code_id|fn_mm_print_codes_get_print_type_lang_value:$number_of_colors:$quantity:0.00:$lang_code}
			{assign var="print_lang_var_exploded_on_colon" value=": "|explode:$print_lang_var}
		<tr>
			<td style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">{$print_lang_var_exploded_on_colon.0}:</td>
			<td style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">{$print_lang_var_exploded_on_colon.1}</td>
		</tr>
		{else}
		<tr>
			<td colspan="2" style="background-color: #ffffff; font-size: 12px; font-family: Arial;vertical-align: top;">{__("mm_functions_order_item_information_no_printing")}</td>
		</tr>
		{/if}
		</tbody>
	</table>
{/if}