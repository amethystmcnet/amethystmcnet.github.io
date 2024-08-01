{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    {if isset($ERRORS)}
        <div class="alert alert-danger">
            {foreach from=$ERRORS item=error} {$error}
            <br /> {/foreach}
        </div>
    {/if}
    <div class="card" id="post-edit">
        <div class="card-header header-theme">{$EDITING_PAGE}</div>
        <div class="card-body">

            <form class="form" action="" method="post" id="form-post-edit">

                <div class="form-group">
                    <textarea name="wiki_page_content" rows="15" id="inputWikiPageContent"
                            class="form-control" placeholder="{$CONTENT_LABEL}">{$CONTENT_VALUE}</textarea>
                </div>

                <input type="hidden" name="token" value="{$TOKEN}">
                <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                <a class="btn btn-secondary" href="#" data-toggle="modal" data-target="#cancelModal">{$CANCEL}</a>
            </form>
            
        </div>
    </div>
</div>

<div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="cancelModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="cancelModalLabel">{$CANCEL}</span>
            </div>
            <div class="modal-body">
                {$CONFIRM_CANCEL}<br /><br />
                <button type="button" class="btn btn-theme" data-dismiss="modal">{$NO}</button>
                <a class="btn btn-secondary" href="{$CANCEL_LINK}">{$YES}</a>
            </div>
        </div>
    </div>
</div>

{include file='footer.tpl'}