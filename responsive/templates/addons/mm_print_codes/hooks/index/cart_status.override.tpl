{assign var="_cart_products" value=$smarty.session.cart.products|array_reverse:true}
{foreach from=$_cart_products key="key" item="p" name="cart_products"}
    {if !$p.extra.parent}
        <li class="ty-cart-items__list-item">
            {if $block.properties.products_links_type == "thumb"}
                <div class="ty-cart-items__list-item-image">
                    {include file="common/image.tpl" image_width="40" image_height="40" images=$p.main_pair no_ids=true}
                </div>
            {/if}
            <div class="ty-cart-items__list-item-desc">
                {* Edit by mashmedia, include cid *}
                {* <a href="{"products.view?product_id=`$p.product_id`"|fn_url}">{$p.product_id|fn_get_product_name nofilter}</a> *}
                <a href="{"products.view?product_id=`$p.product_id`&cid=`$key`"|fn_url}">{$p.product_id|fn_get_product_name nofilter}</a>
            <p>
                <span>{$p.amount}</span><span>&nbsp;x&nbsp;</span>{include file="common/price.tpl" value=$p.display_price span_id="price_`$key`_`$dropdown_id`" class="none"}
            </p>
            </div>
            {if $block.properties.display_delete_icons == "Y"}
                <div class="ty-cart-items__list-item-tools cm-cart-item-delete">
                    {if (!$runtime.checkout || $force_items_deletion) && !$p.extra.exclude_from_calculate}
                        {include file="buttons/button.tpl" but_href="checkout.delete.from_status?cart_id=`$key`&redirect_url=`$r_url`" but_meta="cm-ajax cm-ajax-full-render" but_target_id="cart_status*" but_role="delete" but_name="delete_cart_item"}
                    {/if}
                </div>
            {/if}
        </li>
    {/if}
{/foreach}