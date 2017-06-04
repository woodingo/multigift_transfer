{assign var="profile_extra_field_margin" value="margin: 2px 0px 3px 0px;"}
{foreach from=$fields item="field"}
{if !$field.field_name}
{assign var="value" value=$order_info.fields[$field.field_id]}
{* Edit by mashmedia: Only parse paragraph when not empty *}
    {* Edit by mashmedia: Hide label *}
    {* {$field.description}: *}
    {if "AOL"|strpos:$field.field_type !== false} {* Titles/States/Countries *}
        {assign var="title" value="`$field.field_id`_descr"}
        <p style="{$profile_extra_field_margin}">{$user_data.$title}</p>
    {elseif $field.field_type == "C"}  {* Checkbox *}
        <p style="{$profile_extra_field_margin}">{if $value == "Y"}{__("yes")}{else}{__("no")}{/if}</p>
    {elseif $field.field_type == "D"}  {* Date *}
        <p style="{$profile_extra_field_margin}">{$value|date_format:$settings.Appearance.date_format}</p>
    {elseif "RS"|strpos:$field.field_type !== false}  {* Selectbox/Radio *}
        <p style="{$profile_extra_field_margin}">{$field.values.$value}</p>
    {else}  {* input/textarea *}
    	{* Edit by mashmedia: Hide dash when empty *}
        {* {$value|default:"-"} *}
        <p style="{$profile_extra_field_margin}">{$value|default:""}</p>
    {/if}
{/if}
{/foreach}