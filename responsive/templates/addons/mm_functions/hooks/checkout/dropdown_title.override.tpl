<span class="fa fa-shopping-cart"></span>
{if $smarty.session.cart.amount}
	<span class="ty-minicart-title ty-hand hidden-phone">{$smarty.session.cart.amount}&nbsp;{__("items")} {__("for")}&nbsp;{include file="common/price.tpl" value=$smarty.session.cart.display_subtotal}</span>
	<i class="ty-icon-down-micro"></i>
{else}
	<span class="ty-minicart-title empty-cart ty-hand hidden-phone">{__("cart_is_empty")}</span>
	<i class="ty-icon-down-micro"></i>
{/if}