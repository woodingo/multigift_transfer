{hook name="categories:view"}
<div id="category_products_{$block.block_id}">
{if $subcategories or $category_data.description || $category_data.main_pair}
    {math equation="ceil(n/c)" assign="rows" n=$subcategories|count c=$columns|default:"2"}
    {split data=$subcategories size=$rows assign="splitted_subcategories"}

{if $category_data.description && $category_data.description != ""}
    <div class="ty-wysiwyg-content ty-mb-s">.{$category_data.description nofilter}</div>
{/if}

    {if $subcategories}
        <ul class="subcategories clearfix">
        {foreach from=$splitted_subcategories item="ssubcateg"}
            {foreach from=$ssubcateg item=category name="ssubcateg"}
                {if $category}
                    <li class="ty-subcategories__item">
                        <a href="{"categories.view?category_id=`$category.category_id`"|fn_url}">
                        {if $category.main_pair}
                            {include file="common/image.tpl"
                                show_detailed_link=false
                                images=$category.main_pair
                                no_ids=true
                                image_id="category_image"
                                image_width=$settings.Thumbnails.category_lists_thumbnail_width
                                image_height=$settings.Thumbnails.category_lists_thumbnail_height
                                class="ty-subcategories-img"
                            }
                        {/if}
                        {$category.category}
                        </a>
                    </li>
                {/if}
            {/foreach}
        {/foreach}
        </ul>
    {/if}

{/if}

{if $smarty.request.advanced_filter}
    {include file="views/products/components/product_filters_advanced_form.tpl" separate_form=true}
{/if}

{if $products}
{assign var="layouts" value=""|fn_get_products_views:false:0}
{if $category_data.product_columns}
    {assign var="product_columns" value=$category_data.product_columns}
{else}
    {assign var="product_columns" value=$settings.Appearance.columns_in_products_list}
{/if}

{if $layouts.$selected_layout.template}
    {include file="`$layouts.$selected_layout.template`" columns=$product_columns}
{/if}

{elseif !$subcategories || $show_no_products_block}
<p class="ty-no-items cm-pagination-container">{__("text_no_products")}</p>
{else}
<div class="cm-pagination-container"></div>
{/if}
<!--category_products_{$block.block_id}--></div>

{capture name="mainbox_title"}
	{if $category_data.heading_overrule != ""}
		{$category_data.heading_overrule|fn_mm_seo_manager_get_pattern_with_replaced_tags:$category_data}
	{else}
		{$category_data.category|fn_mm_seo_manager_get_pattern_with_replaced_tags:$category_data}
	{/if}
{/capture}
{/hook}
