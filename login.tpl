{include file='header-top.tpl'}
</head>

<body>
    <div class="container">
        <div class="card login-page-card">

            <div class="login-menu">

                {if $THEME_LR_MODAL_IMAGE == "yes"}

                    {if $THEME_LR_COVERLAY == "yes"}<div class="login-overlay"></div>{/if}
                    <div class="container-fluid">
                        <div class="row no-margin-row">
                            <div class="col-lg-6">
                                <div class="card lr-card">
                                    <div class="card-body">
                                        <div class="lr-import-container">

                                            <span class="lr-title">{$SIGN_IN}</span>
                                            <br /><br />
                                            <form id="form-login" role="form" action="" method="post">
                                                {if count($ERROR)}
                                                    <div class="alert alert-danger" role="alert">
                                                        {foreach from=$ERROR item=error name=err} {$error}
                                                            {if not $smarty.foreach.err.last}<br />{/if} {/foreach}
                                                        </div>
                                                    {/if}
                                                    {if isset($EMAIL)}
                                                        <div class="form-group">
                                                            <input type="email" class="form-control" style="width: 100%"
                                                                name="email" id="email" value="{$USERNAME_INPUT}"
                                                                placeholder="{$EMAIL}" tabindex="1">
                                                        </div>
                                                    {else}
                                                        <div class="form-group">
                                                            <input type="text" class="form-control" style="width:100%;"
                                                                name="username" id="username" value="{$USERNAME_INPUT}"
                                                                placeholder="{$USERNAME}" tabindex="1">
                                                        </div>
                                                    {/if}
                                                    <div class="form-group">
                                                        <input type="password" class="form-control" style="width: 100%;"
                                                            name="password" id="password" autocomplete="off"
                                                            placeholder="{$PASSWORD}" tabindex="2">
                                                    </div>

                                                    <div class="form-group" style="margin-bottom: 5rem !important">
                                                        <span class="button-checkbox">
                                                            <button style="max-width: 100%" type="button" class="btn float-left"
                                                                data-color="info" tabindex="3"> {$REMEMBER_ME}</button>
                                                            <input type="checkbox" name="remember" id="remember"
                                                                style="display:none;" value="1">
                                                        </span>
                                                    </div>

                                                    {if $CAPTCHA}
                                                        <div id="captcha" class="form-group"
                                                            style="width: 100%; justify-content: center; display: flex;">
                                                            {$CAPTCHA}
                                                        </div>
                                                    {/if}
                                                    <input type="hidden" name="token" value="{$FORM_TOKEN}">
                                                    <div class="form-group">
                                                        <div class="row">
                                                            <div class="col-6">
                                                                <button type="submit" class="btn btn-theme btn-block"
                                                                    tabindex="5">{$SIGN_IN}</button>
                                                            </div>
                                                            <div class="col-6">
                                                                <a class="btn btn-theme btn-block"
                                                                    href="{$REGISTER_URL}">{$REGISTER}</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>

                                                {if $OAUTH_AVAILABLE}
                                                    <div class="oauth-divider"><span class="or">{$OR}</span></div>
                                                    <div class="flex">
                                                        <div class="flex-grow-1">
                                                        {foreach $OAUTH_PROVIDERS as $name => $meta}
                                                            <a href="{$meta.url}" class="btn btn-secondary ml-2 mr-2" {if $meta.button_css}style="{$meta.button_css}"{/if}>
                                                                {if $meta.logo_url}
                                                                <img src="{$meta.logo_url}" {if $meta.logo_css}style="{$meta.logo_css}"{/if} alt="{$name|ucfirst}">
                                                            {elseif $meta.icon}
                                                                <i class="{$meta.icon} fa-lg"></i>
                                                            {/if}
                                                            <span {if $meta.text_css}style="{$meta.text_css}"{/if}>{$meta.log_in_with}</span>
                                                            </a>
                                                        {/foreach}
                                                        </div>
                                                    </div>
                                                {/if}
                                                <a class="grey-link fp-link mt-4 d-inline-block"
                                                            href="{$FORGOT_PASSWORD_URL}">{$FORGOT_PASSWORD}</a>
    


                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 bg-col">
                                    {if isset($THEME_L_BG) && $THEME_L_BG|count_characters > 4}
                                        <picture>
                                            <source srcset="none" media="(max-width: 767px)">
                                            {if isset($THEME_L_BG_WEBP) && $THEME_L_BG_WEBP|count_characters > 4}
                                                <source srcset="{$THEME_L_BG_WEBP}" type="image/webp">
                                            {/if}
                                            <source srcset="{$THEME_L_BG}">
                                            <img class="lr-bg-img" alt="logo" src='{$THEME_L_BG}'>
                                        </picture>
                                    {/if}
                                </div>
                            </div>
                        </div>

                    {else}

                        <div class="container-fluid">
                            <div class="card lr-card">
                                <div class="card-body">
                                    <div class="lr-import-container">
                                        <span class="lr-title">{$SIGN_IN}</span>
                                        <br /><br />
                                        <form id="form-login" role="form" action="" method="post">
                                            {if count($ERROR)}
                                                <div class="alert alert-danger" role="alert">
                                                    {foreach from=$ERROR item=error name=err} {$error}
                                                        {if not $smarty.foreach.err.last}<br />{/if} {/foreach}
                                                    </div>
                                                {/if}
                                                {if isset($EMAIL)}
                                                    <div class="form-group">
                                                        <input type="email" class="form-control" style="width: 100%" name="email"
                                                            id="email" value="{$USERNAME_INPUT}" placeholder="{$EMAIL}" tabindex="1">
                                                    </div>
                                                {else}
                                                    <div class="form-group">
                                                        <input type="text" class="form-control" style="width:100%;" name="username"
                                                            id="username" value="{$USERNAME_INPUT}" placeholder="{$USERNAME}"
                                                            tabindex="1">
                                                    </div>
                                                {/if}
                                                <div class="form-group">
                                                    <input type="password" class="form-control" style="width: 100%;" name="password"
                                                        id="password" autocomplete="off" placeholder="{$PASSWORD}" tabindex="2">
                                                </div>

                                                <div class="form-group" style="margin-bottom: 5rem !important">
                                                    <span class="button-checkbox">
                                                        <button style="max-width: 100%" type="button" class="btn float-left"
                                                            data-color="info" tabindex="3"> {$REMEMBER_ME}</button>
                                                        <input type="checkbox" name="remember" id="remember" style="display:none;"
                                                            value="1">
                                                    </span>
                                                </div>

                                                {if $CAPTCHA}
                                                    <div id="captcha" class="form-group"
                                                        style="width: 100%; justify-content: center; display: flex;">
                                                        {$CAPTCHA}
                                                    </div>
                                                {/if}
                                                <input type="hidden" name="token" value="{$FORM_TOKEN}">
                                                <div class="form-group">
                                                    <div class="row">
                                                        <div class="col-6">
                                                            <button type="submit" class="btn btn-theme btn-block"
                                                                tabindex="5">{$SIGN_IN}</button>
                                                        </div>
                                                        <div class="col-6">
                                                            <a class="btn btn-theme btn-block"
                                                                href="{$REGISTER_URL}">{$REGISTER}</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>

                                            {if $OAUTH_AVAILABLE}
                                                <div class="oauth-divider"><span class="or">{$OR}</span></div>
                                                <div class="flex">
                                                    <div class="flex-grow-1">
                                                    {foreach $OAUTH_PROVIDERS as $name => $meta}
                                                    <a href="{$meta.url}" class="btn btn-secondary ml-2 mr-2" {if $meta.button_css}style="{$meta.button_css}"{/if}>
                                                        {if $meta.logo_url}
                                                        <img src="{$meta.logo_url}" {if $meta.logo_css}style="{$meta.logo_css}"{/if} alt="{$name|ucfirst}">
                                                    {elseif $meta.icon}
                                                        <i class="{$meta.icon} fa-lg"></i>
                                                    {/if}
                                                    <span {if $meta.text_css}style="{$meta.text_css}"{/if}>{$meta.log_in_with}</span>
                                                    </a>
                                                {/foreach}
                                                    </div>
                                                </div>
                                            {/if}

                                            <a class="grey-link fp-link mt-4 d-inline-block"
                                                            href="{$FORGOT_PASSWORD_URL}">{$FORGOT_PASSWORD}</a>

                                        </div>
                                    </div>
                                </div>
                            </div>

                        {/if}
                    </div>

                </div>
            </div>

            {include file='scripts.tpl'}
            {if !isset($EXCLUDE_END_BODY)}
            </body>

            </html>
        {/if}