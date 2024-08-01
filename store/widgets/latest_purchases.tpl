<div class="card widget-card" id="widget-featured-package">
    <div class="card-header header-theme widget-header"><div class="widget-header-txt">{$LATEST_PURCHASES}</div></div>
    <div class="card-body">
        {if isset($LATEST_PURCHASES_LIST) && count($LATEST_PURCHASES_LIST)}
            {foreach from=$LATEST_PURCHASES_LIST item=purchase name=purchaseLoop}
            <div class="widget-post-flex"{if not $smarty.foreach.purchaseLoop.last} style="margin-bottom: 15px"{/if}>
                <div class="post-avatar">
                    <img src="{$purchase.avatar}" alt="{$purchase.username}" />
                </div>
                <div class="post-info">
                    <a class="username" {if $purchase.user_id}href="{$purchase.profile}" data-poload="{$USER_INFO_URL}{$purchase.user_id}" data-html="true" data-placement="top"{/if} style="{$purchase.style|replace:';':''}!important;">{$purchase.username}</a>
                    {$purchase.price_format}
                </div>
            </div>
            {/foreach}
        {else}
            {$NO_PURCHASES}
        {/if}
    </div>
</div>