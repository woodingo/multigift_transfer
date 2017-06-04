{assign var="th_size" value="35"}

{if !$preview_id}
    {assign var="preview_id" value=$product.product_id|uniqid}
{/if}

{assign var="product_main_pair" value=$product.product_id|fn_get_image_pairs:"product":"M"}
{assign var="product_code" value=$product.product_id|fn_mm_functions_get_product_code_by_id}
{assign var="default_image_alt" value="{$product.product} {$product_code}"}

<div class="ty-product-img cm-preview-wrapper">
{assign var="showing_images_counter" value=0}
{assign var="product_combinations_grouped_by_color_params" value=['product_id'=>$product.product_id,'get_icon'=>true,'get_detailed'=>true,'get_combination'=>true,'get_product_name'=>true,'get_color_variant_and_stock'=>true,'get_incoming_stock_amount'=>true,'get_incoming_stock_amount_date'=>true,'product_data'=>$product]}
{assign var="product_combinations_grouped_by_color" value=$product_combinations_grouped_by_color_params|fn_mm_functions_get_product_combinations_grouped_by_color}

{assign var="number_of_product_combination_images" value=$product_combinations_grouped_by_color.color_variants|count}
{assign var="number_of_additional_product_images" value=$product.image_pairs|count}
{assign var="number_of_product_images" value=$number_of_product_combination_images+$number_of_additional_product_images}

{assign var="number_of_product_combinations" value=0}
{if $product_combinations_grouped_by_color.color_variants}
{assign var="number_of_product_combinations" value=$product_combinations_grouped_by_color.color_variants|count}
{/if}


{if $number_of_additional_product_images > 0}
	{foreach from=$product.image_pairs key=pair_id item=image_pair}
		{if $image_pair.detailed}
			{$product.image_pairs.$pair_id.detailed.alt = "{__("mm_functions_additional_image")} {$product.product}"}
			{$product.image_pairs.$pair_id.detailed.title = $product.image_pairs.$pair_id.detailed.alt}
		{/if}
	{/foreach}
{/if}

{if $product_main_pair.detailed}
	{if $number_of_product_combinations == 1}
		{foreach from=$product_combinations_grouped_by_color.color_variants item="color_variant" name="combination_image_pairs"}
			{if $color_variant.image_pair.detailed}
				{$product_main_pair.detailed.alt = $color_variant.image_pair.detailed.alt}
				{$product_main_pair.detailed.title = $color_variant.image_pair.detailed.title}
			{/if}
		{/foreach}
	{else}
		{$product_main_pair.detailed.alt = "{__("mm_functions_impression_image")} {$product.product}"}
		{$product_main_pair.detailed.title = $product_main_pair.detailed.alt}
	{/if}
{/if}

{if $product_main_pair.detailed && !$product_main_pair.detailed.alt}
	{$product_main_pair.detailed.alt = $default_image_alt}
{/if}

{if $product_main_pair.detailed}
	{$showing_images_counter = $showing_images_counter + 1}
	{$number_of_product_images = $number_of_product_images + 1}
    {assign var="image_previewer_large_image_class" value="cm-image-previewer"}
    {assign var="img_id" value="m_{$product_main_pair.pair_id}"}
    
    {if $number_of_product_combinations == 1}
    	{foreach from=$product_combinations_grouped_by_color.color_variants item="color_variant" name="combination_image_pairs"}
    		<div data-product-stock-message="{$color_variant.color_variant_and_stock_message}" data-product-incoming-stock-message="{$color_variant.incoming_stock_amount_and_date_message}">
    	{/foreach}
    {else}
    	<div data-popup-title="{$product_main_pair.detailed.alt}" data-product-stock-message="{__("mm_functions_impression_image_subtitle")}">
    {/if}
    
    {include file="common/image.tpl" images=$product_main_pair link_class=$image_previewer_large_image_class obj_id="`$preview_id`_`$img_id`" image_width=$image_width image_height=$image_height image_id="preview[product_images_`$preview_id`]"}
    </div>
{/if}
{foreach from=$product_combinations_grouped_by_color.color_variants item="color_variant" name="combination_image_pairs"}
	{if $showing_images_counter == 0 && $smarty.foreach.combination_image_pairs.iteration < 2}
    	{assign var="image_previewer_large_image_class" value="cm-image-previewer"}
    {else}
    	{assign var="image_previewer_large_image_class" value="cm-image-previewer hidden"}
    {/if}

	{$showing_images_counter = $showing_images_counter + 1}
    {assign var="img_id" value=$color_variant.combination}  
    
    <div data-product-combination="{$color_variant.combination}" data-product-color-code="{$color_variant.color_code}" data-product-stock-message="{$color_variant.color_variant_and_stock_message}" data-product-incoming-stock-message="{$color_variant.incoming_stock_amount_and_date_message}">
    	{include file="common/image.tpl" images=$color_variant.image_pair link_class=$image_previewer_large_image_class obj_id="`$preview_id`_`$img_id`" image_width=$image_width image_height=$image_height image_id="preview[product_images_`$preview_id`]"}
    </div>
{/foreach}
{if $product.image_pairs}
{foreach from=$product.image_pairs item="additional_image_pair" name="additional_image_pairs"}
	{if $showing_images_counter == 0 && $smarty.foreach.additional_image_pairs.iteration < 2}
    	{assign var="image_previewer_large_image_class" value="cm-image-previewer"}
    {else}
    	{assign var="image_previewer_large_image_class" value="cm-image-previewer hidden"}
    {/if}
	{assign var="img_id" value="a_{$additional_image_pair.pair_id}"}
	
	{if $number_of_product_combinations == 1}
    	{foreach from=$product_combinations_grouped_by_color.color_variants item="color_variant" name="combination_image_pairs"}
    		<div data-product-stock-message="{$color_variant.color_variant_and_stock_message}" data-product-incoming-stock-message="{$color_variant.incoming_stock_amount_and_date_message}">
    	{/foreach}
    {else}
    	<div data-popup-title="{$additional_image_pair.detailed.alt}" data-product-stock-message="{__("mm_functions_additional_image_subtitle")}">
    {/if}
    	{include file="common/image.tpl" images=$additional_image_pair link_class=$image_previewer_large_image_class obj_id="`$preview_id`_`$img_id`" image_width=$image_width image_height=$image_height image_id="preview[product_images_`$preview_id`]"}
    </div>
{/foreach}
{/if}
</div>

{if $number_of_product_images > 1}
    <div class="ty-product-thumbnails ty-center cm-image-gallery" id="images_preview_{$preview_id}" style="width: {$image_width}px;">
        {strip}
        	{if $product_main_pair.detailed}
                {assign var="img_id" value="m_{$product_main_pair.pair_id}"}
                <a data-ca-gallery-large-id="det_img_link_{$preview_id}_{$img_id}" class="cm-thumbnails-mini ty-product-thumbnails__item">
                {include file="common/image.tpl" images=$product_main_pair image_width=$th_size image_height=$th_size show_detailed_link=false obj_id="`$preview_id`_`$img_id`_mini" class="cm-tooltip"}
                </a>
        	{/if}
        
        	{foreach from=$product_combinations_grouped_by_color.color_variants item="color_variant"}
        		{assign var="image_pair" value=$color_variant.image_pair}
                {assign var="img_id" value=$color_variant.combination}
                <a data-ca-gallery-large-id="det_img_link_{$preview_id}_{$img_id}" class="cm-thumbnails-mini ty-product-thumbnails__item" data-product-combination="{$color_variant.combination}" data-product-color-code="{$color_variant.color_code}">
                {include file="common/image.tpl" images=$image_pair image_width=$th_size image_height=$th_size show_detailed_link=false obj_id="`$preview_id`_`$img_id`_mini" class="cm-tooltip"}
                </a>
            {/foreach}
            
            {if $product.image_pairs}
            {foreach from=$product.image_pairs item="image_pair"}
                {assign var="img_id" value="a_{$image_pair.pair_id}"}
                <a data-ca-gallery-large-id="det_img_link_{$preview_id}_{$img_id}" class="cm-thumbnails-mini ty-product-thumbnails__item" >
                {include file="common/image.tpl" images=$image_pair image_width=$th_size image_height=$th_size show_detailed_link=false obj_id="`$preview_id`_`$img_id`_mini" class="cm-tooltip"}
                </a>
            {/foreach}
            {/if}
        {/strip}
    </div>
{/if}

{include file="common/previewer.tpl"}
{script src="js/tygh/product_image_gallery.js"}

{hook name="products:product_images"}{/hook}