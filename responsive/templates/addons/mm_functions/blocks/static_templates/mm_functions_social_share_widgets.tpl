<div id="mm_functions_social_share_widgets">
	{assign var="current_url_encoded" value=$config.current_url|fn_query_remove:"currency":"hide_out_of_stock":"sort_order":"sort_by"|fn_url|urlencode}
	<div class="facebook">
		{assign var="fb_lang" value="en_US"}
		{if $smarty.const.CART_LANGUAGE == "nl"}
			{assign var="fb_lang" value="nl_NL"}
		{/if}
		<iframe src="https://www.facebook.com/plugins/like.php?locale={$fb_lang}&href={$current_url_encoded}&layout=button_count&show_faces=false&colorscheme=light&height=15" scrolling="no" frameborder="0" allowTransparency="true"></iframe>
	</div>
	<div class="google_plus">
		{literal}<script src="https://apis.google.com/js/platform.js" async defer>{lang: '{/literal}{$smarty.const.CART_LANGUAGE}{literal}'}</script>{/literal}
		<div class="g-plusone" data-size="medium"></div>
	</div>
</div>