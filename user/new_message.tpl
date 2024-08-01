{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            {if isset($ERROR)}
            <div class="alert alert-danger">
                {$ERROR}
            </div>
            {/if}
            <div class="card">
                <div class="card-header header-theme" id="message-card">{$NEW_MESSAGE}</div>
                <div class="card-body">
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="inputTitle">{$MESSAGE_TITLE}</label>
                            <input type="text" id="inputTitle" class="form-control" name="title"
                                value="{$MESSAGE_TITLE_VALUE}">
                        </div>
                        <div class="form-group">
                            <label for="InputTo">{$TO} <small><em>{$SEPARATE_USERS_WITH_COMMAS}</em></small></label>
                                <select class="form-control selectpicker" id="InputTo" name="to" {if
                            isset($TO_USER)}value="{$TO_USER}" {/if} data-container="#message-card" data-live-search="true" multiple>
                                    {if count($ALL_USERS) > 0}
                                        {foreach from=$ALL_USERS item="username"}
                                            <option>{$username}</option>
                                        {/foreach}
                                    {/if}
                                </select>
                            </div> 

                            <div class="form-group">
                                <textarea style="width:100%" name="content" id="reply" rows="15"></textarea>
                            </div>
                            <div class="form-group mb-0">
                                <input type="hidden" name="token" value="{$TOKEN}">
                                <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                                <a href="{$CANCEL_LINK}" onclick="return confirm('{$CONFIRM_CANCEL}');"
                                    class="btn btn-secondary">{$CANCEL}</a>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}