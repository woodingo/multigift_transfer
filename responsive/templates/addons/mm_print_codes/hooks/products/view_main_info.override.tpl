{hook name="products:view_main_info"}
{if $product}
	{* Edit by mashmedia: mm_seo_manager_google_rich_snippets *}
	<div itemscope itemtype="http://schema.org/Product">
	{hook name="products:seo_snippet_attributes"}
	{/hook}

	{script src="js/tygh/fileuploader_scripts.js"}
	{script src="js/addons/mm_functions/product.js"}
	{script src="js/addons/mm_print_codes/product.js"}
    {assign var="obj_id" value=$product.product_id}
    {include file="common/product_data.tpl" product=$product separate_buttons=$separate_buttons|default:true but_role="big" but_text=__("add_to_cart")}

	{assign var="total_combination_stock" value=$obj_id|fn_mm_functions_get_total_combinations_stock_of_product}

    {""|fn_mm_print_codes_print_additional_product_info_if_ip_is_in_cluster}

    {assign var="is_price_by_request_product" value=false}
	{assign var="product_code" value=$product.product_id|fn_get_product_code}
    {assign var="is_custom_made_product" value=$product.is_custom_made=="Y"}
	{assign var="custom_made_only_by_request" value=$product.only_by_request=="Y"}
	{assign var="is_only_available_printed" value=$product.is_only_available_printed=="Y"}
    {if $is_custom_made_product}
    	{assign var="is_sold_out_product" value=false}
    {else}
    	{assign var="is_sold_out_product" value=$product.product_id|fn_mm_functions_product_is_sold_out}
    {/if}
    {if $is_sold_out_product == false && $total_combination_stock > 0 && !$product.price}
    	{assign var="is_price_by_request_product" value=true}
    {/if}

	{assign var="show_minimal_invoice" value=!empty($smarty.request.track_gsid) && $smarty.request.track_gsid == $product_code}
    <div class="ty-product-block__img-wrapper">
    	{if $product.while_supplies_last == "Y"}<div class="while_supplies_last_label"></div>
		{else if $product.express_product != "0"}<div class="express_product_label"></div>{/if}

        {hook name="products:image_wrap"}
            {if !$no_images}
                <div class="ty-product-block__img cm-reload-{$product.product_id}" id="product_images_{$product.product_id}_update">

                    {assign var="discount_label" value="discount_label_`$obj_prefix``$obj_id`"}
                    {$smarty.capture.$discount_label nofilter}

					{* Edit by mashmedia: mm_seo_manager_google_rich_snippets *}
                    {include file="views/products/components/product_images.tpl" product=$product show_detailed_link="Y" image_width=$settings.Thumbnails.product_details_thumbnail_width image_height=$settings.Thumbnails.product_details_thumbnail_height add_google_rich_snippets=true}
                <!--product_images_{$product.product_id}_update--></div>
            {/if}
        {/hook}
    </div>

    {assign var="product_print_types_and_final_quantity_pricings_params" value=['product_id'=>$product.product_id]}
    {assign var="product_print_types_and_final_quantity_pricings" value=$product_print_types_and_final_quantity_pricings_params|fn_mm_print_codes_get_product_print_types_and_quantity_pricings}
    {assign var="product_pricing_quantities_with_at_least_one_price" value=$product_print_types_and_final_quantity_pricings|fn_mm_print_codes_get_quantities_with_at_least_one_price_from_product_printing_type_lang_var_and_quantity_pricings}
    {if $is_custom_made_product}
    	{assign var="show_expand_and_collapse_buttons_in_quantity_pricing_table" value=false}
    {else}
    	{assign var="show_expand_and_collapse_buttons_in_quantity_pricing_table" value=true}
    {/if}

    {* Add by mashmedia, fetch extra print info by cart item id for filling in form *}
	{* Code also used in addons/mm_print_codes/views/mm_print_codes/components/size_division_table.tpl *}
	{assign var="cart_item_id_to_fill_form_by" value=$smarty.get.cid}
	{if $smarty.get.cid != "" && $smarty.session.cart.products.$cart_item_id_to_fill_form_by}
		{assign var="fill_form_by_cart_item_id_from_url" value=true}
		{assign var="cart_item_extra_data" value=$smarty.session.cart.products.$cart_item_id_to_fill_form_by.extra.mm_print_codes}
		{assign var="cart_item_quantity_is_different" value=!$cart_item_extra_data.quantity|in_array:$product_pricing_quantities_with_at_least_one_price}
	{else}
		{assign var="fill_form_by_cart_item_id_from_url" value=false}
		{assign var="cart_item_quantity_is_different" value=false}
	{/if}

	{assign var="number_of_product_print_types" value=$product_print_types_and_final_quantity_pricings|count}
	{assign var="number_of_product_print_types_with_colors" value=0}
	{if $number_of_product_print_types|count>0}
		{foreach from=$product_print_types_and_final_quantity_pricings item=product_print_type_and_final_quantity_pricings}
			{if !empty($product_print_type_and_final_quantity_pricings.number_of_colors)}
				{$number_of_product_print_types_with_colors = $number_of_product_print_types_with_colors + 1}
			{/if}
		{/foreach}
		{assign var="product_is_printable" value=$number_of_product_print_types_with_colors>0}
	{else}
		{assign var="product_is_printable" value=false}
	{/if}

    <div class="ty-product-block__left">
    	{hook name="products:main_info_title"}
            {if !$hide_title}
                <h1 class="ty-product-block-title" itemprop="name">{$product.product nofilter}</h1>
            {/if}

            {hook name="products:brand"}
                <div class="brand">
                    {include file="views/products/components/product_features_short_list.tpl" features=$product.header_features}
                </div>
            {/hook}
        {/hook}

		{* Add by mashmedia: if statement *}
		{if $product.promo_text != ""}
        <div class="ty-product-block__note" itemprop="description">
            {$product.promo_text nofilter}
        </div>
		{/if}

		{* Add by mashmedia: full description *}
        {if $product.full_description != ""}
        <div class="ty-product-block__description"{if empty($product.promo_text)} itemprop="description"{/if}>
        	{$product.full_description nofilter}
        </div>
        {/if}

    	{assign var="description_discussion_suffix_messages_params" value=['product_id'=>$product.product_id]}
    	{assign var="description_discussion_suffix_messages" value=$description_discussion_suffix_messages_params|fn_mm_functions_get_description_discussion_suffix_messages}
    	{if !empty($description_discussion_suffix_messages)}
		<div id="description_discussion_suffix">
			<a class="description_discussion_suffix_messages_toggler description_discussion_suffix_messages_toggler_collapsed">
	    		<h2>{__("mm_functions_product_description_discussion_suffix_heading", ['[product_name]'=>$product.product|lower])}
					{assign var="mm_functions_product_description_discussion_suffix_messages_expander_button_text" value=__("mm_functions_product_description_discussion_suffix_messages_expander_button")}
					{assign var="mm_functions_product_description_discussion_suffix_messages_collapser_button_text" value=__("mm_functions_product_description_discussion_suffix_messages_collapser_button")}

	    			<i class="ty-icon-down-micro cm-tooltip" title="{$mm_functions_product_description_discussion_suffix_messages_expander_button_text}"></i>
	    			<i class="ty-icon-up-micro cm-tooltip" title="{$mm_functions_product_description_discussion_suffix_messages_collapser_button_text}"></i>
	    		</h2>
    		</a>
    		<div class="description_discussion_suffix_messages">
    		{foreach from=$description_discussion_suffix_messages item=description_discussion_suffix_message}
    		<p><i class="fa fa-quote-left"></i>{$description_discussion_suffix_message|truncate:700:"..." nofilter}<i class="fa fa-quote-right"></i></p>
			{/foreach}
			</div>
    	</div>
		{/if}

		<table id="product-main-info-table">
			<tbody>
				<tr>
					<td class="product_main_info_label_cell">{__("sku")}:</td>
					<td itemprop="sku">{$product_code}</td>
				</tr>

			{assign var="product_main_category_name" value=$product.main_category|fn_get_category_name}
			{if empty($product_main_category_name)}
				{assign var="product_main_category_name" value=""}
			{/if}

			{assign var="product_main_category_url" value=""}
			{if $product.main_category}
				{assign var="product_main_category_url" value="categories.view&category_id={$product.main_category}"|fn_url}
			{/if}

			{* Add by mashmedia: Main product info *}
			{if $is_sold_out_product == false}
			{* Available colors *}
			{assign var="product_combinations_grouped_by_color_params" value=['product_id'=>$product.product_id,'get_combination'=>true,'get_color_variant_and_stock'=>true, 'get_incoming_stock_amount'=>true, 'get_incoming_stock_amount_date'=>true, 'product_data'=>$product]}
			{assign var="product_combinations_grouped_by_color" value=$product_combinations_grouped_by_color_params|fn_mm_functions_get_product_combinations_grouped_by_color}
			{if $product_combinations_grouped_by_color.color_variants}

			{assign var="product_option_variants_stock_text" value=$product.product_id|fn_mm_functions_get_product_option_variants_stock_text}
			{if $product_option_variants_stock_text != ""}
			<tr>
				<td class="product_main_info_label_cell">{__("mm_functions_current_stock")}:</td>
				<td>{$product_option_variants_stock_text}</td>
			</tr>
			{/if}

			{assign var="number_of_available_product_colors" value=$product_combinations_grouped_by_color.color_variants|count}
			<tr class="product_main_info_available_colors_row">
				<td class="product_main_info_label_cell">{__("mm_color_codes_available_colors")}:</td>
				<td>

					{foreach from=$product_combinations_grouped_by_color.color_variants key=option_variant_name item=option_variant name=product_available_colors}
						{assign var="product_available_color_title" value=""}
						{if $option_variant.color_variant_and_stock_message != ""}
							{assign var="product_available_color_title" value=$option_variant.color_variant_and_stock_message}
						{/if}
						{if $option_variant.incoming_stock_amount_and_date_message != ""}
							{assign var="product_available_color_title" value="`$product_available_color_title` `$option_variant.incoming_stock_amount_and_date_message`"}
						{/if}

						<a data-product-option-combination="{$option_variant.combination}"{if $product_available_color_title != ""} title="{$product_available_color_title}" class="cm-tooltip"{/if}>{if $smarty.foreach.product_available_colors.iteration == 1}{$option_variant_name}{else}{$option_variant_name|lower}{/if}</a>{if $smarty.foreach.product_available_colors.iteration < $number_of_available_product_colors}, {/if}
					{/foreach}
				</td>
			</tr>
			{/if}

			{if $product.is_custom_made == "Y" && $product.custom_made_only_by_request == "Y"}
				<tr>
					<td class="product_main_info_label_cell">{__("mm_print_codes_dimensions")}:</td>
					<td>{__("mm_functions_custom_made_by_request_price_dimensions_text")}</td>
				</tr>
			{else}
				{assign var="main_product_unprinted_dimensions_text" value=$product|fn_mm_print_codes_get_product_features_dimensions_text}
				{if $main_product_unprinted_dimensions_text}
					{if $main_product_unprinted_dimensions_text != ""}
					<tr>
						<td class="product_main_info_label_cell">{__("mm_print_codes_dimensions")}:</td>
						<td>{$main_product_unprinted_dimensions_text}</td>
					</tr>
					{/if}
				{/if}
			{/if}

			{assign var="main_product_print_dimensions_text" value=$product.product_id|fn_mm_print_codes_get_product_link_dimensions_text}
			{if $main_product_print_dimensions_text}
				{if $main_product_print_dimensions_text != ""}
				<tr>
					<td class="product_main_info_label_cell">{__("mm_print_codes_print_dimensions")}:</td>
					<td>{$main_product_print_dimensions_text}</td>
				</tr>
				{/if}
			{/if}

			{assign var="product_unprinted_printed_delivery_time" value=$product|fn_mm_print_codes_get_product_unprinted_printed_delivery_time_text}
			{if $product_unprinted_printed_delivery_time != ""}
			<tr>
				<td class="product_main_info_label_cell">{__("mm_print_codes_delivery_time")}:</td>
				<td>{$product_unprinted_printed_delivery_time}<a title="{if $is_custom_made_product == true && $custom_made_only_by_request == true}{__('mm_custom_made_by_request_product_levertijd_extra_text')}{else}{__('mm_product_levertijd_extra_text')}{/if}" class="levertijd-info cm-tooltip"><i class="fa fa-info-circle"></i></a></td>
			</tr>
			{/if}
			{/if}

        	{if !empty($breadcrumbs) && $runtime.company_id !== 38}
        		{assign var="mm_seo_manager_view_more_like_array" value=$breadcrumbs|fn_mm_seo_manager_get_view_more_like_breadcrumbs_array_from_breadcrumbs}
				{if !empty($mm_seo_manager_view_more_like_array)}
	        	<tr>
					<td class="product_main_info_label_cell">{__("mm_seo_manager_products_view_more_label")}:</td>
					<td>
						{foreach from=$mm_seo_manager_view_more_like_array item=current_view_more_like_item name=mm_seo_manager_view_more_like_foreach}
							<a href="{$current_view_more_like_item.link}" title="{$current_view_more_like_item.link_title}">{$current_view_more_like_item.title}</a>{if $smarty.foreach.mm_seo_manager_view_more_like_foreach.iteration < $mm_seo_manager_view_more_like_array|count}, {/if}
						{/foreach}
					</td>
				</tr>
				{/if}
			{/if}
			{if $product.express_product != 0}
			<tr>
				<td class="product_main_info_label_cell express_product_list_label_container" colspan="2">
				{if $product.express_product != "0"}<div class="express_product_list_label cm-tooltip" title="{__('mm_product_express_label_text')}"></div> {__('mm_product_express_detail_text')}{/if}
				</td>
			</tr>

			{/if}
			</tbody>
		</table>

		{if $is_sold_out_product == true}
		<div id="product-notification-message" class="is-sold-out-product"><i class="fa fa-info-circle"></i><span>{__("mm_functions_product_is_sold_out_message", ['[product]'=>$product.product,'[product_lc]'=>$product.product|lower,'[category]'=>"<a href='{$product_main_category_url}' title='{$product_main_category_name}'>{$product_main_category_name|lower}</a>"])}</span></div>
		{elseif $is_price_by_request_product == true}
		<div id="product-notification-message" class="is-price-by-request-product"><i class="fa fa-info-circle"></i><span>{__("mm_functions_product_price_by_request_message", ['[product]'=>$product.product|lower])}</span></div>
		{elseif $is_custom_made_product == true && $custom_made_only_by_request == true}
		<div id="product-notification-message" class="is-custom-made-by-request-product"><i class="fa fa-info-circle"></i><span>{__("mm_functions_product_is_custom_made_price_by_request_message", ['[product]'=>$product.product|lower, '[product_delivery_time]'=>$product_unprinted_printed_delivery_time])}</span></div>
		<a id="product-custom-made-by-request-invoice-btn" class="ty-btn ty-btn__primary" rel="nofollow">{__("mm_functions_request_invoice_btn")} <i class="fa fa-chevron-right"></i></a>
		{elseif $product_is_printable == false}
		<div id="product-notification-message" class="product-is-not-printable"><i class="fa fa-info-circle"></i><span>{__("mm_print_codes_no_printing_methods_available_message", ['[product]'=>$product.product])}</span></div>
		{/if}

        {if $show_product_tabs}
        {include file="views/tabs/components/product_popup_tabs.tpl"}
        {$smarty.capture.popupsbox_content nofilter}
        {/if}

        {if $is_sold_out_product == false && $is_price_by_request_product == false && $show_minimal_invoice == false && $custom_made_only_by_request == false}
        	{assign var="product_quantity_pricing_table_params" value=['product_id'=>$product.product_id,'product_print_types_and_final_quantity_pricings'=>$product_print_types_and_final_quantity_pricings,'product_pricing_quantities_with_at_least_one_price' => $product_pricing_quantities_with_at_least_one_price,'show_notes'=>true, 'show_expand_and_collapse_buttons'=>$show_expand_and_collapse_buttons_in_quantity_pricing_table,'include_data_attributes'=>true,'table_style'=>'width:100%;margin-top: 40px;margin-bottom: 2px;', 'td_price_cell' => 'width:65px;text-align:center;']}
			{$product_quantity_pricing_table_params|fn_mm_print_codes_get_product_quantity_pricing_table nofilter}
        {/if}
    </div>

	{if $custom_made_only_by_request == false}
	    <div class="row">
	    	<div class="span12">
	    		{if $is_sold_out_product == false && $is_price_by_request_product == false}
	    		{assign var="product_pricing_quantities_with_at_least_one_price_merged_with_static" value=$product_pricing_quantities_with_at_least_one_price|fn_mm_print_codes_merge_product_pricing_quantities_with_static_product_pricing_quantities}

	            <form id="product-price-calculation-form" class="cm-disable-empty-files cm-processed-form" enctype="multipart/form-data" name="product_invoice_form" method="post" action="{"mm_print_codes.add_to_cart"|fn_url}">
				    <div class="row product-price-calculation">
				    	<div class="span12 product-price-calculation-input-fields">
				    		<input type="hidden" name="product_invoice_product_id" value="{$product.product_id}" />
				    		{if !empty($smarty.request.cid)}<input type="hidden" name="cart_item_id" value="{$smarty.request.cid}" />{/if}

				    		<div class="row product-invoice-quantity-row">
								<span class="span4"><label for="product-invoice-quantity">{__("mm_print_codes_how_many_units_would_you_like_to_order")}</label></span>
								<span class="span8">
									<select name="product_invoice_quantity" id="product-invoice-quantity" class="product-invoice-input">
										<option value="">{__("mm_print_codes_choose_a_quantity")}</option>
										{assign var="product_pricing_quantity_selectbox_first_option_value" value=0}
										{foreach from=$product_pricing_quantities_with_at_least_one_price_merged_with_static item=product_quantity name=product_pricing_quantity_select_options_foreach}
										 	{if $smarty.foreach.product_pricing_quantity_select_options_foreach.iteration == 1 && $show_minimal_invoice == true}{$product_pricing_quantity_selectbox_first_option_value = $product_quantity}{/if}<option value="{$product_quantity}"{if $fill_form_by_cart_item_id_from_url && $cart_item_quantity_is_different == false && $cart_item_extra_data.quantity == $product_quantity || $smarty.foreach.product_pricing_quantity_select_options_foreach.iteration == 1 && $show_minimal_invoice == true} selected="selected"{/if}>{$product_quantity}</option>
										{/foreach}
										<option {if $fill_form_by_cart_item_id_from_url && $cart_item_quantity_is_different}value="{$cart_item_extra_data.quantity}" selected="selected"{else}value="0"{/if}>{__("mm_print_codes_enter_a_different_quantity")}</option>
									</select>
									<div id="product-invoice-quantity-notification"></div>
								</span>
							</div>

							<div class="row product-invoice-different-quantity-row" style="{if $fill_form_by_cart_item_id_from_url && $cart_item_quantity_is_different}display:block;{else}display:none;{/if}">
								<span class="span4"><label for="product-invoice-different-quantity">{__("mm_print_codes_enter_the_desired_quantity")}</label></span>
								<span class="span8">
									<input type="text" id="product-invoice-different-quantity" class="cm-value-integer" name="product-invoice-different-quantity" value="{if $fill_form_by_cart_item_id_from_url && $cart_item_quantity_is_different && $show_minimal_invoice == false}{$cart_item_extra_data.quantity}{/if}" maxlength="6" />
								</span>
							</div>

							{assign var="product_option_ids_with_selected_variant_ids" value=[]}
							{assign var="product_option_and_variant_ids_with_their_stock_amount" value=$product.product_id|fn_mm_functions_get_product_option_and_variant_ids_with_their_stock_amount}
							{assign var="color_option_id" value=$product.product_id|fn_mm_color_codes_get_color_option_id_by_product_id}
							{assign var="size_option_id" value=$product.product_id|fn_mm_functions_get_size_option_id_by_product_id}
							{assign var="artwork_option_id" value=$product.product_id|fn_mm_print_codes_get_product_artwork_option_id}

							{if $color_option_id && $product.product_options.$color_option_id}
								{assign var="color_option" value=$product.product_options.$color_option_id}
								{assign var="number_of_product_option_variants" value=$color_option.variants|count}
								<div class="row"{if $number_of_product_option_variants == 1} style="display:none;"{/if}>
				    				<span class="span4"><label for="product-invoice-option-{$color_option_id}">{__("mm_print_codes_in_which")} {__("mm_functions_option_name_color")|lower}?</label></span>
				    				<span class="span8">
				    					<select name="product_invoice_option_{$color_option_id}" id="product-invoice-option-{$color_option_id}" class="product-invoice-input product-invoice-input-color">
				    						<option value="">{__("mm_print_codes_choose_a")} {__("mm_functions_option_name_color")|lower}</option>
							    			{foreach from=$color_option.variants key=variant_id item=variant name=product_color_select_options_foreach}
								    			{assign var="to_replace" value=['[color]', '[amount]']}

								    			{if $number_of_product_option_variants == 1}
								    				{assign var="to_replace_with" value=[__("mm_functions_as_shown"), $product_option_and_variant_ids_with_their_stock_amount.$color_option_id.$variant_id]}
								    			{else}
								    				{assign var="to_replace_with" value=[$variant.variant_name, $product_option_and_variant_ids_with_their_stock_amount.$color_option_id.$variant_id]}
								    			{/if}

								    			<option value="{$color_option.option_id}_{$variant_id}"{if $fill_form_by_cart_item_id_from_url && $cart_item_extra_data.product_options.$color_option_id == $variant_id || $number_of_product_option_variants == 1 ||  $smarty.foreach.product_color_select_options_foreach.iteration == 1 && $show_minimal_invoice == true}{$product_option_ids_with_selected_variant_ids[{$color_option_id}] = $variant_id} selected="selected"{/if}>{__("mm_print_codes_color_with_stock")|replace:$to_replace:$to_replace_with}</option>
											{/foreach}
										</select>
									</span>
								</div>
							{/if}


							{if $size_option_id && $product.product_options.$size_option_id}
								{assign var="size_option" value=$product.product_options.{$size_option_id}}
								{assign var="number_of_product_option_variants" value=$size_option.variants|count}

								<div class="row product-invoice-size-division-row" style="{if !$fill_form_by_cart_item_id_from_url || ($fill_form_by_cart_item_id_from_url && !$cart_item_extra_data.size_division)}display: none;{/if}">
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
					    							{foreach from=$size_option.variants key=variant_id item=variant}
					    							{assign var="size_combination" value="{$size_option_id}_{$variant_id}"}
					    							<tr>
					    								<td>{$variant.variant_name}</td>
					    								<td><input type="text" name="product_invoice_size_{$size_combination}" class="product-invoice-input product-invoice-input-size-amount product_invoice_size_{$size_combination} cm-value-integer" value="{if $fill_form_by_cart_item_id_from_url && $cart_item_extra_data.size_division.{$variant.variant_name}}{$cart_item_extra_data.size_division.{$variant.variant_name}}{$product_option_ids_with_selected_variant_ids[{$size_option_id}] = $variant_id}{else}0{/if}" maxlength="4" /></td>
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
								</div>
							{/if}

							{if $product_is_printable}
								{assign var="cart_item_is_printed" value=$fill_form_by_cart_item_id_from_url && $cart_item_extra_data.print_code_id > 0}

								<div class="row product-invoice-printed-row"{if $is_custom_made_product || $is_only_available_printed} style="display:none;"{/if}>
									<span class="span4"><label for="product_invoice_printed_yes">{__("mm_print_codes_would_you_like_the_products_to_be_printed")}</label></span>
									<span class="span8">
										<div class="product-invoice-printed-radio-button-container">
											<input type="radio" name="product_invoice_printed" id="product_invoice_printed_yes" class="span1 product-invoice-input" value="Y"{if $cart_item_is_printed == true || $is_custom_made_product || $number_of_product_print_types == $number_of_product_print_types_with_colors || $is_only_available_printed} checked="checked"{/if}/><label for="product_invoice_printed_yes">{__("mm_print_codes_yes")}</label>
											<input type="radio" name="product_invoice_printed" id="product_invoice_printed_no" class="product-invoice-input" value="N"{if $is_only_available_printed == false && ($cart_item_is_printed == false && $is_custom_made_product == false || $number_of_product_print_types !== $number_of_product_print_types_with_colors && $cart_item_is_printed == false || $show_minimal_invoice == true)} checked="checked"{/if}/> <label for="product_invoice_printed_no">{__("mm_print_codes_no")}</label>
										</div>
									</span>
								</div>

					    		<div class="product-invoice-print-rows">
						    		{assign var="cart_item_print_code_id_and_number_of_colors" value=""}
						    		{if $cart_item_is_printed == true && !empty($cart_item_extra_data.number_of_colors)}
						    			{assign var="cart_item_print_code_id_and_number_of_colors" value="{$cart_item_extra_data.print_code_id}_{$cart_item_extra_data.number_of_colors}"}
						    		{/if}
									<div class="row product-invoice-print-row"{if $is_custom_made_product && $number_of_product_print_types_with_colors <= 1} style="display:none;"{/if}>
										<span class="span4"><label for="product-invoice-print">{__("mm_print_codes_how_would_you_like_the_products_to_be_printed")}</label></span>
										<span class="span8">
											<select name="product_invoice_print" id="product-invoice-print" class="product-invoice-input">
												<option value="">{__("mm_print_codes_choose_a")} {__("mm_print_codes_type_print")|strtolower}</option>
												{foreach from=$product_print_types_and_final_quantity_pricings key=print_code_id_and_number_of_colors item=product_print_type_info}
													{assign var="product_print_number_of_colors_lang_var" value=""}
													{if !empty($product_print_type_info.number_of_colors)}
														{assign var="product_print_number_of_colors_lang_var" value=$product_print_type_info.number_of_colors|fn_mm_print_codes_get_lang_var_by_number_of_colors}
														<option value="{$print_code_id_and_number_of_colors}"{if $print_code_id_and_number_of_colors == $cart_item_print_code_id_and_number_of_colors} selected="selected"{/if}>
															{$print_code_id_and_number_of_colors|fn_mm_print_codes_get_print_type_lang_value:$product_print_type_info.number_of_colors}
														</option>
													{/if}
												{/foreach}
											</select>
										</span>
									</div>

									{if $artwork_option_id && $product.product_options.$artwork_option_id}
										{assign var="artwork_option" value=$product.product_options.$artwork_option_id}
										<div class="row product-invoice-print-file-row">
											<span class="span4"><label for="product-invoice-print-file">{__("mm_print_codes_upload_print_file")}</label></span>
											<span class="span8">
												{assign var="name" value="product_data"}
												{assign var="artwork_image_array_in_cart" value=$smarty.session.cart.products.$cart_item_id_to_fill_form_by.extra}
												{include file="common/fileuploader.tpl" id=$cart_item_id_to_fill_form_by po=$artwork_option images=$artwork_image_array_in_cart.custom_files[$artwork_option.option_id] var_name="`$name`[`$artwork_option.option_id``$obj_id`]" multiupload=$artwork_option.multiupload hidden_name="`$name`[custom_files][`$artwork_option.option_id``$obj_id`]" hidden_value="`$obj_id`_`$artwork_option.option_id`" label_id="option_`$obj_prefix``$obj_id`_`$artwork_option.option_id`" prefix=$obj_prefix}
												<span class="notes">{__("mm_print_codes_artwork_file_notes", ["[max_filesize]" => $artwork_option.max_file_size/1000, "[allowed_file_extensions]" => $artwork_option.allowed_extensions])}</span><br />
												<span class="notes">{__("mm_print_codes_artwork_additional_notes")}</span>
											</span>
										</div>
									{/if}
								</div>
							{/if}
				    	</div>

					    <div class="row">
						    <div class="product-invoices-expandable-information-container"{if $show_minimal_invoice == true} style="display: block;"{/if}>
						    	<h2>{__("mm_print_codes_your_invoice")}</h2>
								{if $show_minimal_invoice == true}
									{assign var="minimal_product_invoice_table_params" value=[
									'product_id' => $product.product_id,
									'selected_product_option_ids_and_variant_ids' => $product_option_ids_with_selected_variant_ids,
									'quantity' => $product_pricing_quantity_selectbox_first_option_value,
									'show_dividers' => true,
									'show_buttons' => true,
									'show_tooltips' => true,
									'show_shipping_estimate_button' => true,
									'include_google_rich_snippets' => true,
									'product' => $product,
									'show_minimal_invoice' => $show_minimal_invoice]}
									{$minimal_product_invoice_table_params|fn_mm_print_codes_get_product_invoice_table nofilter}
								{else}
									{include file="addons/mm_print_codes/views/mm_print_codes/components/product_invoice_table.tpl" product=$product include_google_rich_snippets=true product_options=$product.product_options show_buttons=true include_tooltips=true include_shipping_estimate_button=true}
								{/if}
						    </div>
					    </div>
				    </div>
			    </form>
			    {/if}
			</div>
		</div>
	{/if}
{/if}
</div>
{/hook}
