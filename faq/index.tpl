{include file='header.tpl'} 
{include file='navbar.tpl'}
<div class="container">
    <div class="row d-flex justify-content-center">
        <div class="col-lg-7">
            <div class="card" style="background: transparent;">
                <div class="card-header text-center header-theme">
                    <i class="fas fa-question fa-4x mb-2"></i>
                    <h2 style="text-center">{$FAQ}</h2>
                </div>
                <div class="card-body">
                    {if $AMOUNT <= 0}
                        <div class="text-center" style="font-weight: bold;">
                            {$NO_FAQ}
                        </div>
                    {else}
                        <div id="FAQ_accordion">
                            {foreach from=$QUESTIONS item=q}
                                {if isset($q->enabled) && $q->enabled == "1"}
                                    <div class="card-header" id="collapseHeading_{$q->nameid}">
                                        <h5 class="mb-0">
                                            <button class="btn {if $q->nameid == $ACTIVE || $q->id == $ACTIVE}btn-theme{else}btn-secondary{/if} btn-block text-left" data-toggle="collapse" data-target="#collapseQuestion_{$q->nameid}" aria-expanded="true" aria-controls="collapseQuestion_{$q->nameid}">
                                            {$q->question}
                                            </button>
                                        </h5>
                                    </div>
                                    <div id="collapseQuestion_{$q->nameid}" class="collapse {if $q->nameid == $ACTIVE || $q->id == $ACTIVE}show{else}{/if}" aria-labelledby="collapseHeading_{$q->nameid}" data-parent="#FAQ_accordion">
                                        <div class="card-body mx-3">
                                            {$q->answer}
                                        </div>
                                    </div>
                                {/if}
                            {/foreach} 
                        </div>     
                    {/if}  
                    {if isset($MAIN_TITLE)}
                        <div class="text-center" style="margin: 1em;">{$MAIN_TITLE}</div>
                    {/if}
                </div>
            </div>    
        </div>
    </div>
</div> 
{include file='footer.tpl'}