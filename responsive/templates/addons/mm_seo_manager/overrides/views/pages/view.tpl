<div class="ty-wysiwyg-content">
    {hook name="pages:page_content"}
    {$page.description nofilter}
    {/hook}
    {capture name="mainbox_title"}
    	{if $page.heading_overrule != ""}
    		{$page.heading_overrule|fn_mm_seo_manager_get_pattern_with_replaced_tags:$page}
    	{else}
			{$page.page|fn_mm_seo_manager_get_pattern_with_replaced_tags:$page}
    	{/if}
    {/capture}
    
</div>
    
{hook name="pages:page_extra"}
{/hook}