{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            {if (isset($ERRORS) || isset($ERROR))}
                <div class="alert alert-danger">
                    {foreach from=$ERRORS item=error} {$error}
                    <br /> {/foreach}
                    {if isset($ERROR)}
                        {$ERROR}
                    {/if}
                </div>
            {/if}
            {if !empty($SUCCESS)}
                <div class="alert alert-success">
                    {$SUCCESS}
                </div>
            {/if}
            <div class="card">
                <div class="card-header header-theme">{$SETTINGS}</div>
                <div class="card-body">
                    <form action="" method="post">
                        {nocache}

                        {if isset($TOPIC_UPDATES)}
                            <div class="form-group">
                                <label for="inputTopicUpdates">{$TOPIC_UPDATES}</label>
                                <select class="form-control" name="topicUpdates" id="inputTopicUpdates">
                                    <option value="1" {if ($TOPIC_UPDATES_ENABLED==true)} selected {/if}>{$ENABLED}</option>
                                    <option value="0" {if ($TOPIC_UPDATES_ENABLED==false)} selected {/if}>{$DISABLED}
                                    </option>
                                </select>
                            </div>
                        {/if}

                        <div class="form-group">
                            <label for="inputLanguage">{$ACTIVE_LANGUAGE}</label>
                            <select name="language" id="inputLanguage" class="form-control">
                                {foreach from=$LANGUAGES item=language}
                                    <option value="{$language.name}" {if $language.active == true} selected{/if}>
                                        {$language.name}</option>
                                {/foreach}
                            </select>
                        </div>

                        {if isset($CUSTOM_AVATARS)}
                            <div class="form-group">
                                <label for="inputGravatar">{$GRAVATAR}</label>
                                <select class="form-control" name="gravatar" id="inputGravatar">
                                    <option value="0" {if ($GRAVATAR_VALUE == '0')} selected{/if}>{$DISABLED}</option>
                                    <option value="1" {if ($GRAVATAR_VALUE == '1')} selected{/if}>{$ENABLED}</option>
                                </select>
                            </div>
                        {/if}

                        {if count($TEMPLATES) > 1}
                            <div class="form-group">
                                <label for="inputTemplate">{$ACTIVE_TEMPLATE}</label>
                                <select class="form-control" name="template" id="inputTemplate">
                                    {foreach from=$TEMPLATES item=template}
                                        <option value="{$template.id}" {if $template.active == true} selected{/if}>
                                            {$template.name}</option>
                                    {/foreach}
                                </select>
                            </div>
                        {/if}

                        <div class="form-group">
                            <label for="inputTimezone">{$TIMEZONE}</label>
                            <select name="timezone" class="form-control" id="inputTimezone">
                                {foreach from=$TIMEZONES key=KEY item=ITEM}
                                    <option value="{$KEY}" {if $SELECTED_TIMEZONE eq $KEY} selected{/if}>
                                        ({$ITEM.offset}) - {$ITEM.name} ({$ITEM.time})
                                    </option>
                                {/foreach}
                            </select>
                        </div>
                        {if isset($AUTHME_SYNC_PASSWORD)}
                            <div class="form-group">
                                <label for="inputAuthmeSync">
                                    {$AUTHME_SYNC_PASSWORD}
                                    <div class="ui icon label mini" data-toggle="tooltip" data-trigger="hover" data-original-title="{$AUTHME_SYNC_PASSWORD_INFO}">
                                        <i class="fa-solid fa-circle-question"></i>
                                    </div>
                                </label>
                                <select class="ui fluid dropdown" name="authmeSync" id="inputAuthmeSync">
                                    <option value="1" {if ($AUTHME_SYNC_PASSWORD_ENABLED == true)} selected {/if}>{$ENABLED}</option>
                                    <option value="0" {if ($AUTHME_SYNC_PASSWORD_ENABLED == false)} selected {/if}>{$DISABLED}</option>
                                </select>
                            </div>
                        {/if}
                        {if isset($PRIVATE_PROFILE)}
                            <div class="form-group">
                                <label for="inputPrivateProfile">{$PRIVATE_PROFILE}</label>
                                <select name="privateProfile" class="form-control" id="inputPrivateProfile">
                                    <option value="1" {if $PRIVATE_PROFILE_ENABLED == true} selected {/if}>{$ENABLED}
                                    </option>
                                    <option value="0" {if $PRIVATE_PROFILE_ENABLED == false} selected {/if}>{$DISABLED}
                                    </option>
                                </select>
                            </div>
                        {/if}
                        {foreach from=$PROFILE_FIELDS key=name item=field}
                            <div class="form-group">
                                {if !isset($field.disabled)}
                                    <label for="input{$field.id}">{$field.name}</label> {if $field.type == "text"}
                                        <input type="text" class="form-control" name="{if $name == 'nickname'}nickname{else}profile_fields[{$field.id}]{/if}" id="input{$field.id}"
                                        value="{$field.value}" placeholder="{$field.description}"> {else if $field.type == "textarea"}
                                        <textarea class="form-control" name="profile_fields[{$field.id}]"
                                        id="input{$field.id}" placeholder="{$field.description}">{$field.value}</textarea> {else if $field.type == "date"}
                                        <input name="profile_fields[{$field.id}]" id="input{$field.id}" value="{$field.value}" type="date"
                                        class="form-control"> {/if}
                                {/if}
                            </div>
                        {/foreach}
                        {if isset($SIGNATURE)}
                            <label for="inputSignature">{$SIGNATURE}</label>
                            <textarea style="width:100%" name="signature" id="inputSignature" rows="15">{$SIGNATURE_VALUE}</textarea><br />
                        {/if}
                        {/nocache}
                        <div class="form-group">
                            <input type="hidden" name="action" value="settings">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="card">
                <div class="card-header header-theme">{$CHANGE_EMAIL_ADDRESS}</div>
                <div class="card-body">
                    <form action="" method="post" id="form-user-email">
                        <div class="form-group">
                            <label for="inputPassword">{$CURRENT_PASSWORD}</label>
                            <input type="password" name="password" id="inputPassword" class="form-control">
                        </div>
                        <div class="form-group">
                            <label for="inputEmail">{$EMAIL_ADDRESS}</label>
                            <input type="email" name="email" id="inputEmail" value="{$CURRENT_EMAIL}"
                                class="form-control">
                        </div>
                        <input type="hidden" name="action" value="email">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                    </form>
                </div>
            </div>
            <div class="card">
                <div class="card-header header-theme">{$CHANGE_PASSWORD}</div>
                <div class="card-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="inputOldPassword">{$CURRENT_PASSWORD}</label>
                            <input type="password" name="old_password" id="inputOldPassword" class="form-control">
                        </div>

                        <div class="form-group">
                            <label for="inputNewPassword">{$NEW_PASSWORD}</label>
                            <input type="password" name="new_password" id="inputNewPassword" class="form-control">
                        </div>

                        <div class="form-group">
                            <label for="inputNewPasswordAgain">{$CONFIRM_NEW_PASSWORD}</label>
                            <input type="password" name="new_password_again" id="inputNewPasswordAgain"
                                class="form-control">
                        </div>

                        <input type="hidden" name="action" value="password">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                    </form>
                </div>
            </div>
            <div class="card">
                <div class="card-header header-theme">{$TWO_FACTOR_AUTH}</div>
                <div class="card-body">
                    {nocache}
                    {if isset($ENABLE)}
                        <a class="btn btn-theme" href="{$ENABLE_LINK}">{$ENABLE}</a>
                    {elseif isset($FORCED)}
                        <button class="btn btn-secondary" disabled>{$DISABLE}</button>
                    {else}
                        <form action="{$DISABLE_LINK}" method="post">
                            <input type="hidden" name="token" value="{$TOKEN}">
                            <input type="submit" value="{$DISABLE}" class="btn btn-secondary">
                        </form>
                    {/if}
                    {/nocache}
                </div>
            </div>
            {if isset($CUSTOM_AVATARS)}
                <div class="card">
                    <div class="card-header header-theme">{$UPLOAD_NEW_PROFILE_IMAGE}</div>
                    <div class="card-body">
                        <form action="{$CUSTOM_AVATARS_SCRIPT}" method="post" enctype="multipart/form-data">
                            <div class="form-group">
                                <label class="btn btn-secondary">
                                    {$BROWSE} <input type="file" name="file" hidden />
                                </label>
                            </div>
                            <div class="form-group">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="hidden" name="type" value="avatar">
                                <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                            </div>
                        </form>
                    </div>
                </div>
            {/if}
            {if $HAS_CUSTOM_AVATAR}
            <div class="card">
                <div class="card-header header-theme">{$REMOVE_AVATAR}</div>
                <div class="card-body">
                <form class="ui form" action="" method="post" id="form-reset-avatar">
                    <input type="hidden" name="action" value="reset_avatar">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="submit" class="btn btn-secondary">{$REMOVE}</button>
                </form>
                </div>
            </div>
            {/if}
        </div>
    </div>
</div>
{include file='footer.tpl'}