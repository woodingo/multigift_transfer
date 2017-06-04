{assign var="number_of_product_combination_images" value=$product_combinations_grouped_by_color|count}
{assign var="number_of_additional_product_images" value=$product.image_pairs|count}
{assign var="product_main_pair" value=$product.product_id|fn_get_image_pairs:"product":"M"}

{assign var="number_of_product_images" value=$number_of_product_combination_images+$number_of_additional_product_images}
{if $product_main_pair.detailed}
	{$number_of_product_images = $number_of_product_images + 1}
{/if}

{assign var="showing_images_counter" value=0}

{if $number_of_product_images > 0 && $show_gallery}
<div class="ty-center-block">
	{assign var="number_of_product_combinations_grouped_by_color" value=$product_combinations_grouped_by_color.color_variants|count}
    {if $number_of_product_images > 1}
    <div class="ty-thumbs-wrapper owl-carousel cm-image-gallery" data-ca-items-count="1" data-ca-items-responsive="true" id="icons_{$obj_id_prefix}">
    {/if}
    {if $product_main_pair.detailed}
    	{$showing_images_counter = $showing_images_counter + 1}
	    <div class="cm-gallery-item cm-item-gallery">
	        <a href="{"products.view?product_id=`$product.product_id`"|fn_url}" {if $product_main_pair.detailed.alt} title="{$product_main_pair.detailed.alt}"{/if}>
	        	{assign var="set_image_src_in_data_attr_for_load_on_doc_ready" value=false}
	            {include file="common/image.tpl" obj_id="`$obj_id_prefix`_`$product_main_pair.image_id`" images=$product_main_pair image_width=$settings.Thumbnails.product_lists_thumbnail_width image_height=$settings.Thumbnails.product_lists_thumbnail_height set_image_src_in_data_attr_for_load_on_doc_ready=$set_image_src_in_data_attr_for_load_on_doc_ready}
	        </a>
	    </div>
    {/if}
    {foreach from=$product_combinations_grouped_by_color.color_variants item="color_variant" name="product_combination_color_variants_foreach"}
    	{assign var="image_pair" value=$color_variant.image_pair}
        <div class="cm-gallery-item cm-item-gallery">
            <a href="{"products.view?product_id=`$product.product_id`"|fn_url}" data-product-color-code="{$color_variant.color_code}"{if $image_pair.detailed.alt} title="{$image_pair.detailed.alt}"{/if}>
            	{assign var="set_image_src_in_data_attr_for_load_on_doc_ready" value=true}
            	{if $showing_images_counter == 0}
            		{assign var="set_image_src_in_data_attr_for_load_on_doc_ready" value=false}
				{/if}
                {include file="common/image.tpl" obj_id="`$obj_id_prefix`_`$image_pair.image_id`" images=$image_pair image_width=$settings.Thumbnails.product_lists_thumbnail_width image_height=$settings.Thumbnails.product_lists_thumbnail_height set_image_src_in_data_attr_for_load_on_doc_ready=$set_image_src_in_data_attr_for_load_on_doc_ready}
            </a>
        </div>
        {$showing_images_counter = $showing_images_counter + 1}
    {/foreach}
    
    {if $product.image_pairs}
    	{foreach from=$product.image_pairs item="additional_image_pair" name="additional_image_pairs"}
	        <div class="cm-gallery-item cm-item-gallery">
	            <a href="{"products.view?product_id=`$product.product_id`"|fn_url}" {if $image_pair.detailed.alt} title="{$image_pair.detailed.alt}"{/if}>
	            	{assign var="set_image_src_in_data_attr_for_load_on_doc_ready" value=true}
	            	{if $showing_images_counter == 0}
	            		{assign var="set_image_src_in_data_attr_for_load_on_doc_ready" value=false}
					{/if}
	                {include file="common/image.tpl" obj_id="`$obj_id_prefix`_`$additional_image_pair.image_id`" images=$additional_image_pair image_width=$settings.Thumbnails.product_lists_thumbnail_width image_height=$settings.Thumbnails.product_lists_thumbnail_height set_image_src_in_data_attr_for_load_on_doc_ready=$set_image_src_in_data_attr_for_load_on_doc_ready}
	            </a>
	        </div>
		{/foreach}
    {/if}
    
    {if $number_of_product_images > 1}
    </div>
    {/if}
</div>
{else}
    {$smarty.capture.main_icon nofilter}
{/if}