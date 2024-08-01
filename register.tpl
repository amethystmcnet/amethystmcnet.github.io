{include file='header-top.tpl'}
</head>

<body>

    <div class="container">
        <div class="card register-page-card">

            <div class="register-menu">

                {if $THEME_LR_MODAL_IMAGE == "yes"}

                    {if $THEME_LR_COVERLAY == "yes"}<div class="register-overlay"></div>{/if}
                    <div class="container-fluid">
                        <div class="row no-margin-row">
                            <div class="col-lg-6">
                                <div class="card lr-card">
                                    <div class="card-body">
                                        <div class="lr-import-container">

                                            <span class="lr-title">{$CREATE_AN_ACCOUNT}</span>
                                            <br /><br />
                                            <form action="" method="post" id="form-register">
                                                {if isset($REGISTRATION_ERROR)}
                                                    <div class="alert alert-danger">
                                                        {foreach from=$REGISTRATION_ERROR item=error} {$error}
                                                        <br /> {/foreach}
                                                    </div>
                                                    {/if}



                                                    {assign var=counter value=1}
                                                    {foreach $FIELDS as $field_key => $field}
                                                    <div class="form-group">
                                                        {if $field.type eq 1}
                                                        <input class="form-control" type="text" name="{$field_key}" id="{$field_key}" value="{$field.value}"
                                                            placeholder="{$field.placeholder}" tabindex="{$counter++}" {if $field.required}
                                                            required{/if}>
                                                        {else if $field.type eq 2}
                                                        <textarea class="form-control" name="{$field_key}" id="{$field_key}" placeholder="{$field.placeholder}"
                                                            tabindex="{$counter++}"></textarea>
                                                        {else if $field.type eq 3}
                                                        <input class="form-control" type="date" name="{$field_key}" id="{$field_key}" value="{$field.value}"
                                                            tabindex="{$counter++}">
                                                        {else if $field.type eq 4}
                                                        <input class="form-control" type="password" name="{$field_key}" id="{$field_key}" value="{$field.value}"
                                                            placeholder="{$field.placeholder}" tabindex="{$counter++}" {if $field.required}
                                                            required{/if}>
                                                        {else if $field.type eq 5}
                                                        <select class="form-control" name="{$field_key}" id="{$field_key}" {if
                                                            $field.required}required{/if}>
                                                            {foreach from=$field.options item=option}
                                                            <option value="{$option.value}" {if $option.value eq $field.value} selected{/if}>
                                                                {$option.option}</option>
                                                            {/foreach}
                                                        </select>
                                                        {else if $field.type eq 6}
                                                        <input class="form-control" type="number" name="{$field_key}" id="{$field_key}" value="{$field.value}"
                                                            placeholder="{$field.name}" tabindex="{$counter++}" {if $field.required} required{/if}>
                                                        {else if $field.type eq 7}
                                                        <input class="form-control" type="email" name="{$field_key}" id="{$field_key}" value="{$field.value}"
                                                            placeholder="{$field.placeholder}" tabindex="{$counter++}" {if $field.required}
                                                            required{/if}>
                                                        {else if $field.type eq 8}
                                                        {foreach from=$field.options item=option}
                                                        <div class="form-group">
                                                            <div class="form-control" tabindex="{$counter++}">
                                                                <input type="radio" name="{$field_key}" value="{$option.value}" {if $field.value eq
                                                                    $option.value}checked{/if} {if $field.required}required{/if}>
                                                                <label>{$option.option}</label>
                                                            </div>
                                                        </div>
                                                        {/foreach}
                                                        {else if $field.type eq 9}
                                                        {foreach from=$field.options item=option}
                                                        <div class="form-group">
                                                            <div class="form-control">
                                                                <input type="checkbox" name="{$field_key}[]" value="{$option.value}" {if
                                                                    is_array($field.value) && in_array($option.value, $field.value)}checked{/if}
                                                                    tabindex="{$counter++}">
                                                                <label>{$option.option}</label>
                                                            </div>
                                                        </div>
                                                        {/foreach}
                                                        {/if}
                                                    </div>
                                                    {/foreach}

                                                <div class="row">
                                                    <div class="col-4 col-md-5 col-lg-4">
                                                        <span class="button-checkbox">
                                                            <button style="margin-top: 7px" type="button"
                                                                class="btn float-left" data-color="info" tabindex="7">
                                                                {$I_AGREE}</button>
                                                            <input type="checkbox" name="t_and_c" id="t_and_c"
                                                                style="display:none;" value="1">
                                                        </span>
                                                    </div>
                                                    <div class="col-8 col-md-7 col-lg-8">
                                                        <span class="agree-terms">{$AGREE_TO_TERMS}</span>
                                                    </div>
                                                </div>
                                                <br /> {if $CAPTCHA}
                                                        <div id="captcha" class="form-group"
                                                            style="width: 100%; justify-content: center; display: flex;">
                                                            {$CAPTCHA}
                                                        </div>
                                                    {/if}
                                                <div class="row mb-2">
                                                    <input type="hidden" name="token" value="{$TOKEN}">
                                                    <input id="timezone" type="hidden" name="timezone" value="">
                                                    <div class="col-6"><button type="submit"
                                                            class="btn btn-theme btn-block">{$REGISTER}</button></div>
                                                    <div class="col-6"><a href="{$LOGIN_URL}"
                                                            class="btn btn-theme btn-block">{$LOG_IN}</a></div>
                                                </div>
                                                {if $OAUTH_FLOW}
                                                    <a class="btn btn-secondary" href="{$OAUTH_CANCEL_REGISTER_URL}">{$CANCEL}</a>
                                                {/if}
                                            </form>

                                            {if $OAUTH_AVAILABLE and !$OAUTH_FLOW}
                                                <div class="oauth-divider"><span class="or">{$OR}</span></div>
                                                <div class="flex mb-1">
                                                    <div class="flex-grow-1">
                                                    {foreach $OAUTH_PROVIDERS as $name => $meta}
                                                    <a href="{$meta.url}" class="btn btn-secondary ml-2 mr-2" {if $meta.button_css}style="{$meta.button_css}"{/if}>
                                                        {if $meta.logo_url}
                                                        <img src="{$meta.logo_url}" {if $meta.logo_css}style="{$meta.logo_css}"{/if} alt="{$name|ucfirst}">
                                                    {elseif $meta.icon}
                                                        <i class="{$meta.icon} fa-lg"></i>
                                                    {/if}
                                                    <span {if $meta.text_css}style="{$meta.text_css}"{/if}>{$meta.continue_with}</span>
                                                    </a>
                                                {/foreach}
                                                    </div>
                                                </div>
                                            {/if}

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6 bg-col">
                                {if isset($THEME_R_BG) && $THEME_R_BG|count_characters > 4}
                                    <picture>
                                        <source srcset="none" media="(max-width: 767px)">
                                        {if isset($THEME_R_BG_WEBP) && $THEME_R_BG_WEBP|count_characters > 4}
                                            <source srcset="{$THEME_R_BG_WEBP}" type="image/webp">
                                        {/if}
                                        <source srcset="{$THEME_R_BG}">
                                        <img class="lr-bg-img" alt="logo" src='{$THEME_R_BG}'>
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

                                    <span class="lr-title">{$CREATE_AN_ACCOUNT}</span>
                                    <br /><br />
                                    <form action="" method="post" id="form-register">
                                    {if isset($REGISTRATION_ERROR)}
                                        <div class="alert alert-danger">
                                            {foreach from=$REGISTRATION_ERROR item=error} {$error}
                                            <br /> {/foreach}
                                        </div>
                                        {/if}



                                        {assign var=counter value=1}
                                        {foreach $FIELDS as $field_key => $field}
                                        <div class="form-group">
                                            {if $field.type eq 1}
                                            <input class="form-control" type="text" name="{$field_key}" id="{$field_key}" value="{$field.value}"
                                                placeholder="{$field.placeholder}" tabindex="{$counter++}" {if $field.required}
                                                required{/if}>
                                            {else if $field.type eq 2}
                                            <textarea class="form-control" name="{$field_key}" id="{$field_key}" placeholder="{$field.placeholder}"
                                                tabindex="{$counter++}"></textarea>
                                            {else if $field.type eq 3}
                                            <input class="form-control" type="date" name="{$field_key}" id="{$field_key}" value="{$field.value}"
                                                tabindex="{$counter++}">
                                            {else if $field.type eq 4}
                                            <input class="form-control" type="password" name="{$field_key}" id="{$field_key}" value="{$field.value}"
                                                placeholder="{$field.placeholder}" tabindex="{$counter++}" {if $field.required}
                                                required{/if}>
                                            {else if $field.type eq 5}
                                            <select class="form-control" name="{$field_key}" id="{$field_key}" {if
                                                $field.required}required{/if}>
                                                {foreach from=$field.options item=option}
                                                <option value="{$option.value}" {if $option.value eq $field.value} selected{/if}>
                                                    {$option.option}</option>
                                                {/foreach}
                                            </select>
                                            {else if $field.type eq 6}
                                            <input class="form-control" type="number" name="{$field_key}" id="{$field_key}" value="{$field.value}"
                                                placeholder="{$field.name}" tabindex="{$counter++}" {if $field.required} required{/if}>
                                            {else if $field.type eq 7}
                                            <input class="form-control" type="email" name="{$field_key}" id="{$field_key}" value="{$field.value}"
                                                placeholder="{$field.placeholder}" tabindex="{$counter++}" {if $field.required}
                                                required{/if}>
                                            {else if $field.type eq 8}
                                            {foreach from=$field.options item=option}
                                            <div class="form-group">
                                                <div class="form-control" tabindex="{$counter++}">
                                                    <input type="radio" name="{$field_key}" value="{$option.value}" {if $field.value eq
                                                        $option.value}checked{/if} {if $field.required}required{/if}>
                                                    <label>{$option.option}</label>
                                                </div>
                                            </div>
                                            {/foreach}
                                            {else if $field.type eq 9}
                                            {foreach from=$field.options item=option}
                                            <div class="form-group">
                                                <div class="form-control">
                                                    <input type="checkbox" name="{$field_key}[]" value="{$option.value}" {if
                                                        is_array($field.value) && in_array($option.value, $field.value)}checked{/if}
                                                        tabindex="{$counter++}">
                                                    <label>{$option.option}</label>
                                                </div>
                                            </div>
                                            {/foreach}
                                            {/if}
                                        </div>
                                        {/foreach}

                                    <div class="row">
                                        <div class="col-4 col-md-5 col-lg-4">
                                            <span class="button-checkbox">
                                                <button style="margin-top: 7px" type="button"
                                                    class="btn float-left" data-color="info" tabindex="7">
                                                    {$I_AGREE}</button>
                                                <input type="checkbox" name="t_and_c" id="t_and_c"
                                                    style="display:none;" value="1">
                                            </span>
                                        </div>
                                        <div class="col-8 col-md-7 col-lg-8">
                                            <span class="agree-terms">{$AGREE_TO_TERMS}</span>
                                        </div>
                                    </div>
                                    <br /> {if $CAPTCHA}
                                            <div id="captcha" class="form-group"
                                                style="width: 100%; justify-content: center; display: flex;">
                                                {$CAPTCHA}
                                            </div>
                                        {/if}
                                    <div class="row mb-2">
                                        <input type="hidden" name="token" value="{$TOKEN}">
                                        <input id="timezone" type="hidden" name="timezone" value="">
                                        <div class="col-6"><button type="submit"
                                                class="btn btn-theme btn-block">{$REGISTER}</button></div>
                                        <div class="col-6"><a href="{$LOGIN_URL}"
                                                class="btn btn-theme btn-block">{$LOG_IN}</a></div>
                                    </div>
                                </form>

                                {if $OAUTH_AVAILABLE and !$OAUTH_FLOW}
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
                                            <span {if $meta.text_css}style="{$meta.text_css}"{/if}>{$meta.continue_with}</span>
                                            </a>
                                        {/foreach}
                                        </div>
                                    </div>
                                {/if}


                                </div>
                            </div>
                        </div>
                    </div>

                {/if}
            </div>

        </div>
    </div>

    {if $OAUTH_FLOW && $OAUTH_EMAIL_VERIFIED}
        <script>
            document.getElementById('email').addEventListener('keyup', (e) => {
                checkEmailValidity(e.target.value);
            });
            const checkEmailValidity = (email) => {
                if ('{$OAUTH_EMAIL_VERIFIED}' && email !== '{$OAUTH_EMAIL_ORIGINAL}') {
                    addEmailCaption('{$OAUTH_EMAIL_NOT_VERIFIED_MESSAGE}', 'orange');
                } else {
                    addEmailCaption('{$OAUTH_EMAIL_VERIFIED_MESSAGE}', 'green');
                }
            }
            const addEmailCaption = (text, colour) => {
                const email = document.getElementById('email');
                document.getElementById('email-caption')?.remove();
                email.parentElement.insertAdjacentHTML('beforeend', '<div id="email-caption" style="margin-top: 5px;" class="ui basic ' + colour + ' label">' + text + '</div>');
            };
            window.onload = () => checkEmailValidity('{$EMAIL_INPUT}');
        </script>
    {/if}

    {include file='scripts.tpl'}
    {if !isset($EXCLUDE_END_BODY)}
    </body>

    </html>
{/if}