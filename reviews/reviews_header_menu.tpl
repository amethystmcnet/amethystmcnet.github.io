<div class="header_menu_container my-3">
  <div class="row">
    <div class="col-11 d-flex flex-row flex-wrap">
      <div class="dropdown">
        <button class="btn btn-secondary dropdown-toggle" data-value="filter" type="button" id="reviews_filter" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Filter
        </button>
        <div class="dropdown-menu reviews_filter" aria-labelledby="reviews_filter">
        <button class="dropdown-item" id="reset" data-value="reset" style="font-weight: bold !important; padding: .5rem 1.5rem .5rem .5rem !important;" type="button">
          <i class="fas fa-broom"></i>
          <span style="margin-left: .7em !important;">
            Reset
          </span>
        </button>
          {if {$TYPES|@count} >= 1}
            {foreach from=$TYPES item=type}
              <button class="dropdown-item" data-value="{$type->name_id}" style="padding: .5rem 1.5rem .5rem .5rem !important; {if $COLOURED_TYPES == '1'}color: #{$type->color} !important;{/if} font-weight: bold !important;" type="button">
                {$type->icon}
                <span style="margin-left: .7em !important;">
                  {$type->title}
                </span>
              </button>
            {/foreach}
          {/if}
        </div>
      </div>
      <div class="dropdown" style="margin: 0 .5em;">
        <button class="btn btn-secondary dropdown-toggle" data-value="sort" type="button" id="review_sort" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          {$REVIEWS_SORT}
        </button>
        <div class="dropdown-menu review_sort" aria-labelledby="review_sort">
          <button class="dropdown-item" data-value="date_desc" style="font-weight: bold !important;" type="button" data-value="date_desc">Date - Newest To Oldest</button>
          <button class="dropdown-item" data-value="date_asc" style="font-weight: bold !important;" type="button" data-value="date_asc">Date - Oldest To Newest</button>
          <button class="dropdown-item" data-value="rating_desc" style="font-weight: bold !important;" type="button" data-value="rating_desc">Rating - Highest To Lowest</button>
          <button class="dropdown-item" data-value="rating_asc" style="font-weight: bold !important;" type="button" data-value="rating_asc">Rating - Lowest To Highest</button>
          <button class="dropdown-item" data-value="likes_desc" style="font-weight: bold !important;" type="button" data-value="likes_desc">Likes - Highest To Lowest</button>
          <button class="dropdown-item" data-value="likes_asc" style="font-weight: bold !important;" type="button" data-value="likes_asc">Likes - Lowest To Highest</button>
        </div>
      </div>
    </div>
    <div class="col-1">
      <button type="button" class="btn btn-secondary float-right" data-toggle="modal" data-target=".feedbackModal" id="feedback_button" {if $LOGGED != 'true'}disabled{/if}><i class="fas fa-plus" style="margin: auto !important;"></i></button>
    </div>
  </div>
</div>