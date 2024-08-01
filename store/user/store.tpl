{include file='header.tpl'} {include file='navbar.tpl'}
<div class="container">
    <div class="row">
        <div class="col-lg-3">
            {include file='user/navigation.tpl'}
        </div>
        <div class="col-lg-9">
            <div class="card">
                <div class="card-header header-theme">{$STORE}</div>
                <div class="card-body">
                    {$CREDITS}: {$CREDITS_FORMAT_VALUE}
                </div>
            </div>
            <div class="card">
                <div class="card-header header-theme">{$MY_TRANSACTIONS}</div>
                <div class="card-body">
                    {nocache}
                    {if count($TRANSACTIONS_LIST)}
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>{$TRANSACTION}</th>
                                        <th>{$AMOUNT}</th>
                                        <th>{$DATE}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {foreach from=$TRANSACTIONS_LIST item=transaction}
                                        <tr>
                                            <td>{$transaction.transaction}</td>
                                            <td>{$transaction.amount_format}</td>
                                            <td><span data-toggle="tooltip"
                                                    title="{$transaction.date_full}">{$transaction.date_friendly}</span></td>
                                        </tr>
                                    {/foreach}
                                </tbody>
                            </table>
                        </div>
                    {else}
                        {$NO_TRANSACTIONS}
                    {/if}
                    {/nocache}
                </div>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}