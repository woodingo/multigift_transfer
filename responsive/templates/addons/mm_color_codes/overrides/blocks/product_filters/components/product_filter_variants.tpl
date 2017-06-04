{if $filter.selected_ranges}
<div class="ty-product-filters-selected-text hidden-phone">{__("mm_color_codes_selected_filters")}:</div>
{/if}
<ul class="ty-product-filters {if $collapse}hidden{/if} hidden-phone" id="content_{$filter_uid}">
    {* Selected variants *}
    {foreach from=$filter.selected_ranges name="selected_ranges" item="selected_range"}
        {capture name="has_selected"}Y{/capture}
        <li class="{$filter_item_class}{if $feature_is_color_feature} filter-color-image-item{/if}">
            {strip}
                {assign var="fh" value=$smarty.request.features_hash|fn_delete_range_from_url:$selected_range:$filter.field_type}
                {if $fh}
                    {assign var="attach_query" value="features_hash=`$fh`"}
                {/if}
                {if $filter.feature_type == "E" && $selected_range.range_id == $smarty.request.variant_id}
                    {assign var="reset_lnk" value=$reset_qstring}
                {else}
                    {assign var="reset_lnk" value=$filter_qstring}
                {/if}
                {if $fh}
                    {assign var="href" value=$reset_lnk|fn_link_attach:$attach_query|fn_url}
                {else}
                    {assign var="href" value=$reset_lnk|fn_url}
                {/if}
                {assign var="use_ajax" value=$href|fn_compare_dispatch:$config.current_url}
            	
                <a href="{$href}" class="ty-product-filters__item checked{if $allow_ajax && $use_ajax} cm-ajax cm-ajax-full-render cm-history"{/if} data-ca-scroll=".cm-pagination-container" data-ca-target-id="{$ajax_div_ids}" rel="nofollow" title="{$range.range_name}">
                	<span class="ty-filter-icon"><i class="ty-icon-ok ty-filter-icon__check"></i><i class="ty-icon-cancel ty-filter-icon__delete"></i></span>
                	{$filter.prefix}{$selected_range.range_name|fn_text_placeholders}{$filter.suffix}
                </a>
            {/strip}
        </li>
    {/foreach}

    {* Variants before the more link *}
    {if $filter.ranges|fn_is_not_empty}
        <li class="ty-product-filters__item-more">
            <ul id="ranges_{$filter_uid}">

                {foreach from=$filter.ranges item="range"}
                    {include file="blocks/product_filters/components/variant_item.tpl" range=$range filter=$filter ajax_div_ids=$ajax_div_ids filter_qstring=$filter_qstring reset_qstring=$reset_qstring allow_ajax=$allow_ajax}
                {/foreach}

            </ul>
        </li>
    {/if}


    {* View all link *}
    {capture name="view_all"}
        {if $filter.more_cut}
            {capture name="q"}{$filter_qstring nofilter}&filter_id={$filter.filter_id}&{if $smarty.request.features_hash}&features_hash={$smarty.request.features_hash}{/if}{/capture}
            <li class="ty-product-filters__group" id="view_all_{$filter_uid}">
                {assign var="capture_q" value=$smarty.capture.q|escape:url}
                <a href="{"product_features.view_all?q=`$capture_q`"|fn_url}" rel="nofollow" class="ty-product-filters__extra-link ty-extra-link">{__("view_all")}</a>
            </li>
        {/if}
    {/capture}

    {* Variants under the more link *}
    {if $filter.more_ranges|fn_is_not_empty}
        {assign var="cookie_name_show_more" value="more_ranges_`$filter_uid`"}
        {assign var="more_collapse" value=true}
        {if $smarty.cookies.$cookie_name_show_more}
            {assign var="more_collapse" value=false}
        {/if}

        <li>
            <ul id="more_ranges_{$filter_uid}" {if $more_collapse}class="hidden"{/if}>

                {foreach from=$filter.more_ranges item="range"}
                    {include file="blocks/product_filters/components/variant_item.tpl" range=$range filter=$filter ajax_div_ids=$ajax_div_ids filter_qstring=$filter_qstring reset_qstring=$reset_qstring allow_ajax=$allow_ajax}
                {/foreach}

                {$smarty.capture.view_all nofilter}

            </ul>
        </li>

        <li class="ty-product-filters__extra-block">
            <a id="on_more_ranges_{$filter_uid}" class="ty-product-filters__extra-link ty-extra-link cm-save-state cm-combination-more_{$filter_uid}{if !$more_collapse} hidden{/if}">{__("more")}</a>
            <a id="off_more_ranges_{$filter_uid}" class="ty-product-filters__extra-link ty-extra-link cm-save-state cm-combination-more_{$filter_uid}{if $more_collapse} hidden{/if}">{__("less")}</a>
        </li>
    {else}
        {$smarty.capture.view_all nofilter}
    {/if}
</ul>
{if $filter.selected_ranges && $config.current_url}
	{assign var="current_non_seo_url_without_feature_param" value=$config.current_url|fn_query_remove:"result_ids":"full_render":"filter_id":"view_all":"req_range_id":"advanced_filter":"features_hash":"subcats":"page"}
	{if $current_non_seo_url_without_feature_param}
		{assign var="current_url_without_feature_param" value=$current_non_seo_url_without_feature_param|fn_url}
		{if $current_url_without_feature_param}
		<div class="ty-product-filters__reset_filter hidden-phone">
			<a href="{$current_url_without_feature_param}" title="{__("mm_color_codes_reset_filters")}" target="_self">{__("mm_color_codes_reset_filters")}</a>
		</div>
		{/if}
	{/if}
{/if}