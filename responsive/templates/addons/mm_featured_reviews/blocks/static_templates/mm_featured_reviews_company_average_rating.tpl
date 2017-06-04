{** block-description:mm_featured_reviews_company_average_rating **}
{if empty($mm_featured_reviews_display_inline) || $mm_featured_reviews_display_inline !== true}
	{assign var="mm_featured_reviews_display_inline" value=false}
{else}
	{assign var="mm_featured_reviews_display_inline" value=true}
{/if}
{assign var="mm_featured_reviews_static_data" value=$runtime.company_id|fn_mm_featured_reviews_get_static_data}

{if $mm_featured_reviews_static_data.number_of_ratings > 0}
{if $mm_featured_reviews_display_inline == false}<div id="mm_featured_reviews_company_average_rating">
	{assign var="company_featured_reviews_page_url" value=$runtime.company_id|fn_mm_featured_reviews_get_featured_reviews_page_url}
	<a {if $company_featured_reviews_page_url}href="{$company_featured_reviews_page_url}" title="{__("mm_featured_reviews_view_more_text")}"{else}href="#"{/if}>{/if}
		{include file="addons/discussion/views/discussion/components/stars.tpl" stars=$mm_featured_reviews_static_data.average_rating|fn_get_discussion_rating}
		<span>{if $mm_featured_reviews_display_inline == true}({/if}{$mm_featured_reviews_static_data.number_of_ratings}</span>
		<span>{__("mm_featured_reviews_reviews")|lower}{if $mm_featured_reviews_display_inline == true}){/if}</span>
	{if $mm_featured_reviews_display_inline == false}</a>
</div>{/if}
{/if}