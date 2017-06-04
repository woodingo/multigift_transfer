{strip}

{if $capture_image}
    {capture name="image"}
{/if}

{if !$obj_id}
    {math equation="rand()" assign="obj_id"}
{/if}

{$image_data=$images|fn_image_to_display:$image_width:$image_height}
{$generate_image=$image_data.generate_image && !$external}

{if !$image_data.image_path}
	{$image_data.detailed_image_path = "{$images_dir}/image-not-yet-available.jpg"}
	{$image_data.image_path = "{$images_dir}/image-not-yet-available-{$image_width}-{$image_width}.jpg"}
{/if}

{if $show_detailed_link}
    <a id="det_img_link_{$obj_id}" {if $image_data.detailed_image_path && $image_id}data-ca-image-id="{$image_id}"{/if} class="{$link_class} {if $image_data.detailed_image_path}cm-previewer ty-previewer{/if}" {if $image_data.detailed_image_path}href="{$image_data.detailed_image_path}"{/if}>
{/if}
{if $image_data.image_path}
    <img class="ty-pict {$valign} {$class} {if $generate_image}ty-spinner cm-generate-image{/if}{if $set_image_src_in_data_attr_for_load_on_doc_ready} lazyOwl{/if}"  {if $obj_id && !$no_ids}id="det_img_{$obj_id}"{/if} {if $generate_image}data-ca-image-path="{$image_data.image_path}"{/if} {if $set_image_src_in_data_attr_for_load_on_doc_ready} data-src="{if $generate_image}{$images_dir}/icons/spacer.gif{else}{$image_data.image_path}{/if}"{else}src="{if $generate_image}{$images_dir}/icons/spacer.gif{else}{$image_data.image_path}{/if}"{/if} alt="{$image_data.alt}" {if $image_data.title != ""}title="{$image_data.title}" {/if}{if $image_onclick}onclick="{$image_onclick}"{/if} />
{else}
		<img class="ty-pict {$valign} {$class} {if $generate_image}ty-spinner cm-generate-image{/if}{if $set_image_src_in_data_attr_for_load_on_doc_ready} lazyOwl{/if}"  {if $obj_id && !$no_ids}id="det_img_{$obj_id}"{/if} {if $generate_image}data-ca-image-path="{$image_data.image_path}"{/if} {if $set_image_src_in_data_attr_for_load_on_doc_ready} data-src="{$images_dir}/image-not-yet-available-{$image_width}-{$image_width}.jpg"{else}src="{$images_dir}/image-not-yet-available-{$image_width}-{$image_width}.jpg"{/if} alt="{if $image_data.alt}{$image_data.alt}{/if}" {if $image_data.title != ""}title="{$image_data.title}" {/if}{if $image_onclick}onclick="{$image_onclick}"{/if} />
	{* <span class="ty-no-image" style="min-width: {$image_width|default:$image_height}px; min-height: {$image_height|default:$image_width}px;"><i class="ty-no-image__icon ty-icon-image" title="{__("no_image")}"></i></span> *}
{/if}
{if $show_detailed_link}
    {if $images.detailed_id}
        <span class="ty-previewer__icon hidden-phone"></span>
    {/if}
</a>
{/if}

{if $capture_image}
    {/capture}
    {capture name="icon_image_path"}
        {$image_data.image_path}
    {/capture}
    {capture name="detailed_image_path"}
        {$image_data.detailed_image_path}
    {/capture}
{/if}

{/strip}
