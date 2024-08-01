{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="card">
        <div class="card-header header-theme">{$COOKIE_NOTICE_HEADER}</div>
        <div class="card-body">
            {$COOKIE_NOTICE}<br />
            <button class="btn btn-theme mt-4 d-inline-block" onclick="configureCookies()">{$UPDATE_SETTINGS}</button>
        </div>
    </div>
</div>
{include file='footer.tpl'}