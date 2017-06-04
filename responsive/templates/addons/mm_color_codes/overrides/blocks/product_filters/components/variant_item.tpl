	{assign var="feature_is_color_feature" value=$range.feature_id|fn_mm_color_codes_feature_id_is_color_feature_id}
	{* Add by mashmedia *}
    {assign var="show_default_feature_name" value=true}
    {if $feature_is_color_feature}
		{assign var="global_color_params" value=['name'=>$range.range_name, 'limit' => 1]}
		{assign var="global_color" value=$global_color_params|fn_mm_color_codes_get_global_colors}
	
		{assign var="global_color_is_image" value=false}
		{assign var="global_color_is_hex" value=false}
		{assign var="global_color_css_style_background" value=""}
		{if $global_color.image_pair.icon.http_image_path != ""}
			{assign var="global_color_is_image" value=true}
			{assign var="global_color_css_style_background" value="background-image: url('{$global_color.image_pair.icon.image_path}');"}
		{elseif $global_color.color_hex != ""}
			{assign var="global_color_is_hex" value=true}
			{assign var="global_color_css_style_background" value="background-color: #{$global_color.color_hex};"}
		{/if}
		
		{if $global_color_is_image || $global_color_is_hex}
			{assign var="show_default_feature_name" value=false}
		
			<li class="{$filter_item_class}{if $feature_is_color_feature} filter-color-image-item{/if}">
			    {if !$range.checked}
			        {assign var="filter_query_elm" value=$smarty.request.features_hash|fn_add_range_to_url_hash:$range:$filter.field_type}
			    {else}
			        {assign var="filter_query_elm" value=$smarty.request.features_hash|fn_delete_range_from_url:$range:$filter.field_type}
			    {/if}
			    {if $smarty.request.features_hash}
			        {assign var="cur_features_hash" value="&features_hash=`$smarty.request.features_hash`"}
			    {/if}
			    {if $filter.feature_type == "E" && (!$filter.simple_link || $filter.selected_ranges && $controller == "product_features")}
			        {assign var="href" value="product_features.view?variant_id=`$range.range_id``$cur_features_hash`"|fn_url}
			    {else}
			        {assign var="href" value=$filter_qstring|fn_link_attach:"features_hash=`$filter_query_elm`"|fn_url}
			    {/if}
			    {assign var="use_ajax" value=$href|fn_compare_dispatch:$config.current_url}
			    
			    <a {if !$range.disabled || $range.checked}href="{$href}"{/if} {if $filter.feature_type != "E"}rel="nofollow"{/if} 
			    class="{if $feature_is_color_feature}filter-color-image-container cm-tooltip {if $global_color_is_image}filter-image {elseif $global_color_is_hex}filter-color {/if}{/if}ty-product-filters__item{if $range.checked} checked{/if}{if $range.disabled} disabled{elseif $allow_ajax && $use_ajax} cm-ajax cm-ajax-full-render cm-history{/if}" data-ca-scroll=".cm-pagination-container" data-ca-target-id="{$ajax_div_ids}" title="{if $feature_is_color_feature}{$global_color.name}{else}{$range.range_name}{/if}" 
			    style="{$global_color_css_style_background}">
				    	<span class="ty-filter-icon">
				    		<i class="ty-icon-ok ty-filter-icon__check"></i>
				    		<i class="ty-icon-cancel ty-filter-icon__delete"></i>
				    	</span>
				    {if $show_default_feature_name}
				    	{$filter.prefix}{$range.range_name|fn_text_placeholders}{$filter.suffix}&nbsp;{if !$range.disabled}<span class="ty-product-filters__count">&nbsp;({$range.products})</span>{/if}
			    	{/if}
			    </a>
			</li>
		{/if}
	{/if}