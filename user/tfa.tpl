{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    {if isset($ERRORS)}
        <div class="alert alert-danger">
            {foreach from=$ERRORS item=error} {$error}
            <br /> {/foreach}
        </div>
    {/if}
    <div class="card">
        <div class="card-header header-theme">{$TWO_FACTOR_AUTH}</div>
        <div class="card-body">
            {if isset($TFA_SCAN_CODE_TEXT)}
            <p>{$TFA_SCAN_CODE_TEXT}</p>
            <img class="mb-3" src="{$IMG_SRC}">
            <p>{$TFA_CODE_TEXT}</p>
            <b>{$TFA_CODE}</b><br /><br />
            <a href="{$LINK}" class="btn btn-theme">{$NEXT}</a>
            <form class="d-inline-block" action="{$CANCEL_LINK}" method="post">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="submit" class="btn btn-secondary">{$CANCEL}</button>
            </form>
            {else}
            {if isset($ERROR)}
                <div class="alert alert-danger">
                    {$ERROR}
                </div>
            {/if}
            <p>{$TFA_ENTER_CODE}</p>
            <form action="" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" name="tfa_code">
                </div>
                <div class="form-group mb-0">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                    <form action="{$CANCEL_LINK}" method="post">
                        <input type="hidden" name="token" value="{$TOKEN}">
                        <button type="submit" class="btn btn-secondary">{$CANCEL}</button>
                    </form>
                </div>
            </form>
            {/if}
        </div>
    </div>
</div>
{include file='footer.tpl'}