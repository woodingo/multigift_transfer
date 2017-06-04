<div id="mm-all-categories-page">
	{assign var="mm_categorie_tree" value="0"|fn_get_categories_tree}
	<h1>{__("mm_functions_all_categories_title", ['[store_name]'=>$runtime.company_data.company])}</h1>
	
	{if $smarty.session.mm_breadcrumb_category_id}
		{assign var="subs" value=$smarty.session.mm_breadcrumb_category_id|fn_get_subcategories}	
	
		{if $subs}
			{assign var="referer_category_name" value=$smarty.session.mm_breadcrumb_category_id|fn_get_category_name|lower}
			<h2>{__("mm_functions_all_categories_subtitle_referer", ['[category_name]'=>$referer_category_name])}</h2>
			<ul class="mm-subcategories clearfix" id="subcategories">
				{foreach from=$subs item=sub}
					{if $sub}
						<li class="ty-subcategories__item">
							<a href="{"categories.view?category_id=`$sub.category_id`"|fn_url}" title="{$sub.category}">
							{if $sub.main_pair}
								{include file="common/image.tpl"
									show_detailed_link=false
									images=$sub.main_pair
									no_ids=true
									image_id="category_image"
									image_height=80
									class="ty-subcategories-img"
								}
							{/if}
							{$sub.category}
							</a>
						</li>
					{/if}
				{/foreach}
			</ul>
		{/if}
	{/if}
	{function menu level=0}   
		<ul class="{if $level>0}submenu{else}mm_categories{/if}">
		{foreach $data as $cat_item}
			<li class="{if $cat_item.subcategories}has-dropdown{/if}">
				{assign var="cat_url" value="categories.view&category_id=%s"|sprintf:$cat_item.category_id}
				{assign var="seo_url" value=$cat_url|fn_url}
				<a href="{$seo_url}">{$cat_item.category}</a>
				{if $cat_item.subcategories}
					<span class="menu-icon fa fa-chevron-down"></span>
					{menu level=$level+1 data=$cat_item.subcategories}
				{/if}
			</li>
		{/foreach}
		</ul>
	{/function}
	
	{assign var="cat_tree_length" value=$mm_categorie_tree|count}
	{math assign="chunk_size" equation="ceil(x / y)" x=$cat_tree_length y=4}
	
	
	{assign var="cat_chunks" value=$mm_categorie_tree|array_chunk:$chunk_size}
	<h2>{__("mm_functions_all_categories_subtitle_all")}</h2>
	<div class="row mm-all-categories">
	{foreach $cat_chunks as $chunk}
		<div class="span4">
			{menu data=$chunk}
		</div>
	{/foreach}
	</div>
</div>