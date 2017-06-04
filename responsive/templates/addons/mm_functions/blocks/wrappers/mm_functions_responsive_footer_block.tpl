{if $content|trim}
    {if $anchor}
    <a name="{$anchor}"></a>
    {/if}
    
    <div class="mainbox-container clearfix{if isset($hide_wrapper)} cm-hidden-wrapper{/if}{if $hide_wrapper} hidden{/if}{if $details_page} details-page{/if}{if $block.user_class} {$block.user_class}{/if}">
        {if $title || $smarty.capture.title|trim}
            <p id="sw_footer_menu_{$block.block_id}" class="ty-footer-menu__header cm-combination"><span>
                {hook name="wrapper:mainbox_general_title"}
                {if $smarty.capture.title|trim}
                    {$smarty.capture.title nofilter}
                {else}
                    {$title nofilter}
                {/if}
                {/hook}
                </span>
            <i class="ty-footer-menu__icon-open ty-icon-down-open"></i><i class="ty-footer-menu__icon-hide ty-icon-up-open"></i></p>
        {/if}
        <div id="footer_menu_{$block.block_id}" class="ty-mainbox-body ty-footer-menu__items">{$content nofilter}</div>
    </div>
{/if}