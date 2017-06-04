{** block-description:mm_ajax_blocks_menu_dropdown_horizontal **}
{if !empty($smarty.request.dispatch) && $smarty.request.dispatch !== "mm_ajax_blocks.load_block"}<div id="mm_ajax_block_{$block.block_id}" class="mm_ajax_block" data-mm-ajax-block-id="{$block.block_id}" data-mm-ajax-block-trigger="hover">{/if}
	<nav role="navigation">{include file="blocks/topmenu_dropdown.tpl" items=$items  item1_url=true name="item" item_id="param_id" childs="subitems"}</nav>
{if !empty($smarty.request.dispatch) && $smarty.request.dispatch !== "mm_ajax_blocks.load_block"}</div>{/if}