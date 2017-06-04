{* Shop- and languagespecific JavaScript code. Note: Surround your script tags with smarty's literal tag. *}
{if $runtime.company_id && $smarty.const.CART_LANGUAGE}
	{if $runtime.company_id == "33"} {* MultiGift.com *}
		{if $smarty.const.CART_LANGUAGE == "nl"}
{literal}
<script type="text/javascript">
  (function() {
    var se = document.createElement('script'); se.type = 'text/javascript'; se.async = true;
    se.src = '//storage.googleapis.com/code.snapengage.com/js/b7f4e736-32f9-4a6c-9ad6-72ddeeba28f8.js';
    var done = false;
    se.onload = se.onreadystatechange = function() {
      if (!done&&(!this.readyState||this.readyState==='loaded'||this.readyState==='complete')) {
        done = true;
    SnapEngage.setTitle("Stuur een email");
    SnapEngageChat.setTitle("Chat met ons!");
      }
    };
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(se, s);
  })();
</script>
{/literal}
		{else if $smarty.const.CART_LANGUAGE == "en"}
{literal}
<script type="text/javascript">
  (function() {
    var se = document.createElement('script'); se.type = 'text/javascript'; se.async = true;
    se.src = '//storage.googleapis.com/code.snapengage.com/js/5b87cee2-9ca7-48e8-ae14-418b1b77102a.js';
    var done = false;
    se.onload = se.onreadystatechange = function() {
      if (!done&&(!this.readyState||this.readyState==='loaded'||this.readyState==='complete')) {
        done = true;
    SnapEngage.setTitle("Send an email");
    SnapEngageChat.setTitle("Chat with us!");
      }
    };
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(se, s);
  })();
</script>
{/literal}
		{else if $smarty.const.CART_LANGUAGE == "fr"}
			{* Vervang deze regel met de taalspecifieke JavaScript code *}
		{else if $smarty.const.CART_LANGUAGE == "de"}
			{* Vervang deze regel met de taalspecifieke JavaScript code *}
		{/if}
		{* Of vervang deze regel met de NIET taalspecifieke JavaScript code *}
	{else if $runtime.company_id == "39"} {* MultiGift.be *}
		{if $smarty.const.CART_LANGUAGE == "nl"}
{literal}
<script type="text/javascript">
  (function() {
    var se = document.createElement('script'); se.type = 'text/javascript'; se.async = true;
    se.src = '//storage.googleapis.com/code.snapengage.com/js/f16d1c68-21b1-4e11-8de3-7bf947d30975.js';
    var done = false;
    se.onload = se.onreadystatechange = function() {
      if (!done&&(!this.readyState||this.readyState==='loaded'||this.readyState==='complete')) {
        done = true;
        /* Place your SnapEngage JS API code below */
        /* SnapEngage.allowChatSound(true); Example JS API: Enable sounds for Visitors. */
      }
    };
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(se, s);
  })();
</script>
{/literal}
			{* Vervang deze regel met de taalspecifieke JavaScript code *}
		{else if $smarty.const.CART_LANGUAGE == "fr"}
			{* Vervang deze regel met de taalspecifieke JavaScript code *}
		{else}
			{* Vervang deze regel met de taalspecifieke JavaScript code voor de overige talen *}
		{/if}
		{* Of vervang deze regel met de NIET taalspecifieke JavaScript code *}
	{else if $runtime.company_id == "20"} {* Spaarpotten.nl *}
		{if $smarty.const.CART_LANGUAGE == "nl"}
{literal}
<script type="text/javascript">
  (function() {
    var se = document.createElement('script'); se.type = 'text/javascript'; se.async = true;
    se.src = '//storage.googleapis.com/code.snapengage.com/js/b7f4e736-32f9-4a6c-9ad6-72ddeeba28f8.js';
    var done = false;
    se.onload = se.onreadystatechange = function() {
      if (!done&&(!this.readyState||this.readyState==='loaded'||this.readyState==='complete')) {
        done = true;
    SnapEngage.setTitle("Stuur een email");
    SnapEngageChat.setTitle("Chat met ons!");
      }
    };
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(se, s);
  })();
</script>
{/literal}
		{elseif $smarty.const.CART_LANGUAGE == "en"}
{literal}
<script type="text/javascript">
  (function() {
    var se = document.createElement('script'); se.type = 'text/javascript'; se.async = true;
    se.src = '//storage.googleapis.com/code.snapengage.com/js/5b87cee2-9ca7-48e8-ae14-418b1b77102a.js';
    var done = false;
    se.onload = se.onreadystatechange = function() {
      if (!done&&(!this.readyState||this.readyState==='loaded'||this.readyState==='complete')) {
        done = true;
    SnapEngage.setTitle("Send an email");
    SnapEngageChat.setTitle("Chat with us!");
      }
    };
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(se, s);
  })();
</script>
{/literal}
		{/if}
	{elseif $runtime.company_id == "38"} {* MultiGift.nl *}
{literal}
<script type="text/javascript">
  (function() {
    var se = document.createElement('script'); se.type = 'text/javascript'; se.async = true;
    se.src = '//storage.googleapis.com/code.snapengage.com/js/b7f4e736-32f9-4a6c-9ad6-72ddeeba28f8.js';
    var done = false;
    se.onload = se.onreadystatechange = function() {
      if (!done&&(!this.readyState||this.readyState==='loaded'||this.readyState==='complete')) {
        done = true;
    SnapEngage.setTitle("Stuur een email");
    SnapEngageChat.setTitle("Chat met ons!");
      }
    };
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(se, s);
  })();
</script>
{/literal}
	{elseif $runtime.company_id == "35"} {* GeenStress.nl *}
    
    {if $smarty.const.CART_LANGUAGE == "nl"}
{literal}
<script type="text/javascript">
  (function() {
    var se = document.createElement('script'); se.type = 'text/javascript'; se.async = true;
    se.src = '//storage.googleapis.com/code.snapengage.com/js/b7f4e736-32f9-4a6c-9ad6-72ddeeba28f8.js';
    var done = false;
    se.onload = se.onreadystatechange = function() {
      if (!done&&(!this.readyState||this.readyState==='loaded'||this.readyState==='complete')) {
        done = true;
    SnapEngage.setTitle("Stuur een email");
    SnapEngageChat.setTitle("Chat met ons!");
      }
    };
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(se, s);
  })();
</script>
{/literal}
    {else if $smarty.const.CART_LANGUAGE == "en"}
        {literal}
<script type="text/javascript">
  (function() {
    var se = document.createElement('script'); se.type = 'text/javascript'; se.async = true;
    se.src = '//storage.googleapis.com/code.snapengage.com/js/5b87cee2-9ca7-48e8-ae14-418b1b77102a.js';
    var done = false;
    se.onload = se.onreadystatechange = function() {
      if (!done&&(!this.readyState||this.readyState==='loaded'||this.readyState==='complete')) {
        done = true;
    SnapEngage.setTitle("Send an email");
    SnapEngageChat.setTitle("Chat with us!");
      }
    };
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(se, s);
  })();
</script>
{/literal}
    {/if}
	{else if $runtime.company_id == "36"} {* MultiGift.co.uk *}
{literal}
<script type="text/javascript">
  (function() {
    var se = document.createElement('script'); se.type = 'text/javascript'; se.async = true;
    se.src = '//storage.googleapis.com/code.snapengage.com/js/5b87cee2-9ca7-48e8-ae14-418b1b77102a.js';
    var done = false;
    se.onload = se.onreadystatechange = function() {
      if (!done&&(!this.readyState||this.readyState==='loaded'||this.readyState==='complete')) {
        done = true;
    SnapEngage.setTitle("Send an email");
    SnapEngageChat.setTitle("Chat with us!");
      }
    };
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(se, s);
  })();
</script>
{/literal}
	{elseif $runtime.company_id == "37"} {* MaxiTrading.nl *}
{literal}
<script type="text/javascript">
  (function() {
    var se = document.createElement('script'); se.type = 'text/javascript'; se.async = true;
    se.src = '//storage.googleapis.com/code.snapengage.com/js/42e5829e-ac88-4d45-b64a-085d709c0e6e.js';
    var done = false;
    se.onload = se.onreadystatechange = function() {
      if (!done&&(!this.readyState||this.readyState==='loaded'||this.readyState==='complete')) {
        done = true;    SnapEngage.setTitle("Stuur een email");
        SnapEngageChat.setTitle("Chat met ons!");
      }
    };
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(se, s);
  })();
</script>
{/literal}
	{elseif $runtime.company_id == "40"} {* Relatiegeschenken.eu *}
{literal}
<script type="text/javascript">
  (function() {
    var se = document.createElement('script'); se.type = 'text/javascript'; se.async = true;
    se.src = '//storage.googleapis.com/code.snapengage.com/js/b7f4e736-32f9-4a6c-9ad6-72ddeeba28f8.js';
    var done = false;
    se.onload = se.onreadystatechange = function() {
      if (!done&&(!this.readyState||this.readyState==='loaded'||this.readyState==='complete')) {
        done = true;
    SnapEngage.setTitle("Stuur een email");
    SnapEngageChat.setTitle("Chat met ons!");
      }
    };
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(se, s);
  })();
</script>
{/literal}
	{elseif $runtime.company_id == "41"} {* Stressballen.nl *}
{literal}
<script type="text/javascript">
  (function() {
    var se = document.createElement('script'); se.type = 'text/javascript'; se.async = true;
    se.src = '//storage.googleapis.com/code.snapengage.com/js/b7f4e736-32f9-4a6c-9ad6-72ddeeba28f8.js';
    var done = false;
    se.onload = se.onreadystatechange = function() {
      if (!done&&(!this.readyState||this.readyState==='loaded'||this.readyState==='complete')) {
        done = true;
    SnapEngage.setTitle("Stuur een email");
	SnapEngageChat.setTitle("Chat met ons!");
      }
    };
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(se, s);
  })();
</script>
{/literal}
	{/if}
{/if}