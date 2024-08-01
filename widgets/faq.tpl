<div class="card card-secondary">
	<div class="card-header">
		{$FAQ} ({$AMOUNT})
	</div>
    <div class="card-body pt-0">
        {if $AMOUNT <= 0}
            <div class="text-center" style="font-weight: bold;">
                {$NO_QUESTIONS_FOUND}
            </div>
        {else}
            <div id="FAQ_accordion">
                {foreach from=$QUESTIONS item=q}
                    {if isset($q->enabled) && $q->enabled == "1"}
                        <div class="card-header p-1" id="collapseHeading_{$q->nameid}">
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