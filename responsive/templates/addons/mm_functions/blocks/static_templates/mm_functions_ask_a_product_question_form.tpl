{** block-description:mm_functions_ask_a_product_question_form **}
{* Add by mashmedia: This file is a copy of /addons/form_builder/hooks/pages/page_content.override.tpl with form specific changes (removed some hooks) *}
{assign var="form_page_id" value=29}
{assign var="form_container_id" value="mm_functions_ask_a_product_question_form"}
{assign var="page" value=$form_page_id|fn_get_page_data}

<div id="{$form_container_id}">
	{if $page.page_type == $smarty.const.PAGE_TYPE_FORM}
	    {if $smarty.request.sent == "Y"}
	
	        {hook name="pages:form_sent"}
	        {assign var="form_submit_const" value=$smarty.const.FORM_SUBMIT}
	        <p>{$page.form.general.$form_submit_const nofilter}</p>
	        {/hook}
	
	        <div class="ty-form-builder__buttons buttons-container">
	        {include file="buttons/button.tpl" but_text=__("continue") but_meta="ty-btn__secondary" but_href=$continue_url|fn_url but_role="action"}
	        </div>
	    {else}
	
	    {if $page.description}
	    	{* Add by mashmedia: Replace specific codes in form description with mm_seo_builder *}
	        <div class="ty-form-builder__description">
	        	{$page.description|fn_mm_seo_manager_get_pattern_with_replaced_tags:$product nofilter}
	        </div>
	    {/if}
	
	<div class="ty-form-builder">
		<form action="{"mm_functions.submit_email_form"|fn_url}" method="post" name="forms_form" enctype="multipart/form-data" class="cm-ajax cm-comet">
	    <input type="hidden" name="fake" value="1" />
	    <input type="hidden" name="result_ids" value="{$form_container_id}" />
	    <input type="hidden" name="product_id" value="{$product.product_id}" />
	    <input type="hidden" name="page_id" value="{$page.page_id}" />
	    {foreach from=$page.form.elements key="element_id" item="element"}
	
	    {if $element.element_type == $smarty.const.FORM_SEPARATOR}
	        <hr class="ty-form-builder__separator" />
	    {elseif $element.element_type == $smarty.const.FORM_HEADER}
	
	    {include file="common/subheader.tpl" title=$element.description}
	
	    {elseif $element.element_type != $smarty.const.FORM_IP_ADDRESS && $element.element_type != $smarty.const.FORM_REFERER}
	        <div class="ty-control-group">
	            <label for="{if $element.element_type == $smarty.const.FORM_FILE}type_{"fb_files[`$element.element_id`]"|md5}{else}elm_{$element.element_id}{/if}" class="ty-control-group__title {if $element.required == "Y"}cm-required{/if}{if $element.element_type == $smarty.const.FORM_EMAIL} cm-email{/if}{if $element.element_type == $smarty.const.FORM_PHONE} cm-phone{/if} {if $element.element_type == $smarty.const.FORM_MULTIPLE_CB}cm-multiple-checkboxes{/if}">{$element.description}</label>
				
				{if $element.element_type == $smarty.const.FORM_SELECT}
	                <select id="elm_{$element.element_id}" class="ty-form-builder__select" name="form_values[{$element.element_id}]">
	                    <option label="" value="">- {__("select")} -</option>
	                {foreach from=$element.variants item=var}
	                    <option value="{$var.element_id}" {if $form_values.$element_id == $var.element_id}selected="selected"{/if}>{$var.description}</option>
	                {/foreach}
	                </select>
	                
	                
	            {elseif $element.element_type == $smarty.const.FORM_RADIO}
	                {foreach from=$element.variants item=var name="rd"}
	                <label class="ty-form-builder__radio-label">
	                    <input class="ty-form-builder__radio radio" {if (!$form_values && $smarty.foreach.rd.iteration == 1) || ($form_values.$element_id == $var.element_id)}checked="checked"{/if} type="radio" name="form_values[{$element.element_id}]" value="{$var.element_id}" />{$var.description}&nbsp;&nbsp;
	                </label>
	                {/foreach}
	                
	                
	            {elseif $element.element_type == $smarty.const.FORM_CHECKBOX}
	                <input type="hidden" name="form_values[{$element.element_id}]" value="N" />
	                <input id="elm_{$element.element_id}" class="ty-form-builder__checkbox checkbox" {if $form_values.$element_id == "Y"}checked="checked"{/if} type="checkbox" name="form_values[{$element.element_id}]" value="Y" />
	                
	                
	            {elseif $element.element_type == $smarty.const.FORM_MULTIPLE_SB}
	                <select class="ty-form-builder__multiple-select" id="elm_{$element.element_id}" name="form_values[{$element.element_id}][]" multiple="multiple" >
	                    {foreach from=$element.variants item=var}
	                        <option value="{$var.element_id}" {if $form_values.$element_id == $var.element_id}selected="selected"{/if}>{$var.description}</option>
	                    {/foreach}
	                </select>
	                
	                
	            {elseif $element.element_type == $smarty.const.FORM_MULTIPLE_CB}
	                <div id="elm_{$element.element_id}">
	                {foreach from=$element.variants item=var}
	                    <label class="ty-form-builder__checkbox-label">
	                        <input class="ty-form-builder__checkbox" type="checkbox" {if $form_values.$element_id == $var.element_id}checked="checked"{/if} id="elm_{$element.element_id}_{$var.element_id}" name="form_values[{$element.element_id}][]" value="{$var.element_id}" />
	                        {$var.description}
	                    </label>
	                {/foreach}
	                </div>
	                
	                
	            {elseif $element.element_type == $smarty.const.FORM_INPUT}
	                <input id="elm_{$element.element_id}" class="ty-form-builder__input-text ty-input-text" size="50" type="text" name="form_values[{$element.element_id}]" value="{$form_values.$element_id}" />
	
	            {elseif $element.element_type == $smarty.const.FORM_TEXTAREA}
	                <textarea id="elm_{$element.element_id}" class="ty-form-builder__textarea" name="form_values[{$element.element_id}]" cols="67" rows="10">{$form_values.$element_id}</textarea>
	
	            {elseif $element.element_type == $smarty.const.FORM_DATE}
	                {include file="common/calendar.tpl" date_name="form_values[`$element.element_id`]" date_id="elm_`$element.element_id`" date_val=$form_values.$element_id}
	
	            {elseif $element.element_type == $smarty.const.FORM_EMAIL || $element.element_type == $smarty.const.FORM_NUMBER || $element.element_type == $smarty.const.FORM_PHONE}
	
	                {if $element.element_type == $smarty.const.FORM_EMAIL}
	                <input type="hidden" name="customer_email" value="{$element.element_id}" />
	                {/if}
	                <input id="elm_{$element.element_id}" class="ty-input-text" size="50" type="text" name="form_values[{$element.element_id}]" value="{$form_values.$element_id}" />
	                
	            {elseif $element.element_type == $smarty.const.FORM_COUNTRIES}
	
	                {$_country = $form_values.$elm_id|default:$settings.General.default_country}
	                <select id="elm_{$element.element_id}" name="form_values[{$element.element_id}]" class="ty-form-builder__country cm-country cm-location-billing">
	                    <option value="">- {__("select_country")} -</option>
	                    {assign var="countries" value=1|fn_get_simple_countries}
	                    {foreach from=$countries item="country" key="code"}
	                    <option value="{$code}" {if $_country == $code}selected="selected"{/if}>{$country}</option>
	                    {/foreach}
	                </select>
	
	            {elseif $element.element_type == $smarty.const.FORM_STATES}
	
	                {include file="views/profiles/components/profiles_scripts.tpl" states=1|fn_get_all_states}
	
	                {$_state = $form_values.$elm_id|default:$settings.General.default_state}
	                <select class="ty-form-builder__state cm-state cm-location-billing" id="elm_{$element.element_id}" name="form_values[{$element.element_id}]">
	                    <option label="" value="">- {__("select_state")} -</option>
	                </select>
	                <input type="text" class="cm-state cm-location-billing ty-input-text hidden" id="elm_{$element.element_id}_d" name="form_values[{$element.element_id}]" size="32" maxlength="64" value="{$_state}" disabled="disabled" />
	            
	            {elseif $element.element_type == $smarty.const.FORM_FILE}
	                {script src="js/tygh/fileuploader_scripts.js"}
	                {include file="common/fileuploader.tpl" var_name="fb_files[`$element.element_id`]"}
	            {/if}
	        </div>
	    {/if}
	    {/foreach}
	    {include file="common/image_verification.tpl" option="use_for_form_builder"}
	    <div class="ty-form-builder__buttons buttons-container">
	        {include file="buttons/button.tpl" but_role="submit" but_text=__("submit") but_meta="ty-btn__secondary" but_name="dispatch[pages.send_form]"}
	    </div>
	    </form>
	    {/if}
	</div>
	{/if}
</div>