{** block-description:dropdown_vertical **}
{assign var="on_category_page" value=!empty($smarty.request.dispatch) && $smarty.request.dispatch == "categories.view"}
{if $on_category_page}
	{assign var="all_featured_category_ids_with_children" value=""|fn_mm_functions_get_featured_category_ids_with_all_children_ids}
	{assign var="on_featured_category_page" value=!empty($category_data.category_id) && $category_data.category_id|in_array:$all_featured_category_ids_with_children}
	
	{assign var="themes_category_id" value=[]|fn_mm_functions_get_themes_category_id}
	{assign var="on_themes_or_child_category" value=($runtime.company_id == 38 && !empty($themes_category_id) && !empty($category_data.category_id) && ($category_data.category_id == $themes_category_id || !empty($runtime.active_category_ids) && $themes_category_id|in_array:$runtime.active_category_ids))}
{else}
	{assign var="on_featured_category_page" value=false}
	{assign var="on_themes_or_child_category" value=false}
{/if}
{assign var="on_product_page" value=!empty($smarty.request.dispatch) && $smarty.request.dispatch == "products.view"}

{capture name="home_dropdown_vertical"}
	{assign var="number_of_breadcrumbs" value=$breadcrumbs|count}
	<ul id="vmenu_{$block.block_id}" class="ty-menu__items ty-menu__featured-items{if $on_themes_or_child_category && $number_of_breadcrumbs > 2} ty-menu__featured-items-separate-last{/if} cm-responsive-menu {if $block.properties.right_to_left_orientation =="Y"} rtl{/if}">
		{if $runtime.company_id == 38}
		<li class="ty-menu__item cm-menu-item-responsive visible-phone menu-level-root ty-menu__item-active-trail ty-menu__submenu-item-header">
			<div class="ty-menu__item-icon"><i class="fa fa-home"></i></div>
			<div class="ty-menu__submenu-item-header">
				<a href="{""|fn_url}" class="ty-menu__item-link" title="{__("home")}">{__("home")}</a>
			</div>
		</li>
		{/if}
		<li class="ty-menu__item cm-menu-item-responsive menu-level-root ty-menu__item-active-trail ty-menu__submenu-item-header">
			<div class="ty-menu__item-icon"><i class="fa fa-th"></i></div>
			<div class="ty-menu__submenu-item-header">
				<a href="{"pages.view&page_id=113"|fn_url}" class="ty-menu__item-link" title="{__("mm_seo_manager_view_all_gifts_title")}">{__("mm_seo_manager_view_all_gifts")}</a>
			</div>
		</li>
		
		{if $runtime.company_id == 38 && $on_product_page && !empty($smarty.session.breadcrumb_category_id)}
			{assign var="last_visited_category_id" value=$smarty.session.breadcrumb_category_id}
			{if !empty($last_visited_category_id)}
				{assign var="themes_category_id" value=[]|fn_mm_functions_get_themes_category_id}
				{assign var="themes_child_category_ids" value=["themes_category_id" => $themes_category_id]|fn_mm_functions_get_themes_child_category_ids}
				
				{assign var="last_visited_category_is_theme_category" value=!empty($themes_category_id) && $last_visited_category_id==$themes_category_id}
				{assign var="last_visited_category_is_theme_child_category" value=!empty($themes_category_id) && !empty($themes_child_category_ids) && $last_visited_category_id|in_array:$themes_child_category_ids}
				
				{if $last_visited_category_is_theme_category || $last_visited_category_is_theme_child_category}
					{assign var="last_visited_category_name" value=$last_visited_category_id|fn_get_category_name}
					<li class="ty-menu__item cm-menu-item-responsive menu-level-root ty-menu__item-active-trail ty-menu__submenu-item-header">
						<div class="ty-menu__item-icon"><i class="fa fa-mail-reply"></i></div>
						<div class="ty-menu__submenu-item-header">
							<a href="{"categories.view&category_id={$last_visited_category_id}"|fn_url}" class="ty-menu__item-link" title="{__("mm_seo_manager_back_to_theme_title", ['[category_name]'=> {$last_visited_category_name|lower}])}">{$last_visited_category_name}</a>
						</div>
					</li>
				{/if}
			{/if}
		{/if}
		
		{if $on_themes_or_child_category}
			{foreach from=$breadcrumbs item=breadcrumb name=breadcrumbs_menu_foreach}
				{if $smarty.foreach.breadcrumbs_menu_foreach.iteration == 2 || $smarty.foreach.breadcrumbs_menu_foreach.iteration == $number_of_breadcrumbs}
				<li class="ty-menu__item cm-menu-item-responsive menu-level-root ty-menu__item-active-trail ty-menu__submenu-item-header{if empty($breadcrumb.link)} ty-menu__item-active{/if}">
					<div class="ty-menu__submenu-item-header">
						{if $smarty.foreach.breadcrumbs_menu_foreach.iteration == 2 && $number_of_breadcrumbs > 2}<div class="ty-menu__item-icon"><i class="fa fa-mail-reply"></i></div>{/if}
						<a href="{if empty($breadcrumb.link)}{"categories.view&category_id={$smarty.request.category_id}"|fn_url}{else}{$breadcrumb.link|fn_url}{/if}" class="ty-menu__item-link" title="{$breadcrumb.title}">
						{if $smarty.foreach.breadcrumbs_menu_foreach.iteration == 2}{__("mm_seo_manager_view_all_themes")}{else}{$breadcrumb.title}{/if}
						</a>
					</div>
				</li>
				{/if}
			{/foreach}
		{/if}
	</ul>
{/capture}

{capture name="featured_categories_dropdown_vertical_items"}
	{assign var="featured_categories" value=[]|fn_mm_functions_get_featured_categories}
	{if $featured_categories|count > 0 && $on_themes_or_child_category == false}
		{include file="blocks/sidebox_dropdown.tpl" items=$featured_categories separated=true submenu=false name="category" item_id="category_id" childs="subcategories" is_featured_category_menu=true}
	{/if}
{/capture}
{capture name="featured_categories_dropdown_vertical"}
	{if $smarty.capture.featured_categories_dropdown_vertical_items|trim !== ""}
	<ul id="vmenu_{$block.block_id}" class="ty-menu__items ty-menu__featured-items cm-responsive-menu {if $block.properties.right_to_left_orientation =="Y"} rtl{/if}">
		<li class="ty-menu__item ty-menu__menu-btn visible-phone">
	        <a class="ty-menu__item-link">
	            <i class="ty-icon-short-list"></i>
	            <span>{__("mm_seo_manager_featured")}</span>
	        </a>
	    </li>
        {$smarty.capture.featured_categories_dropdown_vertical_items nofilter}
    </ul>
	{/if}
{/capture}

{capture name="not_featured_categories_dropdown_vertical_items"}
	{include file="blocks/sidebox_dropdown.tpl" items=$items separated=true submenu=false name="category" item_id="category_id" childs="subcategories" is_main_category_menu=true}
{/capture}
{capture name="not_featured_categories_dropdown_vertical"}
	{if $smarty.capture.not_featured_categories_dropdown_vertical_items|trim !== ""}
	<ul id="vmenu_{$block.block_id}" class="ty-menu__items cm-responsive-menu {if $block.properties.right_to_left_orientation =="Y"} rtl{/if}">
		<li class="ty-menu__item ty-menu__menu-btn visible-phone">
	        <a class="ty-menu__item-link">
	            <i class="ty-icon-short-list"></i>
	            <span>{__("mm_seo_manager_categories")}</span>
	        </a>
	    </li>
        {$smarty.capture.not_featured_categories_dropdown_vertical_items nofilter}
    </ul>
	{/if}
{/capture}

<nav role="navigation" class="clearfix ty-menu ty-menu-vertical">
	{if $runtime.company_id == 38 && ($on_category_page || $on_product_page)}
		{$smarty.capture.home_dropdown_vertical nofilter}
		{$smarty.capture.not_featured_categories_dropdown_vertical nofilter}
		{if $on_featured_category_page}
		{$smarty.capture.featured_categories_dropdown_vertical nofilter}
		{/if}
	{else}
		{$smarty.capture.featured_categories_dropdown_vertical nofilter}
		{$smarty.capture.not_featured_categories_dropdown_vertical nofilter}
	{/if}
</nav>