{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    {if isset($ERRORS)}
        <div class="alert alert-danger">
            {foreach from=$ERRORS item=error} {$error}
            <br /> {/foreach}
        </div>
    {/if}
    <div class="alert alert-success">
        {$AUTHME_INFO}
    </div>
    <div class="card">
        <div class="card-header header-theme">{$CONNECT_WITH_AUTHME}</div>
        <div class="card-body">
            <form action="" method="post" id="form-authme-email">
 
		    <div class="form-group">
                        <label for="inputEmail">{$EMAIL}</label>
                        <input class="form-control" type="email" id="inputEmail" name="email" placeholder="{$EMAIL}">
                    </div>
 
                    {if isset($NICKNAME)}
                    <div class="form-group">
                        <label for="inputNickname">{$NICKNAME}</label>
                        <input class="form-control" type="text" id="inputNickname" name="nickname" placeholder="{$NICKNAME}">
                    </div>
                    {/if}               
 
                <div class="form-group">
                    <input type="hidden" name="token" value="{$TOKEN}">
                    <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                </div>
            </form>
        </div>
    </div>
</div>
{include file='footer.tpl'}