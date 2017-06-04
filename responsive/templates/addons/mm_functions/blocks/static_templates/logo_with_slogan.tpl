{** block-description:mm_functions_logo_with_slogan **}
<div class="ty-logo-container logo-container">
    <a href="{""|fn_url}" title="{$logos.theme.image.alt}">
        <img src="{$logos.theme.image.image_path}" style="width:{$logos.theme.image.image_x}px; height:{$logos.theme.image.image_y}px;" alt="{$logos.theme.image.alt}" class="ty-logo-container__image logo">
        {if $logos.theme.image.alt != ""}<div class="ty-logo-container__slogan">{$logos.theme.image.alt}</div>{/if}
    </a>
</div>