<div class="modal fade feedbackModal" tabindex="-1" role="dialog" aria-labelledby="feedbackModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content" style="background: #161616 !important;">
     <div class="modal-header">
        <div class="modal-title">{$REVIEWS_WRITE_NEW_PLACEHOLDER}</div>
     </div>
     <div class="modal-body">
        <form class="form align-items-center feedback">
            <div class="row align-items-center text-center mt-2 mb-4">
                <div class="col">
                    <div class="dropdown select_type" id="select_type">
                        <button class="btn btn-secondary dropdown-toggle" data-value="type" type="button" id="reviews_type" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Type
                        </button>
                        <div class="dropdown-menu reviews_type" aria-labelledby="reviews_type">
                            <button class="dropdown-item" value="" style="font-weight: bold !important; float:left" type="button">
                                <span style="margin-left: .7em !important;">
                                    {$REVIEWS_TYPE_PLACEHOLDER}
                                </span>
                            </button>
                            {if {$TYPES|@count} >= 1}
                                {foreach from=$TYPES item=type}
                                <button class="dropdown-item" value="{$type->id}" style="{if $COLOURED_TYPES == '1'}color: #{$type->color} !important;{/if} font-weight: bold !important;" type="button">
                                    {$type->icon}
                                    <span style="margin-left: .7em !important;">
                                    {$type->title}
                                    </span>
                                </button>
                                {/foreach}
                            {/if}
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <!--<div class="ui rating" data-filled="glyphicon glyphicon-heart" data-empty="glyphicon glyphicon-heart-empty" data-start="5" data-stop="10"></div>-->
                    <input class="ui rating" type="hidden"/>
                </div>
                <div class="col-sm-6">
                    <label class="sr-only" for="reviewTitleInput">Name</label>
                    <input name="title" type="text" class="form-control mb-2" id="reviewTitleInput" placeholder="{$REVIEWS_TITLE_PLACEHOLDER}">
                </div>
            </div>

            <label for="thoughtsTextarea">{$REVIEWS_EXPAND_THOUGHTS_PLACEHOLDER}</label>
            <textarea class="form-control" name="textarea" id="thoughtsTextarea" rows="3"></textarea>


            <button type="submit" id="feedback_submit" name="feedback_submit" class="btn btn-theme mb-2 mt-3">{$SUBMIT_PLACEHOLDER}</button>
        </form>
     </div>
    </div>
  </div>
</div>