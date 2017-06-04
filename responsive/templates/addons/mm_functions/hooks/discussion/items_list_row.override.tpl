{hook name="discussion:items_list_row"}

{* Add by mashmedia: Translate through Google *}
{assign var="post" value=$post|fn_mm_functions_get_translated_discussion_post}

<span class="ty-discussion-post__author">
	{if $post.name == "Anoniem (naam bekend bij MultiGift)" || $post.name == "Anonymous (Namen Multi Gift bekannt)" || $post.name == "Anonymous (name known to Multi Gift)" || $post.name == "Anonyme (nom connu de multiples cadeau)"}
		{__("mm_featured_reviews_anonymous")}
	{else}
		{$post.name}
	{/if}
</span>
<span class="ty-discussion-post__date">{$post.timestamp|date_format:"`$settings.Appearance.date_format`, `$settings.Appearance.time_format`"}</span>
<div class="ty-discussion-post {cycle values=", ty-discussion-post_even"}" id="post_{$post.post_id}">
    {if $discussion.type == "R" || $discussion.type == "B" && $post.rating_value > 0}
        <div class="clearfix ty-discussion-post__rating">
            {include file="addons/discussion/views/discussion/components/stars.tpl" stars=$post.rating_value|fn_get_discussion_rating}
        </div>
    {/if}

    {if $discussion.type == "C" || $discussion.type == "B"}
        <div class="ty-discussion-post__message">
        	{$post.message|escape|nl2br nofilter}
        </div>
        {if $post.reply_visible == "Y" && $post.reply != ""}
	        <div class="ty-discussion-post__reply">
	        	<div class="ty-discussion-post__reply-title">{__("mm_featured_reviews_company_reply")}:</div>
	        	<div class="ty-discussion-post__reply-content">{$post.reply|escape|nl2br nofilter}</div>
	        </div>
        {/if}
    {/if}

</div>
{/hook}