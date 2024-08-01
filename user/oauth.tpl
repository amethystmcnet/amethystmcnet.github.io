{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            {if isset($SUCCESS_MESSAGE)}
            <div class="alert alert-success">
                {$SUCCESS_MESSAGE}
            </div>
            {/if}
            {if isset($ERROR_MESSAGE)}
            <div class="alert alert-danger">
                {$ERROR_MESSAGE}
            </div>
            {/if}
            <div class="card">
                <div class="card-header header-theme">{$OAUTH}</div>
                <div class="card-body">
                   
                {nocache}
                {if count($OAUTH_PROVIDERS)}
                        {foreach $OAUTH_PROVIDERS as $provider_name => $provider_data}
                        <div class="card">
                            <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-3" style="font-size: 1.2rem; margin-top: 0.3rem">
                                            {if $provider_data.icon}
                                            <i class="{$provider_data.icon} fa-lg">&nbsp;</i>
                                            {/if}
                                            {$provider_name|ucfirst}
                                        </div>
                                        <div class="col-md-6">
                                            {if isset($USER_OAUTH_PROVIDERS[$provider_name])}
                                            <div class="float-right">
                                                <code>{$USER_OAUTH_PROVIDERS[$provider_name]->provider_id}</code>
                                            </div>
                                            {/if}
                                        </div>
                                        <div class="col-md-3">
                                            {if isset($USER_OAUTH_PROVIDERS[$provider_name])}
                                            <a class="btn btn-secondary float-right" href="#" data-toggle="modal"
                                                data-target="#modal-unlink-{$provider_name}">{$UNLINK}</a>
                                            {else}
                                            <a class="btn btn-theme float-right" href="#" data-toggle="modal"
                                                data-target="#modal-link-{$provider_name}">{$LINK}</a>
                                            {/if}
                                        </div>
                                    </div>
                            </div>
                        </div>
                        {/foreach}
                {else}
                <div class="alert alert-info">
                    {$NO_PROVIDERS}
                </div>
                {/if}
                {/nocache}


                </div>
            </div>
        </div>
    </div>
</div>


{foreach $OAUTH_PROVIDERS as $provider_name => $provider_data}
    <div class="modal fade" id="modal-unlink-{$provider_name}" tabindex="-1" role="dialog" aria-labelledby="modal-unlink-{$provider_name}Label" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="modal-unlink-{$provider_name}Label">{$UNLINK} {$provider_name|ucfirst}</span>
            </div>
            <div class="modal-body">
                {$OAUTH_MESSAGES[$provider_name]['unlink_confirm']}
			    <button class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                <form class="form" action="" method="post" style="display: inline">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <input type="hidden" name="action" value="unlink">
                    <input type="hidden" name="provider" value="{$provider_name}">
                    <button type="submit" class="btn btn-theme">{$YES}</button>
                </form>
            </div>
        </div>
    </div>
    </div>

    <div class="modal fade" id="modal-link-{$provider_name}" tabindex="-1" role="dialog" aria-labelledby="modal-link-{$provider_name}Label" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="modal-link-{$provider_name}Label">{$LINK} {$provider_name|ucfirst}</span>
            </div>
            <div class="modal-body">
                {$OAUTH_MESSAGES[$provider_name]['link_confirm']}
			    <button class="btn btn-secondary" data-dismiss="modal">{$NO}</button>
                <a class="btn btn-theme" href="{$provider_data.url}">{$CONFIRM}</a>
            </div>
        </div>
    </div>
    </div>


{/foreach}

{include file='footer.tpl'}