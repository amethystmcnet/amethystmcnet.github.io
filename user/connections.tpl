{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">

        {if isset($SUCCESS)}
            <div class="alert alert-success">{$SUCCESS}</div>
          {/if}
          
          {if isset($ERRORS)}
          <div class="alert alert-danger">
              <ul>
                {foreach from=$ERRORS item=error}
                <li>{$error}</li>
                {/foreach}
              </ul>
          </div>
          {/if}

            <div class="card">
                <div class="card-header header-theme">{$CONNECTIONS}</div>
                <div class="card-body">
                    

                {foreach from=$INTEGRATIONS item=integration}
                    <div class="card">
                      <div class="card-body">
                      <div class="row">
                        <div class="col-md-1">
                          <svg class="connection-status-icon" width="30" height="30" viewBox="0 0 14 14" fill="{if $integration.connected}{if $integration.verified}green{else}orange{/if}{else}red{/if}" xmlns="http://www.w3.org/2000/svg">
                              <path d="M3 7C3 4.79086 4.79086 3 7 3V3C9.20914 3 11 4.79086 11 7V7C11 9.20914 9.20914 11 7 11V11C4.79086 11 3 9.20914 3 7V7Z"/>
                              <path fill-rule="evenodd" clip-rule="evenodd" d="M7 14C3.13401 14 0 10.866 0 7C0 3.13401 3.13401 0 7 0C10.866 0 14 3.13401 14 7C14 10.866 10.866 14 7 14ZM7 3C4.79086 3 3 4.79086 3 7C3 9.20914 4.79086 11 7 11C9.20914 11 11 9.20914 11 7C11 4.79086 9.20914 3 7 3Z" fill-opacity="0.27"/>
                          </svg>
                        </div>
                        <div class="col-md-8">
                          <strong>{$integration.name}</strong> 
                          {if $integration.connected && !$integration.verified}
                            <div class="label label-warning">{$PENDING_VERIFICATION}</div> {if $integration.required}<div class="ui red tiny label">{$REQUIRED}</div>{/if}
                          {else if !$integration.connected && $integration.required}
                            <div class="label label-danger">{$REQUIRED}</div>
                          {/if}
                          <br />
                          {if $integration.connected}
                            {$integration.username}
                          {else}
                            {$NOT_CONNECTED}
                          {/if}
                        </div>
                        <div class="col-md-3">
                          {if $integration.connected}
                            {if $integration.connected && !$integration.verified}
                              <form class="inline-form" action="" method="post">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <input type="hidden" name="action" value="verify">
                                <input type="hidden" name="integration" value="{$integration.name}">
                                <input type="submit" class="btn btn-theme" value="{$VERIFY}">
                              </form>
                            {/if}
                            {if $integration.can_unlink}
                            <form class="inline-form" action="" method="post">
                              <input type="hidden" name="token" value="{$TOKEN}">
                              <input type="hidden" name="action" value="unlink">
                              <input type="hidden" name="integration" value="{$integration.name}">
                              <input type="submit" class="btn btn-secondary" value="{$UNLINK}">
                            </form>
                            {/if}
                          {else}
                            <form class="inline-form" action="" method="post">
                              <input type="hidden" name="token" value="{$TOKEN}">
                              <input type="hidden" name="action" value="link">
                              <input type="hidden" name="integration" value="{$integration.name}">
                              <input type="submit" class="btn btn-theme" value="{$CONNECT}">
                            </form>
                          {/if}
                        </div>
                      </div>
                    </div>
                    </div>
                  {/foreach}


                </div>
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}