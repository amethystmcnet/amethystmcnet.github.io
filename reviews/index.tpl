{include file='header.tpl'}
{include file='navbar.tpl'}
<style>
.like_button, .remove_icon_button, .unlist_icon_button, .unapprove_icon_button, .approve_icon_button, .restore_icon_button{
	cursor: pointer;
    padding: .2em;
}
.remove_icon_button:hover{
	color: #FF673B;
}
.unlist_icon_button:hover{
	color: #FFBB3B;
}
.approve_icon_button:hover{
	color: #8BDE28;
}
.unapprove_icon_button:hover{
	color: #D73C12;
}
.restore_icon_button:hover{
	color: #3CB4D1;
}
.like_button:hover{
	color: #ff2733;
}
.like_button:active{
	color: #ff2733;
}
.ui.ok:hover{
    background-color: transparent !important;
    color: white !important;
}
.ui.feed>.event>.label+.content{
    margin: 0.5em 0 0.5em 0.4em !important;
}

.ui.statistic>.label, .ui.statistics .statistic>.label{
    color: unset !important;
}

.no_shadow{
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
}

#reviews_container .card_icon {
    width: 45px;
    height: 45px;
    background-color: #eee;
    border-radius: 15px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 39px
}

.ui.rating {
    padding: 0 1rem !important;
}

.active_icon{
    color: #ff2733 !important;
}

.column i{
    font-size: 1.1em;
}


.rating-symbol {
    display: inline-block;
    border-radius: 50%;
    border: none !important;
    text-align: center;
}

.rating-symbol i{
    color: #edc837;
}

</style>

{include file="reviews/review_modal.tpl"}

<div class="container">
    <div class="card" style="background: transparent !important;">
        <div class="card-header header-theme">{$REVIEWS_KEYWORD}</div>
        <div class="card-body">
                {if $AMOUNT < 1}
                    {$NO_REVIEWS}
                {else}
                    <div class="row justify-content-md-center">
                        <div class="col col-lg-5">
                            <div class="card card-sm bg-transparent no_shadow">
                                <div class="card-body">
                                    <div class="text-center">
                                        <span class="d-block display-4 mb-2"><i class="fas fa-star-half-alt"></i> {$AVERAGE_SCORE}</span>
                                        <span class="d-block font-15 font-weight-500"></span>
                                        <small class="d-block">{$REVIEWS_OUT_OF}</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                {/if} 
                    
                {include file="reviews/reviews_header_menu.tpl"}
                {include file="reviews/reviews_container.tpl"}
                 
        </div>
    </div>
</div>

<div class="modal fade review_actions_modal" id="review_actions_modal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <!-- Remove section -->
            <div class="modal-header modal-title review_actions_modal_remove">
                {$REVIEWS_ACTIONS_TITLE_PLACEHOLDER|replace:'X': {$REVIEWS_REMOVE|ucfirst} }
                <i class="fas fa-trash-alt"></i>
            </div>
            <div class="content review_actions_modal_remove modal-body">
                {$REVIEWS_ACTIONS_PLACEHOLDER|replace:'X': {$REVIEWS_REMOVE} }
            </div>

            <!-- Unlist section -->
            <div class="modal-header modal-title review_actions_modal_unlist">
                {$REVIEWS_ACTIONS_TITLE_PLACEHOLDER|replace:'X': {$REVIEWS_UNLIST|ucfirst} }
                <i class="fas fa-eye-slash"></i>
            </div>
            <div class="content review_actions_modal_unlist modal-body">
                {$REVIEWS_ACTIONS_PLACEHOLDER|replace:'X': {$REVIEWS_UNLIST} }
            </div>

            <!-- Approve section -->
            <div class="modal-header modal-title review_actions_modal_approve">
                {$REVIEWS_ACTIONS_TITLE_PLACEHOLDER|replace:'X': {$REVIEWS_APPROVE|ucfirst} }
                <i class="fas fa-check"></i>
            </div>
            <div class="content review_actions_modal_approve modal-body">
                {$REVIEWS_ACTIONS_PLACEHOLDER|replace:'X': {$REVIEWS_APPROVE} }
            </div>

            <!-- Unapprove section -->
            <div class="modal-header modal-title review_actions_modal_unapprove">
                {$REVIEWS_ACTIONS_TITLE_PLACEHOLDER|replace:'X': {$REVIEWS_UNAPPROVE|ucfirst} }
                <i class="fas fa-times"></i>
            </div>
            <div class="content review_actions_modal_unapprove modal-body">
                {$REVIEWS_ACTIONS_PLACEHOLDER|replace:'X': {$REVIEWS_UNAPPROVE} }
            </div>

            <!-- Restore section -->
            <div class="modal-header modal-title review_actions_modal_restore">
                {$REVIEWS_ACTIONS_TITLE_PLACEHOLDER|replace:'X': {$REVIEWS_RESTORE|ucfirst} }
                <i class="fas fa-undo-alt"></i>
            </div>
            <div class="content review_actions_modal_restore modal-body">
                {$REVIEWS_ACTIONS_PLACEHOLDER|replace:'X': {$REVIEWS_RESTORE} }
            </div>

            <!-- Actions -->
            <div class="modal-footer actions">
                <div class="btn btn-secondary cancel" data-dismiss="modal">
                {$NO_PLACEHOLDER}
                </div>
                <div class="btn btn-theme ok">
                {$YES_PLACEHOLDER}
                </div>
            </div>
        </div>
    </div>
</div>
{include file='footer.tpl'}
<script>{include file='reviews/js/scripts.js'}</script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script>{include file='reviews/js/bootstrap-rating.min.js'}</script>