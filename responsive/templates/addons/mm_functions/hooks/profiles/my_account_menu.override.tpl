{if $auth.user_id}
                {if $user_info.firstname || $user_info.lastname}
                    <li class="ty-account-info__item  ty-account-info__name ty-dropdown-box__item">{$user_info.firstname} {$user_info.lastname}</li>
                {else}
                    {if $settings.General.use_email_as_login == 'Y'}
                        <li class="ty-account-info__item ty-dropdown-box__item ty-account-info__name">{$user_info.email}</li>
                    {else}
                        <li class="ty-account-info__item ty-dropdown-box__item ty-account-info__name">{$user_info.user_login}</li>
                    {/if}
                {/if}
                <li class="ty-account-info__item ty-dropdown-box__item"><a class="ty-account-info__a" href="{"profiles.update"|fn_url}" rel="nofollow" class="underlined">{__("profile_details")}</a></li>
            {elseif $user_data.firstname || $user_data.lastname}
                <li class="ty-account-info__item  ty-dropdown-box__item ty-account-info__name">{$user_data.firstname} {$user_data.lastname}</li>
            {elseif $settings.General.use_email_as_login == 'Y' && $user_data.email}
                <li class="ty-account-info__item ty-dropdown-box__item ty-account-info__name">{$user_data.email}</li>
            {elseif $settings.General.use_email_as_login != 'Y' && $user_data.user_login}
                <li class="ty-account-info__item ty-dropdown-box__item ty-account-info__name">{$user_data.user_login}</li>
            {/if}
            <li class="ty-account-info__item ty-dropdown-box__item"><a class="ty-account-info__a" href="{"orders.search"|fn_url}" rel="nofollow" class="underlined">{__("orders")}</a></li>
            {assign var="compared_products" value=""|fn_get_comparison_products}
