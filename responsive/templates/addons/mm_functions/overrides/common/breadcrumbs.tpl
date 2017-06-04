<div id="breadcrumbs_{$block.block_id}">

{if $breadcrumbs && $breadcrumbs|@sizeof > 1}
    <div class="ty-breadcrumbs clearfix">
    	{assign var="breadcrumbs_with_link" value=0}
        {strip}
            {foreach from=$breadcrumbs item="bc" name="bcn" key="key"}
	                {if $key != "0"}
	                    <span class="ty-breadcrumbs__slash">/</span>
	                {/if}
	                {if $bc.link}
	                	{$breadcrumbs_with_link = $breadcrumbs_with_link + 1}
	                	<span {if $key > 0}itemprop="child" {/if}itemscope itemtype="http://data-vocabulary.org/Breadcrumb">
	                    	<a href="{$bc.link|fn_url}" class="ty-breadcrumbs__a{if $additional_class} {$additional_class}{/if}"{if $bc.nofollow} rel="nofollow"{/if} itemprop="url">
	                    		<span itemprop="title">{$bc.title|strip_tags|escape:"html" nofilter}</span>
	                    	</a>
	                {else}
	                	{if $breadcrumbs_with_link > 0}
		                	{for $i=1 to $breadcrumbs_with_link}
		                		</span>
							{/for}
	                	{/if}
	                    <span class="ty-breadcrumbs__current">{$bc.title|strip_tags|escape:"html" nofilter}</span>
	                {/if}
            {/foreach}
            {include file="common/view_tools.tpl"}
        {/strip}
    </div>
{/if}
<!--breadcrumbs_{$block.block_id}--></div>