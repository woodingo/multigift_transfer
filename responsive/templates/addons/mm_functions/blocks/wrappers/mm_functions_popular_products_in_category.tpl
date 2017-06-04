
{if $content|trim && $category_data.category && $category_data.category != ""}
    {if $anchor}
    <a name="{$anchor}"></a>
    {/if}
	<div class="mainbox2-container{if isset($hide_wrapper)} cm-hidden-wrapper{/if}{if $hide_wrapper} ty-hidden{/if}{if $block.user_class} {$block.user_class}{/if}{if $content_alignment == "RIGHT"} ty-float-right{elseif $content_alignment == "LEFT"} ty-float-left{/if}">
        <h2 class="mainbox2-title clearfix"><span>{__("mm_functions_popular_products_in_category")}&nbsp;{$category_data.category|lower}</span></h2>
        <div class="ty-mainbox-body">{$content nofilter}</div>
    </div>
{/if}