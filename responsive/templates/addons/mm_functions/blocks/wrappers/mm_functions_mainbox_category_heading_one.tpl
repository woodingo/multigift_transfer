{if $content|trim}
    {if $anchor}
    <a name="{$anchor}"></a>
    {/if}
    <div class="mainbox-container clearfix{if isset($hide_wrapper)} cm-hidden-wrapper{/if}{if $hide_wrapper} hidden{/if}{if $details_page} details-page{/if}{if $block.user_class} {$block.user_class}{/if}{if $content_alignment == "RIGHT"} ty-float-right{elseif $content_alignment == "LEFT"} ty-float-left{/if}">
		{if !empty($category_data.main_pair)}
			<div id="category-heading-and-main-pair-img-container">
				<div class="category-main-pair-img-container">
				{if empty($category_data.main_pair.detailed.alt)}
					{$category_data.main_pair.detailed.alt = $page_title}
				{/if}
				{include file="common/image.tpl"
					show_detailed_link=false
					images=$category_data.main_pair
					no_ids=true
					image_id="category_image"
					image_width=$settings.Thumbnails.category_lists_thumbnail_width
					image_height=$settings.Thumbnails.category_lists_thumbnail_height 
				}
				</div>
		{/if}
        {if $title || $smarty.capture.title|trim}
            <h1 class="ty-mainbox-title">
                {hook name="wrapper:mainbox_general_title"}
                {if $smarty.capture.title|trim}
                    {$smarty.capture.title nofilter}
                {else}
                    {$title nofilter}
                {/if}
                {/hook}
            </h1>
        {/if}
		{if !empty($category_data.main_pair)}
			</div>
		{/if}
        <div class="ty-mainbox-body">{$content nofilter}</div>
    </div>
{/if}