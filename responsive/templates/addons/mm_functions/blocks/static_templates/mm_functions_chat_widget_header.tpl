<div class="chat-widget-header">
{* Shop- and languagespecific JavaScript code. Note: Surround your script tags with smarty's literal tag. *}
{if $runtime.company_id && $smarty.const.CART_LANGUAGE}
	{if $runtime.company_id == "33"} {* MultiGift.com *}
		{if $smarty.const.CART_LANGUAGE == "nl"}
        	<a href="#" onclick="return SnapEngage.startLink();">
				<img src="https://www.snapengage.com/statusImage?w=b7f4e736-32f9-4a6c-9ad6-72ddeeba28f8" alt="Chat nu met één van onze relatiegeschenk specialisten" border="0" /></a>
		{else if $smarty.const.CART_LANGUAGE == "en"}
<a href="#" onclick="return SnapEngage.startLink();"><img src="https://www.snapengage.com/statusImage?w=5b87cee2-9ca7-48e8-ae14-418b1b77102a" alt="Chat with a promotional specialist" border="0"></a>
		{else if $smarty.const.CART_LANGUAGE == "fr"}
			{* Vervang deze regel met de taalspecifieke JavaScript code *}
		{else if $smarty.const.CART_LANGUAGE == "de"}
			{* Vervang deze regel met de taalspecifieke JavaScript code *}
		{/if}
		{* Of vervang deze regel met de NIET taalspecifieke JavaScript code *}
	{else if $runtime.company_id == "39"} {* MultiGift.be *}
		{if $smarty.const.CART_LANGUAGE == "nl"}
        <a href="#" onclick="return SnapEngage.startLink();"><img src="https://www.snapengage.com/statusImage?w=f16d1c68-21b1-4e11-8de3-7bf947d30975" alt="Contact us" border="0"></a>
		{else if $smarty.const.CART_LANGUAGE == "fr"}
			{* Vervang deze regel met de taalspecifieke JavaScript code *}
		{else}
			{* Vervang deze regel met de taalspecifieke JavaScript code voor de overige talen *}
		{/if}
		{* Of vervang deze regel met de NIET taalspecifieke JavaScript code *}
	{else if $runtime.company_id == "20"} {* Spaarpotten.nl *}
		{if $smarty.const.CART_LANGUAGE == "nl"}
    		<a href="#" onclick="return SnapEngage.startLink();">
				<img src="https://www.snapengage.com/statusImage?w=b7f4e736-32f9-4a6c-9ad6-72ddeeba28f8" alt="Chat nu met één van onze spaarpot specialisten" border="0" /></a>
		{elseif $smarty.const.CART_LANGUAGE == "en"}
<a href="#" onclick="return SnapEngage.startLink();"><img src="https://www.snapengage.com/statusImage?w=5b87cee2-9ca7-48e8-ae14-418b1b77102a" alt="Chat with a coin bank specialist" border="0"></a>
		{/if}
	{elseif $runtime.company_id == "38"} {* MultiGift.nl *}
    		<a href="#" onclick="return SnapEngage.startLink();">
				<img src="https://www.snapengage.com/statusImage?w=b7f4e736-32f9-4a6c-9ad6-72ddeeba28f8" alt="Chat nu met één van onze relatiegeschenken specialisten" border="0" /></a>
	{elseif $runtime.company_id == "35"} {* GeenStress.nl *}
		{if $smarty.const.CART_LANGUAGE == "nl"}
			<a href="#" onclick="return SnapEngage.startLink();">
				<img src="https://www.snapengage.com/statusImage?w=b7f4e736-32f9-4a6c-9ad6-72ddeeba28f8" alt="Chat nu met één van onze antistress artikelen specialisten" border="0" /></a>
		{else if $smarty.const.CART_LANGUAGE == "en"}
<a href="#" onclick="return SnapEngage.startLink();"><img src="https://www.snapengage.com/statusImage?w=5b87cee2-9ca7-48e8-ae14-418b1b77102a" alt="Chat with a stress ball specialist" border="0"></a>		  
		{/if}
	{else if $runtime.company_id == "36"} {* MultiGift.co.uk *}
<a href="#" onclick="return SnapEngage.startLink();"><img src="https://www.snapengage.com/statusImage?w=5b87cee2-9ca7-48e8-ae14-418b1b77102a" alt="Chat with a promotional product specialist" border="0"></a>
	{elseif $runtime.company_id == "37"} {* MaxiTrading.nl *}
<a href="#" onclick="return SnapEngage.startLink();"><img src="https://www.snapengage.com/statusImage?w=42e5829e-ac88-4d45-b64a-085d709c0e6e" alt="Chat nu met medewerker van MaxiTrading Promotieartikelen" border="0"></a>
	{elseif $runtime.company_id == "40"} {* Relatiegeschenken.eu *}
        	<a href="#" onclick="return SnapEngage.startLink();">
				<img src="https://www.snapengage.com/statusImage?w=b7f4e736-32f9-4a6c-9ad6-72ddeeba28f8" alt="Chat nu met één van onze premium specialisten" border="0" /></a>
	{elseif $runtime.company_id == "41"} {* Stressballen.nl *}
        	<a href="#" onclick="return SnapEngage.startLink();">
				<img src="https://www.snapengage.com/statusImage?w=b7f4e736-32f9-4a6c-9ad6-72ddeeba28f8" alt="Chat nu met één van onze stressballen specialisten" border="0" /></a>
	{/if}
{/if}
</div>