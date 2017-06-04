{** block-description:mm_featured_reviews_featured_product_reviews **}
<div id="mm_featured_reviews_featured_product_reviews">
	{if $block.properties.limit && $block.properties.limit != "" && $block.properties.limit != "0"}
		{assign var="limit" value=$block.properties.limit}
	{else}
		{* Disable AJAX, does not work for some reason *}
		{$config.tweaks.disable_dhtml = true}
		{assign var="limit" value=0}
	{/if}
	
	{if !$featured_review_discussion_params}
		{assign var="featured_review_discussion_params" value=['featured' => $block.properties.mm_featured_reviews_show, 'page' => $smarty.request.page, 'limit' => $limit]}
	{/if}
	
	{assign var="featured_review_discussion" value=$featured_review_discussion_params|fn_mm_featured_reviews_get_featured_review_discussion_posts}
	
	{if $featured_review_discussion.0 && $featured_review_discussion.0|count > 0 && $featured_review_discussion.1 && $featured_review_discussion.0|count > 0}
		{assign var="featured_review_discussion_posts" value=$featured_review_discussion.0}
		{assign var="featured_review_discussion_params" value=$featured_review_discussion.1}
		{assign var="number_of_featured_review_discussion_posts" value=$featured_review_discussion_posts|count}
		
		<div class="discussion-block ty-pagination-container cm-pagination-container" id="pagination_contents">
			{if $limit == 0}
				{include file="common/pagination.tpl" search=$featured_review_discussion_params}
				<div class="total_average_rating">{__("mm_featured_reviews_average_rating")}:&nbsp;{include file="addons/mm_featured_reviews/blocks/static_templates/mm_featured_reviews_company_average_rating.tpl" mm_featured_reviews_display_inline=true}</div>
			{else}
				{assign var="view_more_link" value=$runtime.company_id|fn_mm_featured_reviews_get_featured_reviews_page_url}
			{/if}
	        <div id="posts_list" class="posts_lists_page_contents">
	            {foreach from=$featured_review_discussion_posts item=post name="featured_review_discussion_posts_foreach"}
	            	{* Add by mashmedia: (Multigift only) Translate through Google *}
					{assign var="post" value=$post|fn_mm_functions_get_translated_discussion_post}
	            
	            	{if $smarty.foreach.featured_review_discussion_posts_foreach.iteration%2 == 0}
	            		{assign var="is_even_discussion_post" value=true}
	            	{else}
	            		{assign var="is_even_discussion_post" value=false}
	            		<div class="row">
	            	{/if}
	            	
	                <div class="ty-discussion-post__content span6">
	                	<div class="ty-discussion-post__container">
	                		<span class="ty-discussion-post__product_thumb">
	                			<a href="{"products.view?product_id=`$post.object_id`"|fn_url}">
	                				{$post.main_pair = $post.object_id|fn_mm_functions_get_product_image_thumb_pair}
	                				{include file="common/image.tpl" obj_id=$post.post_id images=$post.main_pair image_width=75 image_height=75}
	                			</a>
	                		</span>
	                		{if $post.type == "R" || $post.type == "B" && $post.rating_value > 0}<div class="clearfix ty-discussion-post__rating">{include file="addons/discussion/views/discussion/components/stars.tpl" stars=$post.rating_value|fn_get_discussion_rating}</div>{/if}
		                    <span class="ty-discussion-post__product_name"><a href="{$post.product_url}" title="{$post.product_name} {$post.product_code}">{$post.product_name|truncate:109:"..."}</a></span>
		                    <div class="ty-discussion-post__date">{$post.timestamp|date_format:"`$settings.Appearance.date_format`, `$settings.Appearance.time_format`"}</div>
		                    <div class="ty-discussion-post" id="post_{$post.post_id}">{if $post.type == "C" || $post.type == "B"}<div class="ty-discussion-post__message">{$post.message|escape|nl2br|truncate:350:"..." nofilter}</div>{/if}</div>
		                    <div class="ty-discussion-post__author"><span>{__("mm_featured_reviews_review_by")}&nbsp;{$post.name}</span></div>
	                    </div>
	                </div>
	                
	                {if $is_even_discussion_post || $smarty.foreach.featured_review_discussion_posts_foreach.iteration == $number_of_featured_review_discussion_posts}
	                	</div>
	                {/if}
	            {/foreach}
	        </div>
	        
	        {if $limit == 0}
	        	{include file="common/pagination.tpl" search=$featured_review_discussion_params force_ajax=false}
	        {/if}
	        
			{* Removed because link is already at the top of the page *}
	        {* {if $featured_review_discussion_params.avg_rating_value && $view_more_link && $view_more_link != ""}
		        <div class="clearfix">
		        	<div class="ty-discussion-post__average_rating pull-left">
		                {include file="addons/discussion/views/discussion/components/stars.tpl" stars=$featured_review_discussion_params.avg_rating_value|fn_get_discussion_rating}
		            </div>
					{assign var="mm_featured_reviews_view_all_link_text" value=__("mm_featured_reviews_view_all")}
					{if empty($mm_featured_reviews_static_data)}
						{assign var="mm_featured_reviews_static_data" value=$runtime.company_id|fn_mm_featured_reviews_get_static_data}
						{if $mm_featured_reviews_static_data.number_of_ratings > 0}
							{$mm_featured_reviews_view_all_link_text = "{$mm_featured_reviews_view_all_link_text} {$mm_featured_reviews_static_data.number_of_ratings} {__("mm_featured_reviews_reviews")|lower}"}
						{/if}
					{/if}
					<a class="pull-left view_all_reviews" href="{$view_more_link}">{$mm_featured_reviews_view_all_link_text}</a>
				</div>
			{/if} *}
			{capture name="mainbox_title"}{$title}{/capture}
		</div>
	{/if}
</div>