<div class="card widget-card stats-card">
    <div class="card-header header-theme widget-header">{$COOKIE_NOTICE_HEADER}</div>
    <div class="card-body">
    <p>{$COOKIE_NOTICE_BODY}</p>
    {if $COOKIE_DECISION_MADE}
        <a class="btn btn-theme" href="{$COOKIE_URL}">{$COOKIE_NOTICE_CONFIGURE}</a>
    {/if}
    </div>
</div>