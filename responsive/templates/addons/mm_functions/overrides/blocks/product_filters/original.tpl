{** block-description:original **}

<div id="product_filters_{$block.block_id}">
{if $items && !$smarty.request.advanced_filter}

<div class="product_filters_description">
	{assign var="filter_block_title_category_name" value=__("mm_functions_filter_block_default_category_name")}
	{if !empty($category_data.category)}
		{assign var="all_featured_category_ids_with_children" value=""|fn_mm_functions_get_featured_category_ids_with_all_children_ids}
		{assign var="on_featured_category_page" value=!empty($category_data.category_id) && $category_data.category_id|in_array:$all_featured_category_ids_with_children}
		{if $on_featured_category_page == false}
			{assign var="filter_block_title_category_name" value=$category_data.category}
		{/if}
	{else}
	{/if}
	
	{__("mm_functions_filter_block_title", ['[category_name]'=> {$filter_block_title_category_name|lower}])}
	
</div>

{if $smarty.server.QUERY_STRING|strpos:"dispatch=" !== false}
    {assign var="curl" value=$config.current_url}
    {assign var="filter_qstring" value=$curl|fn_query_remove:"result_ids":"full_render":"filter_id":"view_all":"req_range_id":"advanced_filter":"features_hash":"subcats":"page"}
{else}
    {assign var="filter_qstring" value="products.search"}
{/if}

{assign var="reset_qstring" value="products.search"}

{if $smarty.request.category_id && $settings.General.show_products_from_subcategories == "Y"}
    {assign var="filter_qstring" value=$filter_qstring|fn_link_attach:"subcats=Y"}
    {assign var="reset_qstring" value=$reset_qstring|fn_link_attach:"subcats=Y"}
{/if}

{assign var="allow_ajax" value=true}
{assign var="ajax_div_ids" value="product_filters_*,products_search_*,category_products_*,product_features_*,breadcrumbs_*,currencies_*,languages_*"}

{assign var="has_selected" value=false}
{foreach from=$items item="filter" name="filters"}
    {if $filter.slider || $filter.selected_ranges || $filter.ranges}
        {assign var="filter_uid" value="`$block.block_id`_`$filter.filter_id`"}
        {assign var="cookie_name_show_filter" value="content_`$filter_uid`"}
        {if $filter.display == "N"}
            {* default behaviour of cm-combination *}
            {assign var="collapse" value=true}
            {if $smarty.cookies.$cookie_name_show_filter}
                {assign var="collapse" value=false}
            {/if}
        {else}
            {* reverse behaviour of cm-combination *}
            {assign var="collapse" value=false}
            {if $smarty.cookies.$cookie_name_show_filter}
                {assign var="collapse" value=true}
            {/if}
        {/if}

        <div id="sw_content_{$filter_uid}" class="ty-product-filters__wrapper {* Edit by mashmedia: Remove expanding/collapsing *}{* cm-combination-filter_{$filter_uid}*}{if !$collapse} open{/if} cm-save-state {if $filter.display == "Y"}cm-ss-reverse{/if}">
            <div class="ty-product-filters__switch">
                <i class="ty-product-filters__switch-down ty-icon-down-open"></i>
                <i class="ty-product-filters__switch-right ty-icon-up-open"></i>
            </div>

            {if $filter.slider}
                {include file="blocks/product_filters/components/product_filter_slider.tpl" filter_uid=$filter_uid id="slider_`$filter_uid`" filter=$filter ajax_div_ids=$ajax_div_ids dynamic=true filter_qstring=$filter_qstring reset_qstring=$reset_qstring allow_ajax=$allow_ajax}
            {else}
                {include file="blocks/product_filters/components/product_filter_variants.tpl" filter_uid=$filter_uid filter=$filter ajax_div_ids=$ajax_div_ids collapse=$collapse filter_qstring=$filter_qstring reset_qstring=$reset_qstring allow_ajax=$allow_ajax}
            {/if}
        </div>
    {/if}
{/foreach}

{*<div class="ty-product-filters__tools clearfix">
    <a {if "FILTER_CUSTOM_ADVANCED"|defined}href="{"products.search?advanced_filter=Y"|fn_url}"{else}href="{$filter_qstring|fn_link_attach:"advanced_filter=Y"|fn_url}"{/if} rel="nofollow" class="ty-product-filters__advanced-button">{__("advanced")}</a>
    {if $smarty.capture.has_selected}
    <a href="{if $smarty.request.category_id}{assign var="use_ajax" value=true}{"categories.view?category_id=`$smarty.request.category_id`"|fn_url}{else}{assign var="use_ajax" value=false}{""|fn_url}{/if}" rel="nofollow" class="ty-product-filters__reset-button{if $allow_ajax && $use_ajax} cm-ajax cm-ajax-full-render cm-history" data-ca-scroll=".cm-pagination-container" data-ca-target-id="{$ajax_div_ids}{/if}"><i class="ty-product-filters__reset-icon ty-icon-cw"></i> {__("reset")}</a>
    {/if}
</div>*}

{/if}
<!--product_filters_{$block.block_id}--></div>