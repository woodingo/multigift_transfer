{if $product.discussion_type && $product.discussion_type != 'D' && $product.discussion.posts}
    <div class="ty-discussion__rating-wrapper" id="average_rating_product"{if $product.discussion.posts} itemprop="aggregateRating" itemscope itemtype="http://schema.org/AggregateRating"{/if}>
        {assign var="rating" value="rating_`$obj_id`"}{$smarty.capture.$rating nofilter}
		<a class="ty-discussion__review-write" rel="nofollow" href="#discussion"><span class="ty-discussion__review-a"><span itemprop="reviewCount">{$product.discussion.search.total_items}</span> {__("reviews", [$product.discussion.search.total_items])} {__("mm_seo_manager_with_an_average_of")} <span itemprop="ratingValue">{$product.discussion.average_rating}</span> / <span itemprop="bestRating">5</span></span></a>
    <!--average_rating_product--></div>
{/if}
