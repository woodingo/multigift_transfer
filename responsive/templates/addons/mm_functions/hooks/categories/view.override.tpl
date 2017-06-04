{hook name="categories:view"}
<div id="category_products_{$block.block_id}">
{if $subcategories or $category_data.description || $category_data.main_pair}
    {math equation="ceil(n/c)" assign="rows" n=$subcategories|count c=$columns|default:"2"}
    {split data=$subcategories size=$rows assign="splitted_subcategories"}
{if $category_data.description && $category_data.description != ""}
    <div class="ty-wysiwyg-content ty-mb-s">{$category_data.description nofilter}</div>
{/if}

{assign var="description_discussion_suffix_messages_params" value=['category_id'=>$category_data.category_id]}
{assign var="description_discussion_suffix_messages" value=$description_discussion_suffix_messages_params|fn_mm_functions_get_description_discussion_suffix_messages}
{if !empty($description_discussion_suffix_messages)}
<div id="description_discussion_suffix">
	<a class="description_discussion_suffix_messages_toggler description_discussion_suffix_messages_toggler_collapsed">
		<h3>{__("mm_functions_category_description_discussion_suffix_heading", ['[category_name]'=>$category_data.category|lower])}
			<i class="ty-icon-down-micro cm-tooltip" title="{__("mm_functions_category_description_discussion_suffix_messages_expander_button")}"></i>
			<i class="ty-icon-up-micro cm-tooltip" title="{__("mm_functions_category_description_discussion_suffix_messages_collapser_button")}"></i>
		</h3>
	</a>
	<div class="description_discussion_suffix_messages">
	{foreach from=$description_discussion_suffix_messages item=description_discussion_suffix_message}
	<p><i class="fa fa-quote-left"></i>{$description_discussion_suffix_message|truncate:700:"..." nofilter}<i class="fa fa-quote-right"></i></p>
	{/foreach}
	</div>
</div>
{/if}

    {if $subcategories}
    <div id="subcategories_container">
		{assign var="subcategories_heading" value=__("mm_functions_subcategories_heading")}
		{assign var="category_name_lowercase" value=$category_data.category|lower}
    	{if $subcategories_heading}<h2>{__("mm_functions_subcategories_heading", ['[category]'=>$category_name_lowercase])}</h2>{/if}
        <ul id="subcategories" class="subcategories clearfix">
        {foreach from=$splitted_subcategories item="ssubcateg"}
            {foreach from=$ssubcateg item=category name="ssubcateg"}
                {if $category}
                    <li class="ty-subcategories__item">
                    		{assign var="category_href" value="categories.view?category_id=`$category.category_id`"|fn_url}
                    		<a href="{$category_href}" class="ty-subcategories__item-image" title="{$category.category}">
                    			<span>
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
                    				{else}
                    					{assign var="category_first_product_data" value=$category.category_id|fn_mm_functions_get_first_product_in_category}
		                    			{include file="common/image.tpl"
			                                show_detailed_link=false
			                                images=$category_first_product_data.main_pair
			                                no_ids=true
			                                image_id="category_image"
			                                image_width=$settings.Thumbnails.category_lists_thumbnail_width
			                                image_height=$settings.Thumbnails.category_lists_thumbnail_height
			                                class="ty-subcategories-img"
			                            }
                    				{/if}
	                    		</span>
                    		</a>
                    		<a class="ty-subcategories__item-name" href="{$category_href}" title="{$category.category}">
	                    		<div>
	                    			<span>{$category.category}</span>
	                    		</div>
                    		</a>
                        </a>
                    </li>
                {/if}
            {/foreach}
        {/foreach}
        </ul>
        </div>
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

{capture name="mainbox_title"}{$category_data.category}{/capture}
{/hook}