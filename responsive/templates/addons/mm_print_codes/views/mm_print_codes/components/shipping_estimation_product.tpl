<div class="hidden" id="shipping_estimation_block" title="{__("calculate_shipping_cost")}">
<div class="shipping-estimation">
{assign var="cart" value=$smarty.session.cart}
{assign var="location" value="popup"}
{assign var="result_ids" value="shipping_estimation_link"}

{literal}
<script type="text/javascript">
function fn_calculate_total_shipping() 
{
    var $ = Tygh.$;
    params = [];
    parents = $('#shipping_estimation');
    radio = $('input[type=radio]:checked', parents);

    $.each(radio, function(id, elm) {
        params.push({name: elm.name, value: elm.value});
    });

    params.push({name: $('#elm_zipcode').prop('name'), value: $('#elm_country').val()});
    params.push({name: $('#elm_state').prop('name'), value: $('#elm_state').val()});
    params.push({name: $('#elm_zipcode').prop('name'), value: $('#elm_zipcode').val()});

    url = fn_url('checkout.shipping_estimation');

    for (i in params) {
        url += '&' + params[i]['name'] + '=' + encodeURIComponent(params[i]['value']);
    }

    $.ceAjax('request', url, {
        //result_ids: 'shipping_estimation',
        method: 'post'
    });
}
</script>
{/literal}

{if $location == "sidebox"}
    {assign var="prefix" value="sidebox_"}
{/if}
{if $location == "popup"}
    {assign var="buttons_class" value="hidden"}
{else}
    {assign var="buttons_class" value="buttons-container"}
{/if}
{if $additional_id}
    {assign var="class_suffix" value="-`$additional_id`"}
    {assign var="id_suffix" value="_`$additional_id`"}
{/if}

{if $location != "sidebox" && $location != "popup"}

<div id="est_box{$id_suffix}" class="mm-print-codes-shipping-estimation-box">
    <div class="estimation-box">
    <h3 class="ty-subheader">{__("calculate_shipping_cost")}</h3>
{/if}

        <div id="shipping_estimation{if $location == "sidebox"}_sidebox{/if}{$id_suffix}">

            {$states = 1|fn_get_all_states}
            {if !$smarty.capture.states_built}
                {include file="views/profiles/components/profiles_scripts.tpl" states=$states}
                {capture name="states_built"}Y{/capture}
            {/if}

            <form id="mm_print_codes_product_shipping_estimation_form" class="cm-ajax" name="{$prefix}estimation_form{$id_suffix}" action="{"checkout.shipping_estimation"|fn_url}" method="post">
                {if $location == "sidebox"}<input type="hidden" name="location" value="sidebox" />{/if}
                {if $additional_id}<input type="hidden" name="additional_id" value="{$additional_id}" />{/if}
                <!-- <input type="hidden" name="result_ids" value="shipping_estimation{if $location == "sidebox"}_sidebox{/if}{$id_suffix},shipping_estimation_buttons" /> -->
                <div class="ty-control-group">
                    <label class="ty-control-group__label" for="{$prefix}elm_country{$id_suffix}">{__("country")}</label>
                    <select id="{$prefix}elm_country{$id_suffix}" class="cm-country cm-location-estimation{$class_suffix} ty-input-text-medium" name="customer_location[country]">
                        <option value="">- {__("select_country")} -</option>
                        {assign var="countries" value=1|fn_get_simple_countries}
                        {foreach from=$countries item="country" key="code"}
                        <option value="{$code}" {if ($cart.user_data.s_country == $code) || (!$cart.user_data.s_country && $code == $settings.General.default_country)}selected="selected"{/if}>{$country}</option>
                        {/foreach}
                    </select>
                </div>

                {$_state = $cart.user_data.s_state}

                {if $_state|fn_is_empty}
                    {$_state = $settings.General.default_state}
                {/if}

                <div class="ty-control-group">
                    <label class="ty-control-group__label" for="{$prefix}elm_state{$id_suffix}">{__("state")}</label>
                    <select class="cm-state cm-location-estimation{$class_suffix} {if !$states[$cart.user_data.s_country]}hidden{/if} ty-input-text-medium" id="{$prefix}elm_state{$id_suffix}" name="customer_location[state]">
                        <option value="">- {__("select_state")} -</option>
                        {foreach $states[$cart.user_data.s_country] as $state}
                            <option value="{$state.code}" {if $state.code == $_state}selected="selected"{/if}>{$state.state}</option>
                        {foreachelse}
                            <option label="" value="">- {__("select_state")} -</option>
                        {/foreach}
                    </select>
                    <input type="text" class="cm-state cm-location-estimation{$class_suffix} ty-input-text-medium {if $states[$cart.user_data.s_country]}hidden{/if}" id="{$prefix}elm_state{$id_suffix}_d" name="customer_location[state]" size="{if $location != "sidebox"}32{else}20{/if}" maxlength="64" value="{$_state}" {if $states[$cart.user_data.s_country]}disabled="disabled"{/if} />
                </div>

                <div class="ty-control-group">
                    <label class="ty-control-group__label" for="{$prefix}elm_zipcode{$id_suffix}" {if $location == "sidebox"}class="ty-nowrap"{/if}>{__("zip_postal_code")}</label>
                    <input type="text" class="ty-input-text-medium" id="{$prefix}elm_zipcode{$id_suffix}" name="customer_location[zipcode]" size="{if $location != "sidebox"}25{else}20{/if}" value="{$cart.user_data.s_zipcode}" autofocus />
                </div>

                <div class="{$buttons_class}">
                    {include file="buttons/button.tpl" but_text=__("get_rates") but_name="dispatch[checkout.shipping_estimation]" but_role="text" but_id="but_get_rates" but_meta="cm-ajax"}
                </div>

            </form>
        <!--shipping_estimation{if $location == "sidebox"}_sidebox{/if}{$id_suffix}--></div>

{if $location != "sidebox" && $location != "popup"}
    </div>
</div>
{/if}

{if $location == "popup"}
<div class="ty-estimation-buttons buttons-container mm-print-codes-shipping-estimation-buttons" id="shipping_estimation_buttons">
	{include file="buttons/button.tpl" but_text=__("recalculate_rates") but_external_click_id="but_get_rates" but_role="text" but_meta="ty-btn__secondary cm-external-click ty-float-right ty-estimation-buttons__rate cm-dialog-closer" but_id="mm_print_codes_product_shipping_estimation_button"}
<!--shipping_estimation_buttons--></div>
{/if}
</div>
</div>