{assign var="default_country" value=$settings.General.default_country}
{assign var="countries" value=1|fn_get_simple_countries}
{foreach from=$countries item="country" key="code"}
<option value="{$code}" {if $default_country == $code}selected="selected"{/if}>{$country}</option>
{/foreach}