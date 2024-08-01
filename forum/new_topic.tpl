{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    {if isset($ERROR)}
        <div class="alert alert-danger">
            {foreach from=$ERROR item=item name=arr} {$item}
            <br /> {/foreach}
        </div>
    {/if}
    <div class="card">
        <div class="card-header header-theme">{$CREATING_TOPIC_IN}</div>
        <div class="card-body">
            <div class="container">
                <form action="" method="post" id="form-new-topic">
                    <div class="form-group">
                        <input type="text" class="form-control form-control-lg" name="title" placeholder="{$TOPIC_TITLE}" maxlength="64" value="{$TOPIC_VALUE}">
                    </div>
                    {if count($LABELS)}
                    <div class="form-group">
                        {foreach from=$LABELS item=label}
                        <label for="{$label.id}">{$label.html}</label>
                        <input type="checkbox" name="topic_label[]" id="{$label.id}" value="{$label.id}"{if $label.checked} checked{/if}> {/foreach}
                    </div>
                    {/if}
                    <div class="form-group">
                        <textarea style="width:100%" name="content" id="reply" rows="20"></textarea>
                    </div>
                    {$TOKEN}
                    <button type="submit" class="btn btn-theme">{$SUBMIT}</button>
                    <a href="#" class="btn btn-secondary" data-toggle="modal" data-target="#cancelModal">{$CANCEL}</a>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Cancellation modal -->
<div class="modal fade" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="cancelModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <span class="modal-title" id="cancelModalLabel">{$CANCEL}</span>
            </div>
            <div class="modal-body">
                <p>{$CONFIRM_CANCEL}</p>
                <a href="{$FORUM_LINK}" class="btn btn-theme">{$CANCEL}</a>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{$CLOSE}</button>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}