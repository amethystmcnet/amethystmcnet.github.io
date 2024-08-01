{if {$REVIEWS_ARRAY|@count} <= 0}
    <div class="row text-center my-3" id="no_reviews_container">
        <p class="ui medium text px-4">{$NO_REVIEWS}</p>
    </div>
    
{elseif {$REVIEWS_ARRAY|@count} >= 1}
    <div class="row text-center my-3" id="filter_no_reviews_container" style="display: none !important;">
        <p class="ui small text px-4">{$NO_CRITERIA}</p>
    </div>
    <div class="row my-0" id="reviews_container">
        {foreach from=$REVIEWS_ARRAY item=review}
            {if $review.unlisted_type == true}
            <div class="column col-sm-12 col-md-6 col-lg-4 col-xl-3 justify-content-md-center my-2" data-value="{$review.type_name}" data-date="{$review.date}">
                <div class="card p-0 mb-2 h-100">
                    <div class="p-3 mb-3 card-header" style="border-radius: 0.5rem 0.5rem 0 0 !important; {if $COLOURED_TYPES == '1'}background-color: #{$review.type_color} !important;{/if} font-weight: bold !important;"> 
                        {if $review.type_link != NULL}
                            <a href="{$review.type_link}">
                                {$review.type_icon}
                                {$review.type_title}
                            </a>
                        {else}
                            {$review.type_icon}
                            {$review.type_title}
                        {/if}
                    </div>
                    <div class="p-3 d-flex justify-content-between">
                        <div class="d-flex flex-row align-items-center">
                            <a href="{$review.user_profile}">
                                <img class="card_icon" src="{$review.avatar}">
                            </a>    
                            <div class="ms-2 c-details mx-3">
                                <a href="{$review.user_profile}">
                                    <h6 class="mb-0">{$review.user_name}</h6>
                                </a>    
                                <span>{$review.dateAgo}</span>
                            </div>
                        </div>
                    </div>
                    <input class="ui rating" type="hidden" value="{$review.stars}" disabled/>
                    <div class="p-3 card-body">
                        <h6 class="heading my-2">{$review.title}</h6>
                        <p class="description">{$review.description}</p>
                    </div>
                    <div class="mt-3 card-footer container {if $review.status != 2 && $STATUS_REVIEW == 1}bg-transparent{/if}">
                        <div class="row">
                            <span class="col">
                                <i class="fas fa-heart like icon like_button {if isset($LOGGED) && in_array($review.id, $REVIEWS_LIKED)}active_icon{/if}" id="{$review.id}"></i>
                                <span class="text likes_counter" value="{$review.id}">{$review.likes}</span>
                            </span>
                            {if isset($LOGGED)}
                                <span class="col text-right">
                                    {if $IS_ADMIN || $IS_MODERATOR && $APPROVE_REVIEWS == 1}
                                        <i class="fas fa-check check icon review_actions approve_icon_button" id="{$review.id}" {if $review.approved == "1"}style="display:none;"{/if} data-toggle="modal" data-target="#review_actions_modal"></i>
                                        <i class="fas fa-times remove icon review_actions unapprove_icon_button" id="{$review.id}" {if $review.approved == "1" || $review.status == "0"}style="display:none;"{/if} data-toggle="modal" data-target="#review_actions_modal"></i>
                                    {/if}
                                    {if $IS_ADMIN || ($IS_MODERATOR && $DELETE_REVIEWS == 1) || ($review.user_id == $USER_ID && $DELETE_OWN_REVIEWS == 1)}
                                        <i class="fas fa-eye-slash eye slash icon review_actions unlist_icon_button" id="{$review.id}" {if $review.status != "2"}style="display:none;"{/if} data-toggle="modal" data-target="#review_actions_modal"></i>
                                    {/if}    
                                    {if $IS_ADMIN || ($IS_MODERATOR && $RESTORE_REVIEWS == 1)}
                                        <i class="fas fa-undo-alt undo icon review_actions restore_icon_button" id="{$review.id}" {if $review.status == "2" || $review.approved == "0" }style="display:none;"{/if} data-toggle="modal" data-target="#review_actions_modal"></i>
                                    {/if}
                                    {if $IS_ADMIN || $IS_MODERATOR && $HARD_DELETE_REVIEWS == 1}
                                        <i class="fas fa-trash trash icon review_actions remove_icon_button" id="{$review.id}" data-toggle="modal" data-target="#review_actions_modal"></i>
                                    {/if}
                                </span>  
                            {/if}
                        </div>
                    </div>
                    {if $review.status != 2 && $STATUS_REVIEW == 1}
                        <div class="p-3 {if $review.status != 2 && $STATUS_REVIEW == 1}card-footer{else}card-text{/if} status_review">
                            {if $review.approved == 0 && $review.status == 0}
                            {$REVIEWS_APPROVED_PLACEHOLDER}
                            {elseif $review.approved == 1 && $review.status == 1 || $review.status == 0 }
                            {$REVIEWS_UNLISTED_PLACEHOLDER}
                            {elseif $review.approved == 0 && $review.status == 1}
                            {$REVIEWS_WAITING_FOR_PLACEHOLDER}
                            {/if}
                        </div>
                    {/if}
                </div>
            </div>
            {/if}
        {/foreach}    
    </div>
{/if}