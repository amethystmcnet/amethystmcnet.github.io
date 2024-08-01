{if isset($THEME_NAVBAR) && $THEME_NAVBAR eq 'top'}
    <nav class="navbar navbar-expand-lg navbar-theme navbar-double navbar-top-new">
        <div class="container">
            <button class="navbar-toggler nav-link" type="button"><i class="fa-solid fa-bars"></i> {$MENU}</button>
            
            {if isset($THEME_DS_BOX) && $THEME_DS_BOX|count_characters > 2}
            <div class="status-icon" onclick="copyToClipboard('#ip')">
                <svg class="creeper" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM188.3 147.1c-7.6 4.2-12.3 12.3-12.3 20.9V344c0 8.7 4.7 16.7 12.3 20.9s16.8 4.1 24.3-.5l144-88c7.1-4.4 11.5-12.1 11.5-20.5s-4.4-16.1-11.5-20.5l-144-88c-7.4-4.5-16.7-4.7-24.3-.5z"/></svg>
            </div>
            
            <a href="http://{$THEME_DISCORD_SERVER}" target="_blank">
                <div class="discord-icon">
                            <svg class="discord" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 245 240">
                                <path class="st0"
                                    d="M104.4 103.9c-5.7 0-10.2 5-10.2 11.1s4.6 11.1 10.2 11.1c5.7 0 10.2-5 10.2-11.1.1-6.1-4.5-11.1-10.2-11.1zM140.9 103.9c-5.7 0-10.2 5-10.2 11.1s4.6 11.1 10.2 11.1c5.7 0 10.2-5 10.2-11.1s-4.5-11.1-10.2-11.1z">
                                </path>
                                <path class="st0"
                                    d="M189.5 20h-134C44.2 20 35 29.2 35 40.6v135.2c0 11.4 9.2 20.6 20.5 20.6h113.4l-5.3-18.5 12.8 11.9 12.1 11.2 21.5 19V40.6c0-11.4-9.2-20.6-20.5-20.6zm-38.6 130.6s-3.6-4.3-6.6-8.1c13.1-3.7 18.1-11.9 18.1-11.9-4.1 2.7-8 4.6-11.5 5.9-5 2.1-9.8 3.5-14.5 4.3-9.6 1.8-18.4 1.3-25.9-.1-5.7-1.1-10.6-2.7-14.7-4.3-2.3-.9-4.8-2-7.3-3.4-.3-.2-.6-.3-.9-.5-.2-.1-.3-.2-.4-.3-1.8-1-2.8-1.7-2.8-1.7s4.8 8 17.5 11.8c-3 3.8-6.7 8.3-6.7 8.3-22.1-.7-30.5-15.2-30.5-15.2 0-32.2 14.4-58.3 14.4-58.3 14.4-10.8 28.1-10.5 28.1-10.5l1 1.2c-18 5.2-26.3 13.1-26.3 13.1s2.2-1.2 5.9-2.9c10.7-4.7 19.2-6 22.7-6.3.6-.1 1.1-.2 1.7-.2 6.1-.8 13-1 20.2-.2 9.5 1.1 19.7 3.9 30.1 9.6 0 0-7.9-7.5-24.9-12.7l1.4-1.6s13.7-.3 28.1 10.5c0 0 14.4 26.1 14.4 58.3 0 0-8.5 14.5-30.6 15.2z">
                                </path>
                            </svg>
                </div>
            </a>
            {/if}

            <div class="collapse navbar-collapse" id="navbar">


            {if isset($THEME_LR_SIDEBAR) && ($THEME_LR_SIDEBAR eq 'yes')}

                <ul class="navbar-nav {if $THEME_NAVBAR_ALIGNMENT == "center"}mx-auto{else}mr-auto{/if}">
                    {foreach from=$NAV_LINKS key=name item=item}
                        {if isset($item.items)}
                            <li class="nav-item dropdown more-dropdown">
                                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                                    aria-haspopup="true" aria-expanded="false">{$item.icon} {$item.title}</a>
                                <div class="dropdown-menu more-dropdown-menu">
                                    {foreach from=$item.items item=dropdown}
                                        <a class="dropdown-item" href="{$dropdown.link}"
                                            {if isset($dropdown.target) && $dropdown.target|count_characters> 2}
                                            target="{$dropdown.target}" {/if}>{$dropdown.icon} {$dropdown.title}</a>
                                    {/foreach}
                                </div>
                            </li>
                        {else}
                            {if $THEME_NAVBAR_ALIGNMENT == "left" && $THEME_STYLE_STORE_LINK == "yes"}
                                {if ($item.link !== $THEME_STORE_URL) }
                                    <li class="nav-item">
                                        <a class="nav-link{if isset($item.active)} nav-link-active{/if}{if ($THEME_STYLE_STORE_LINK == "yes") && ($item.link == $THEME_STORE_URL)} store-link{/if}"
                                            href="{$item.link}" {if isset($item.target) && $item.target|count_characters> 2}
                                            target="{$item.target}" {/if}>{$item.icon} {$item.title}</a>
                                    </li>
                                {/if}

                            {else}
                                <li class="nav-item">
                                    <a class="nav-link{if isset($item.active)} nav-link-active{/if}{if ($THEME_STYLE_STORE_LINK == "yes") && ($item.link == $THEME_STORE_URL)} store-link{/if}"
                                        href="{$item.link}" {if isset($item.target) && $item.target|count_characters> 2}
                                        target="{$item.target}" {/if}>{$item.icon} {$item.title}</a>
                                </li>
                            {/if}
                        {/if}
                    {/foreach}
                </ul>
                {if $THEME_NAVBAR_ALIGNMENT == "left"}
                    <ul class="navbar-nav ml-auto">
                        {foreach from=$NAV_LINKS key=name item=item}
                            {if !isset($item.items)}
                                {if ($THEME_STYLE_STORE_LINK == "yes") && ($item.link == $THEME_STORE_URL)}
                                    <li class="nav-item">
                                        <a class="nav-link{if isset($item.active)} nav-link-active{/if}{if ($THEME_STYLE_STORE_LINK == "yes") && ($item.link == $THEME_STORE_URL)} store-link{/if}"
                                            href="{$item.link}" {if isset($item.target) && $item.target|count_characters> 2}
                                            target="{$item.target}" {/if}>{$item.icon} {$item.title}</a>
                                    </li>
                                {/if}
                            {/if}
                        {/foreach}
                    </ul>
                {/if}

            {else}




            <ul class="navbar-nav mr-auto">
                {foreach from=$NAV_LINKS key=name item=item}
                    {if isset($item.items)}
                        <li class="nav-item dropdown more-dropdown">
                            <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                                aria-haspopup="true" aria-expanded="false">{$item.icon} {$item.title}</a>
                            <div class="dropdown-menu more-dropdown-menu">
                                {foreach from=$item.items item=dropdown}
                                    <a class="dropdown-item" href="{$dropdown.link}"
                                        {if isset($dropdown.target) && $dropdown.target|count_characters> 2}
                                        target="{$dropdown.target}" {/if}>{$dropdown.icon} {$dropdown.title}</a>
                                {/foreach}
                            </div>
                        </li>
                    {else}
                            <li class="nav-item">
                                <a class="nav-link{if isset($item.active)} nav-link-active{/if}{if ($THEME_STYLE_STORE_LINK == "yes") && ($item.link == $THEME_STORE_URL)} store-link{/if}"
                                    href="{$item.link}" {if isset($item.target) && $item.target|count_characters> 2}
                                    target="{$item.target}" {/if}>{$item.icon} {$item.title}</a>
                            </li>
                    {/if}
                {/foreach}
            </ul>
                <ul class="navbar-nav ml-auto lr-navbar">
                {foreach from=$USER_SECTION key=name item=item}
                    {if isset($item.items)}
                    <li class="nav-item dropdown {$name}-dropdown">
                    {if ($name == "account")}
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user-circle"></i></a>
                    {else}
                        <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            {if $name == "pms" || $name == "alerts"}
                                <span class="msg-{$name}">
                                    {$item.icon}
                                    <div id="{$name}" class="{$name}"></div>
                                </span>
                            {else}{$item.icon}{/if}
                        </a>
                    {/if}
                    <div class="dropdown-menu {$name}-dropdown-menu">
                        <div class="dropdown-item d-header{if ($name == "account")} d-header-flex{/if}">{$item.title} {if ($name == "account")}<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}" class="avatar-img ml-4 mb-1" style="max-height:25px;max-width:25px;" />{/if}</div>
                            {foreach from=$item.items item=dropdown}
                            {if isset($dropdown.separator)}
                            <div class="ui divider"></div>
                            {else}
                                {if isset($dropdown.action)}
                                    <a class="dropdown-item {$name}_dropdown" href="#/" data-link="{$dropdown.link}" data-action="{$dropdown.action}">
                                        {$dropdown.icon} {$dropdown.title}
                                    </a>
                                {else}
                                    <a class="dropdown-item {$name}_dropdown" href="{$dropdown.link}" target="{$dropdown.target}">
                                        {$dropdown.icon} {$dropdown.title}
                                    </a>
                                {/if}
                            {/if}
                            {/foreach}
                            {if !empty($item.meta)}
                                <a class="dropdown-item item-small" href="{$item.link}">{$item.meta}</a>
                            {/if}
                    </div>
                    </li>
                    {else}
                        <li class="nav-item">
                            <a class="nav-link bottom-nav" href="{$item.link}">
                            {if ($name == "panel")}
                                {$item.icon}
                            {elseif ($name == "register")}
                                <i class="fa-solid fa-user-plus"></i> {$item.title}
                            {else}
                                <i class="fa-solid fa-arrow-right-to-bracket"></i> {$item.title}
                            {/if}
                            </a>
                        </li>
                    {/if}
                {/foreach}
                </ul>






            {/if}








            </div>
        </div>
    </nav>
{/if}

<div {if $THEME_BLUR_HEADER_BG !== "yes"}class="color-overlay" {/if}>
    <div class="header" id="header-pjs"
        {if isset($THEME_C_OVERLAY) && $THEME_C_OVERLAY|count_characters > 2}style="opacity: {$THEME_C_OVERLAY_OPACITY}; z-index: 1"
        {else}style="opacity: 1; z-index: 4" 
        {/if}></div>
</div>

<div class="logo-ds-flex">

    {if isset($THEME_DS_BOX) && $THEME_DS_BOX|count_characters > 2}
        <div class="status-box-container">
            <div class="status-text" onclick="copyToClipboard('#ip')">
                <div class="text">
                    <div class="top-text"><span class="server-status">{$LOADING}</span></div>
                    <div class="bottom-text">
                        <div class="reel-1"><span id="ip">{$THEME_MC_SERVER}</span></div>
                        <div class="reel-1">{$MC_SERVER_CLICK}</div>
                    </div>
                </div>
                <div class="icon">
                    <div class="icon-wrapper">
                        <svg class="creeper" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM188.3 147.1c-7.6 4.2-12.3 12.3-12.3 20.9V344c0 8.7 4.7 16.7 12.3 20.9s16.8 4.1 24.3-.5l144-88c7.1-4.4 11.5-12.1 11.5-20.5s-4.4-16.1-11.5-20.5l-144-88c-7.4-4.5-16.7-4.7-24.3-.5z"/></svg>
                    </div>
                </div>
            </div>
        </div>
    {/if}

    <div class="logo-container">
        <a id="logo-link" href="/">
            {if isset($THEME_LOGO)}
            <picture>
                <source srcset="{$THEME_LOGO_WEBP}" type="image/webp">
                <source srcset="{$THEME_LOGO}">
                <img class="logo{if isset($THEME_AL) && $THEME_AL|count_characters > 2} animated-logo{/if}" alt="logo"
                    src='{$THEME_LOGO}' />
            </picture>
            {/if}
        </a>
    </div>

    {if isset($THEME_DS_BOX) && $THEME_DS_BOX|count_characters > 2}
        <div class="discord-box-container">
            <a href="http://{$THEME_DISCORD_SERVER}" target="_blank">
                <div class="discord-text">
                    <div class="icon">
                        <div class="icon-wrapper">
                            <svg class="discord" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 245 240">
                                <path class="st0"
                                    d="M104.4 103.9c-5.7 0-10.2 5-10.2 11.1s4.6 11.1 10.2 11.1c5.7 0 10.2-5 10.2-11.1.1-6.1-4.5-11.1-10.2-11.1zM140.9 103.9c-5.7 0-10.2 5-10.2 11.1s4.6 11.1 10.2 11.1c5.7 0 10.2-5 10.2-11.1s-4.5-11.1-10.2-11.1z">
                                </path>
                                <path class="st0"
                                    d="M189.5 20h-134C44.2 20 35 29.2 35 40.6v135.2c0 11.4 9.2 20.6 20.5 20.6h113.4l-5.3-18.5 12.8 11.9 12.1 11.2 21.5 19V40.6c0-11.4-9.2-20.6-20.5-20.6zm-38.6 130.6s-3.6-4.3-6.6-8.1c13.1-3.7 18.1-11.9 18.1-11.9-4.1 2.7-8 4.6-11.5 5.9-5 2.1-9.8 3.5-14.5 4.3-9.6 1.8-18.4 1.3-25.9-.1-5.7-1.1-10.6-2.7-14.7-4.3-2.3-.9-4.8-2-7.3-3.4-.3-.2-.6-.3-.9-.5-.2-.1-.3-.2-.4-.3-1.8-1-2.8-1.7-2.8-1.7s4.8 8 17.5 11.8c-3 3.8-6.7 8.3-6.7 8.3-22.1-.7-30.5-15.2-30.5-15.2 0-32.2 14.4-58.3 14.4-58.3 14.4-10.8 28.1-10.5 28.1-10.5l1 1.2c-18 5.2-26.3 13.1-26.3 13.1s2.2-1.2 5.9-2.9c10.7-4.7 19.2-6 22.7-6.3.6-.1 1.1-.2 1.7-.2 6.1-.8 13-1 20.2-.2 9.5 1.1 19.7 3.9 30.1 9.6 0 0-7.9-7.5-24.9-12.7l1.4-1.6s13.7-.3 28.1 10.5c0 0 14.4 26.1 14.4 58.3 0 0-8.5 14.5-30.6 15.2z">
                                </path>
                            </svg>
                        </div>
                    </div>
                    <div class="text">
                        <div class="top-text"><span class="discord-status">{$LOADING}</span></div>
                        <div class="bottom-text">
                            <div class="reel-1">{$THEME_DISCORD_SERVER}</div>
                            <div class="reel-1">{$DISCORD_SERVER_CLICK}</div>
                        </div>
                    </div>
                </div>
            </a>
        </div>
    {/if}

</div>

<div class="coldfire-navbar-menu">
    <div class="nav-header">
        <div class="nav-header-text theme-text">{$smarty.const.SITE_NAME}</div>
        <div id="nav-header-close" class="nav-header-close btn btn-secondary ml-4"><i class="fa-solid fa-xmark"></i></div>
    </div>
    <ul>
        {foreach from=$NAV_LINKS key=name item=item}
            {if isset($item.items)}
                <li class="nav-item dropdown more-dropdown">
                    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true"
                        aria-expanded="false">{$item.icon} {$item.title}</a>
                    <div class="dropdown-menu more-dropdown-menu">
                        {foreach from=$item.items item=dropdown}
                            <a class="dropdown-item" href="{$dropdown.link}"
                                {if isset($dropdown.target) && $dropdown.target|count_characters> 2} target="{$dropdown.target}"
                                {/if}>{$dropdown.icon} {$dropdown.title}</a>
                        {/foreach}
                    </div>
                </li>
            {else}
                <li class="nav-item">
                    <a class="nav-link{if isset($item.active)} nav-link-active{/if}" href="{$item.link}"
                        {if isset($item.target) && $item.target|count_characters> 2} target="{$item.target}" {/if}>{$item.icon}
                        {$item.title}</a>
                </li>
            {/if}
        {/foreach}

        <div class="divider"></div>

        {if isset($THEME_NAVBAR) && ($THEME_NAVBAR eq 'bottom' || $THEME_NAVBAR eq 'top')}
            {foreach from=$USER_SECTION key=name item=item}
                {if isset($item.items)}
                <li class="nav-item dropdown {$name}-dropdown">
                {if ($name == "account")}
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user-circle"></i> {$item.title}</a>
                {else}
                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        {if $name == "pms" || $name == "alerts"}
                            <span class="msg-{$name}">
                                {$item.icon}
                                <div id="{$name}" class="{$name}"></div>
                            </span>
                        {else}{$item.icon}{/if} {$item.title}
                    </a>
                {/if}
                <div class="dropdown-menu {$name}-dropdown-menu">
                    <div class="dropdown-item d-header{if ($name == "account")} d-header-flex{/if}">{$item.title} {if ($name == "account")}<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}" class="avatar-img ml-4 mb-1" style="max-height:25px;max-width:25px;" />{/if}</div>
                        {foreach from=$item.items item=dropdown}
                        {if isset($dropdown.separator)}
                        <div class="ui divider"></div>
                        {else}
                            {if isset($dropdown.action)}
                                <a class="dropdown-item {$name}_dropdown" href="#/" data-link="{$dropdown.link}" data-action="{$dropdown.action}">
                                    {$dropdown.icon} {$dropdown.title}
                                </a>
                            {else}
                                <a class="dropdown-item {$name}_dropdown" href="{$dropdown.link}" target="{$dropdown.target}">
                                    {$dropdown.icon} {$dropdown.title}
                                </a>
                            {/if}
                        {/if}
                        {/foreach}
                        {if !empty($item.meta)}
                            <a class="dropdown-item item-small" href="{$item.link}">{$item.meta}</a>
                        {/if}
                </div>
                </li>
                {else}
                    <li class="nav-item">
                        <a class="nav-link bottom-nav" href="{$item.link}">
                        {if ($name == "panel")}
                            <span data-toggle="tooltip" data-placement="right" data-offset="0 10px" title="{$item.title}">{$item.icon} {$item.title}</span>
                        {elseif ($name == "register")}
                            <span data-toggle="tooltip" data-placement="right" data-offset="0 10px" title="{$item.title}"><i class="fa-solid fa-user-plus"></i></span> {$item.title}
                        {else}
                            <span data-toggle="tooltip" data-placement="right" data-offset="0 10px" title="{$item.title}"><i class="fa-solid fa-arrow-right-to-bracket"></i></span> {$item.title}
                        {/if}
                        </a>
                    </li>
                {/if}
            {/foreach}
        {/if}

        </ul>
    </div>

    <div class="overlay"></div>
    {if (isset($LOGGED_IN_USER)) || ($THEME_WB_T|count_characters < 2 && !isset($LOGGED_IN_USER))}

    {if isset($THEME_LR_SIDEBAR) && ($THEME_LR_SIDEBAR eq 'yes')}
     <div class="user-box">
            <div class="header-btn-row">
                <nav class="navbar">
                    <ul class="navbar-nav">
                            {foreach from=$USER_SECTION key=name item=item}
                                {if isset($item.items)}
                                <li class="nav-item dropright {$name}-dropdown">
                                {if ($name == "account")}
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user-circle"></i></a>
                                {else}
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        {if $name == "pms" || $name == "alerts"}
                                            <span class="msg-{$name}">
                                                {$item.icon}
                                                <div id="{$name}" class="{$name}"></div>
                                            </span>
                                        {else}{$item.icon}{/if}
                                    </a>
                                {/if}
                                <div class="dropdown-menu {$name}-dropdown-menu">
                                    <div class="dropdown-item d-header{if ($name == "account")} d-header-flex{/if}">{$item.title} {if ($name == "account")}<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}" class="avatar-img ml-4 mb-1" style="max-height:25px;max-width:25px;" />{/if}</div>
                                        {foreach from=$item.items item=dropdown}
                                        {if isset($dropdown.separator)}
                                        <div class="ui divider"></div>
                                        {else}
                                            {if isset($dropdown.action)}
                                                <a class="dropdown-item {$name}_dropdown" href="#/" data-link="{$dropdown.link}" data-action="{$dropdown.action}">
                                                    {$dropdown.icon} {$dropdown.title}
                                                </a>
                                            {else}
                                                <a class="dropdown-item {$name}_dropdown" href="{$dropdown.link}" target="{$dropdown.target}">
                                                    {$dropdown.icon} {$dropdown.title}
                                                </a>
                                            {/if}
                                        {/if}
                                        {/foreach}
                                        {if !empty($item.meta)}
                                            <a class="dropdown-item item-small" href="{$item.link}">{$item.meta}</a>
                                        {/if}
                                </div>
                                </li>
                                {else}
                                    <li class="nav-item">
                                        <a class="nav-link bottom-nav" href="{$item.link}">
                                        {if ($name == "panel")}
                                            <span data-toggle="tooltip" data-placement="right" data-offset="0 10px" title="{$item.title}">{$item.icon}</span>
                                        {elseif ($name == "register")}
                                            <span data-toggle="tooltip" data-placement="right" data-offset="0 10px" title="{$item.title}"><i class="fa-solid fa-user-plus"></i></span>
                                        {else}
                                            <span data-toggle="tooltip" data-placement="right" data-offset="0 10px" title="{$item.title}"><i class="fa-solid fa-arrow-right-to-bracket"></i></span>
                                        {/if}
                                        </a>
                                    </li>
                                {/if}
                            {/foreach}
                        </ul>
                    </nav>
                </div>
            </div>
        {/if}
        {/if}


        <div class="container top-container">

            {if isset($THEME_NAVBAR) && $THEME_NAVBAR eq 'bottom'}
                <nav class="navbar navbar-expand-lg navbar-theme navbar-double navbar-bottom">
                    <button class="navbar-toggler nav-link" type="button"><i class="fa-solid fa-bars"></i> {$MENU}</button>

        {if isset($THEME_DS_BOX) && $THEME_DS_BOX|count_characters > 2}
        <div class="status-icon" onclick="copyToClipboard('#ip')">
                    <svg class="creeper" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path
                            d="M4,2H20A2,2 0 0,1 22,4V20A2,2 0 0,1 20,22H4A2,2 0 0,1 2,20V4A2,2 0 0,1 4,2M6,6V10H10V12H8V18H10V16H14V18H16V12H14V10H18V6H14V10H10V6H6Z">
                        </path>
                    </svg>
        </div>
        
        <a href="http://{$THEME_DISCORD_SERVER}" target="_blank">
            <div class="discord-icon">
                        <svg class="discord" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 245 240">
                            <path class="st0"
                                d="M104.4 103.9c-5.7 0-10.2 5-10.2 11.1s4.6 11.1 10.2 11.1c5.7 0 10.2-5 10.2-11.1.1-6.1-4.5-11.1-10.2-11.1zM140.9 103.9c-5.7 0-10.2 5-10.2 11.1s4.6 11.1 10.2 11.1c5.7 0 10.2-5 10.2-11.1s-4.5-11.1-10.2-11.1z">
                            </path>
                            <path class="st0"
                                d="M189.5 20h-134C44.2 20 35 29.2 35 40.6v135.2c0 11.4 9.2 20.6 20.5 20.6h113.4l-5.3-18.5 12.8 11.9 12.1 11.2 21.5 19V40.6c0-11.4-9.2-20.6-20.5-20.6zm-38.6 130.6s-3.6-4.3-6.6-8.1c13.1-3.7 18.1-11.9 18.1-11.9-4.1 2.7-8 4.6-11.5 5.9-5 2.1-9.8 3.5-14.5 4.3-9.6 1.8-18.4 1.3-25.9-.1-5.7-1.1-10.6-2.7-14.7-4.3-2.3-.9-4.8-2-7.3-3.4-.3-.2-.6-.3-.9-.5-.2-.1-.3-.2-.4-.3-1.8-1-2.8-1.7-2.8-1.7s4.8 8 17.5 11.8c-3 3.8-6.7 8.3-6.7 8.3-22.1-.7-30.5-15.2-30.5-15.2 0-32.2 14.4-58.3 14.4-58.3 14.4-10.8 28.1-10.5 28.1-10.5l1 1.2c-18 5.2-26.3 13.1-26.3 13.1s2.2-1.2 5.9-2.9c10.7-4.7 19.2-6 22.7-6.3.6-.1 1.1-.2 1.7-.2 6.1-.8 13-1 20.2-.2 9.5 1.1 19.7 3.9 30.1 9.6 0 0-7.9-7.5-24.9-12.7l1.4-1.6s13.7-.3 28.1 10.5c0 0 14.4 26.1 14.4 58.3 0 0-8.5 14.5-30.6 15.2z">
                            </path>
                        </svg>
            </div>
        </a>
        {/if}

                    <div class="collapse navbar-collapse" id="navbar">
                        <ul class="navbar-nav mr-auto">
                            {foreach from=$NAV_LINKS key=name item=item}
                                {if isset($item.items)}
                                    <li class="nav-item dropdown more-dropdown">
                                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button"
                                            aria-haspopup="true" aria-expanded="false">{$item.icon} {$item.title}</a>
                                        <div class="dropdown-menu more-dropdown-menu">
                                            {foreach from=$item.items item=dropdown}
                                                <a class="dropdown-item" href="{$dropdown.link}"
                                                    {if isset($dropdown.target) && $dropdown.target|count_characters> 2}
                                                    target="{$dropdown.target}" {/if}>{$dropdown.icon} {$dropdown.title}</a>
                                            {/foreach}
                                        </div>
                                    </li>
                                {else}
                                    {if (isset($THEME_LR_SIDEBAR) && ($THEME_LR_SIDEBAR eq 'yes')) || !$LOGGED_IN_USER}
                                    {if $THEME_STYLE_STORE_LINK == "yes"}
                                        {if ($item.link !== $THEME_STORE_URL) }
                                            <li class="nav-item">
                                                <a class="nav-link {if isset($item.active)}nav-link-active{/if}{if ($THEME_STYLE_STORE_LINK == "yes") && ($item.link == $THEME_STORE_URL)} store-link{/if}"
                                                    href="{$item.link}" {if isset($item.target) && $item.target|count_characters> 2}
                                                    target="{$item.target}" {/if}>{$item.icon} {$item.title}</a>
                                            </li>
                                        {/if}

                                    {else}
                                        <li class="nav-item">
                                            <a class="nav-link {if isset($item.active)}nav-link-active{/if}{if ($THEME_STYLE_STORE_LINK == "yes") && ($item.link == $THEME_STORE_URL)} store-link{/if}"
                                                href="{$item.link}" {if isset($item.target) && $item.target|count_characters> 2}
                                                target="{$item.target}" {/if}>{$item.icon} {$item.title}</a>
                                        </li>
                                    {/if}
                                    {else}
                                        <li class="nav-item">
                                    <a class="nav-link {if isset($item.active)}nav-link-active{/if}{if ($THEME_STYLE_STORE_LINK == "yes") && ($item.link == $THEME_STORE_URL)} store-link{/if}"
                                        href="{$item.link}" {if isset($item.target) && $item.target|count_characters> 2}
                                        target="{$item.target}" {/if}>{$item.icon} {$item.title}</a>
                                </li>
                                    {/if}
                                {/if}
                            {/foreach}
                        </ul>
                        <ul class="navbar-nav ml-auto{if isset($THEME_LR_SIDEBAR) && ($THEME_LR_SIDEBAR eq 'no')} lr-navbar{/if}">
                        {if (isset($THEME_LR_SIDEBAR) && ($THEME_LR_SIDEBAR eq 'yes')) || !$LOGGED_IN_USER}
                            {foreach from=$NAV_LINKS key=name item=item}
                                {if !isset($item.items)}
                                    {if ($THEME_STYLE_STORE_LINK == "yes") && ($item.link == $THEME_STORE_URL)}
                                        <li class="nav-item">
                                            <a class="nav-link {if isset($item.active)}nav-link-active{/if}{if ($THEME_STYLE_STORE_LINK == "yes") && ($item.link == $THEME_STORE_URL)} store-link{/if}"
                                                href="{$item.link}" {if isset($item.target) && $item.target|count_characters> 2}
                                                target="{$item.target}" {/if}>{$item.icon} {$item.title}</a>
                                        </li>
                                    {/if}
                                {/if}
                            {/foreach}
                        {else}

                            {foreach from=$USER_SECTION key=name item=item}
                                {if isset($item.items)}
                                <li class="nav-item dropdown {$name}-dropdown">
                                {if ($name == "account")}
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user-circle"></i></a>
                                {else}
                                    <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        {if $name == "pms" || $name == "alerts"}
                                            <span class="msg-{$name}">
                                                {$item.icon}
                                                <div id="{$name}" class="{$name}"></div>
                                            </span>
                                        {else}{$item.icon}{/if}
                                    </a>
                                {/if}
                                <div class="dropdown-menu {$name}-dropdown-menu">
                                    <div class="dropdown-item d-header{if ($name == "account")} d-header-flex{/if}">{$item.title} {if ($name == "account")}<img src="{$LOGGED_IN_USER.avatar}" alt="{$LOGGED_IN_USER.username}" class="avatar-img ml-4 mb-1" style="max-height:25px;max-width:25px;" />{/if}</div>
                                        {foreach from=$item.items item=dropdown}
                                        {if isset($dropdown.separator)}
                                        <div class="ui divider"></div>
                                        {else}
                                            {if isset($dropdown.action)}
                                                <a class="dropdown-item {$name}_dropdown" href="#/" data-link="{$dropdown.link}" data-action="{$dropdown.action}">
                                                    {$dropdown.icon} {$dropdown.title}
                                                </a>
                                            {else}
                                                <a class="dropdown-item {$name}_dropdown" href="{$dropdown.link}" target="{$dropdown.target}">
                                                    {$dropdown.icon} {$dropdown.title}
                                                </a>
                                            {/if}
                                        {/if}
                                        {/foreach}
                                        {if !empty($item.meta)}
                                            <a class="dropdown-item item-small" href="{$item.link}">{$item.meta}</a>
                                        {/if}
                                </div>
                                </li>
                                {else}
                                    <li class="nav-item">
                                        <a class="nav-link bottom-nav" href="{$item.link}">
                                        {if ($name == "panel")}
                                            {$item.icon}
                                        {elseif ($name == "register")}
                                            <i class="fa-solid fa-user-plus"></i> {$item.title}
                                        {else}
                                            <i class="fa-solid fa-arrow-right-to-bracket"></i> {$item.title}
                                        {/if}
                                        </a>
                                    </li>
                                {/if}
                            {/foreach}

                        {/if}
                            
                        </ul>
                    </div>
                </nav>
            {/if}

            {if isset($MUST_VALIDATE_ACCOUNT)}
                <div class="alert alert-danger">
                    {$MUST_VALIDATE_ACCOUNT}
                </div>
            {/if}
            {if !$LOGGED_IN_USER}
                {if $THEME_WB_T|count_characters > 0}
                    {if isset($THEME_STORE_BOX_ENABLE) && $THEME_STORE_BOX_ENABLE|count_characters > 2}
                        <div class="row">
                            <div class="col-lg-9">

                            <div class="card mb-2 welcome-card">
                            <div class="card-body">
                                <div class="welcome-card-flex">
                                    <div class="welcome-av-col">
                                        <picture>
                                            <source srcset="none" media="(max-width: 767px)">
                                            <source
                                                srcset="https://s.namemc.com/3d/skin/body.png?id={$THEME_WB_SKIN_ID}&model=classic&theta=32&phi=19&time=90&width=150&height=200"
                                                media="(min-width: 768px)">
                                            <img src="https://s.namemc.com/3d/skin/body.png?id={$THEME_WB_SKIN_ID}&model=classic&theta=32&phi=19&time=90&width=150&height=200"
                                                alt="Avatar" class="welcome-avatar" height="160px" width="auto" />
                                        </picture>
                                    </div>
                                    <div class="welcome-text-col">
                                        <span class="welcome-title">{$THEME_WB_T}</span><br />
                                        <span class="welcome-text">{$THEME_WB_D}</span><br />
                                    </div>
                                    <div class="welcome-lr-col">
    
                                        
                                        {foreach from=$USER_SECTION key=name item=item}
                                            {if !isset($item.items)}
                                                {if ($name == "register")}
                                                    <a class="btn btn-theme" href="{$item.link}" target="{$item.target}">{$item.title}</a>
                                                {else}
                                                    <a class="btn btn-theme" href="{$item.link}" target="{$item.target}">{$item.title}</a>
                                                {/if}
                                            {/if}
                                        {/foreach}
    
                                    </div>
                                </div>
                            </div>
                        </div>

                            </div>
                            <div class="col-lg-3">
                                {* Store *}
                                {include file='template_settings/widgets/store_widget.tpl'}
                            </div>
                        </div>
                    {else}
                    <div class="card mb-3 mt-3 welcome-card">
                        <div class="card-body">
                            <div class="welcome-card-flex">
                                <div class="welcome-av-col">
                                    <picture>
                                        <source srcset="none" media="(max-width: 767px)">
                                        <source
                                            srcset="https://s.namemc.com/3d/skin/body.png?id={$THEME_WB_SKIN_ID}&model=classic&theta=32&phi=19&time=90&width=150&height=200"
                                            media="(min-width: 768px)">
                                        <img src="https://s.namemc.com/3d/skin/body.png?id={$THEME_WB_SKIN_ID}&model=classic&theta=32&phi=19&time=90&width=150&height=200"
                                            alt="Avatar" class="welcome-avatar" />
                                    </picture>
                                </div>
                                <div class="welcome-text-col">
                                    <span class="welcome-title">{$THEME_WB_T}</span><br />
                                    <span class="welcome-text">{$THEME_WB_D}</span><br />
                                </div>
                                <div class="welcome-lr-col">

                                {foreach from=$USER_SECTION key=name item=item}
                                    {if !isset($item.items)}
                                        {if ($name == "register")}
                                            <a class="btn btn-theme" href="{$item.link}" target="{$item.target}">{$item.title}</a>
                                        {else}
                                            <a class="btn btn-theme" href="{$item.link}" target="{$item.target}">{$item.title}</a>
                                        {/if}
                                    {/if}
                                {/foreach}

                                </div>
                            </div>
                        </div>
                    </div>
                    {/if}
                {/if}
            {/if}

            {if !empty($ANNOUNCEMENTS)}
                {foreach from=$ANNOUNCEMENTS item=$ANNOUNCEMENT}
                    <div class="alert announcement-alert mt-3{if $ANNOUNCEMENT->closable} alert-dismissible fade show{/if}"
                        id="announcement-{$ANNOUNCEMENT->id}"
                        style="background-color:{$ANNOUNCEMENT->background_colour} !important; color:{$ANNOUNCEMENT->text_colour} !important"
                        role="alert">
                        {if isset($ANNOUNCEMENT->icon)}
                            <i class="{$ANNOUNCEMENT->icon} float-left mr-3" style="font-size: 2rem; margin-top: 0.5rem"></i>
                        {/if}
                        <b style="font-size: 17px">{$ANNOUNCEMENT->header}</b><br />{$ANNOUNCEMENT->message|escape}
                        {if $ANNOUNCEMENT->closable}
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        {/if}
                    </div>
                {/foreach}
            {/if}

            <div class="alert alert-danger" id="ie-message">
                {$INTERNET_EXPLORER_HEADER}: {$INTERNET_EXPLORER_INFO}
            </div>

            <div class="chatbox mb-3" id="chatbox-top"></div>
        </div>

        {if !isset($LOGGED_IN_USER)}

            <div id="loginModal" class="modal fade login-modal-lg" tabindex="-1" role="dialog" aria-labelledby="loginModal"
                aria-hidden="true">
                <div class="modal-dialog {if $THEME_LR_MODAL_IMAGE == "yes"}modal-lg{else}modal-md{/if}">
                    <div class="modal-content">
                        <div class="login-menu"></div>
                    </div>
                </div>
            </div>


            <div id="registerModal" class="modal fade register-modal-lg" tabindex="-1" role="dialog" aria-labelledby="registerModal"
                aria-hidden="true">
                <div class="modal-dialog {if $THEME_LR_MODAL_IMAGE == "yes"}modal-lg{else}modal-md{/if}">
                    <div class="modal-content">
                        <div class="register-menu"></div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="loginRegisterError" tabindex="-1" role="dialog" aria-labelledby="loginRegisterErrorLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="loginRegisterErrorLabel">{$LR_ERROR}</span>
            </div>
            <div class="modal-body">
            {$LR_ERROR_1}<br />
            {$LR_ERROR_2}<br />
            {$LR_ERROR_3}
            </div>
        </div>
    </div>
</div>

        {/if}
        