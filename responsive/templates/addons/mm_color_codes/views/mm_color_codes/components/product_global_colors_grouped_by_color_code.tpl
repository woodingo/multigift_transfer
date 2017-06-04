{* Add by mashmedia *}
{if $product.product_options}
<div class="product_colors">
	{if $product_combinations_grouped_by_color && $product_combinations_grouped_by_color.color_variants|count > 1}
		<ul>
		{foreach from=$product_combinations_grouped_by_color.color_variants key="color_variant_name" item="color_variant" name="product_combination_color_variants_foreach"}
			{assign var="linked_global_colors_params" value=['company_id' => $product.company_id, 'color_code' => $color_variant.color_code]}
			{assign var="linked_global_colors" value=$linked_global_colors_params|fn_mm_color_codes_get_linked_global_colors}
			{if $linked_global_colors}
				{assign var="number_of_linked_global_colors" value=$linked_global_colors|count}
				<li>
					{assign var="product_variation_message" value=$color_variant.amount|fn_mm_functions_get_product_variation_message:$color_variant_name}
					<span title="{if $product_variation_message}{$product_variation_message}{else} {/if}" class="cm-tooltip" onclick="return fn_mm_color_codes_show_product_thumb_by_color('{$color_variant.color_code}', this);">
						{assign var="overlap_margin_pixels" value=0}
						{foreach from=$linked_global_colors item=linked_global_color name=linked_global_colors}
							{if $smarty.foreach.linked_global_colors.iteration > 1}
								{assign var=overlap_margin_pixels value=$overlap_margin_pixels+4}
							{/if}
							
							{assign var="global_color_css_style_background" value=""}
							{if $linked_global_color.image_pair.icon.http_image_path != ""}
								{assign var="global_color_css_style_background" value="background-image: url('{$linked_global_color.image_pair.icon.image_path}');"}
							{else}
								{assign var="global_color_css_style_background" value="background-color: #{$linked_global_color.color_hex};"}
							{/if}
							
							<span style="{$global_color_css_style_background}position:relative;{if $overlap_margin_pixels > 0}left:-{$overlap_margin_pixels}px;{/if}"></span>
						{/foreach}
					</span>
				</li>
			{/if}
		{/foreach}
		</ul>
	{/if}
</div>
{/if}