{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            {if isset($ERROR)}
                <div class="alert alert-danger">{$ERROR}</div>
            {/if}
            <div class="card">
                <div class="card-header header-theme">{$ALERTS}</div>
                <div class="card-body">
                    {nocache} {if count($ALERTS_LIST)} {foreach from=$ALERTS_LIST item=alert}
                        <div class="card">
                            <div class="card-body p-3">
                                {$alert->content}<br />
                                <a class="white-link" href="{$alert->view_link}">{$CLICK_TO_VIEW}</a>
				                <span class="float-right" data-toggle="tooltip" data-trigger="hover" data-original-title="{$alert->date}">{$alert->date_nice}</span>
                            </div>
                        </div>
                    {/foreach}

                      <form action="{$DELETE_ALL_LINK}" method="post" style="display:inline">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <button type="submit" class="btn btn-secondary mt-1">{$DELETE_ALL}</button>
                      </form>

                    {else} {$NO_ALERTS} {/if} {/nocache}
                </div>
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}