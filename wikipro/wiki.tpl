{* Wiki Pro Module Cobalt Integration created by Drew! With <3 from Co0kei as well! Teamwork! *}
{include file='header.tpl'} {include file='navbar.tpl'}

<style>

    .wiki-pro-menu {
        background-color: #161616;
        border-radius: 0.25rem;
        /*margin-bottom: 1rem;*/
        /*padding-bottom: 0.5rem;*/
    }

    .wiki-pro-menu .nav {
        flex-direction: column;
    }

    .wiki-pro-menu .menu-title {
        font-weight: 600;
        font-size: 1.4rem;
        padding: 1rem 1.75rem;
    }

    .wiki-pro-menu-link {
        padding: 1.05rem calc(1.75rem - 5px);
        display: block;
        position: relative;
        border-left: 5px solid transparent;
    }

    .wiki-pro-menu-link i {
        font-size: 2rem;
        position: absolute;
        top: 0.7rem;
        color: rgba(255, 255, 255, 0.03);
    }

    .wiki-pro-menu-link span {
        display: inline-block;
        margin-left: 3.6rem;
        font-weight: 600;
        font-size: 1.1rem;
        text-transform: uppercase;
        color: rgba(255, 255, 255, 0.4);
        transition: 0.25s;
    }

    .wiki-pro-menu-link:hover {
        background-color: rgba(255, 255, 255, 0.03);
    }

    .btn.active { 
        filter: brightness(60%) !important;
    }

</style>

<div class="container">

    {* Success messages *}
    {if isset($SESSION_SUCCESS_POST)}
        <div class="alert alert-success alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            {$SESSION_SUCCESS_POST}
        </div>
    {/if}

    {* error messages *}
    {if isset($ERROR)}
        <div class="alert alert-danger alert-dismissible">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            {$ERROR}
        </div>
    {/if}

    {if isset($WIKI_PRO_UPDATE)}
        {if $NEW_UPDATE_URGENT eq true}
            <div class="alert alert-danger alert-dismissible">
        {else}
            <div class="alert alert-info alert-dismissible">
        {/if}
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <strong><a href="{$NAMELESS_UPDATE_LINK}" class="">{$NEW_UPDATE}</a></strong>
        </div>
    {/if}

    <div class="row">

        {if count($PAGES)}

            {* Display side wiki page menu *}
            <div class="col-lg-3 identifiera">

                {* z index makes the searchbar result show above the page content *}
                <div {if $STICKY_SIDEBAR}id="stickybar" style="z-index:10;"{/if}>

                    <div class="card">
                        <div class="card-header mb-3" style="padding-bottom: 0px; padding-top: 1rem;">
                        {* style="max-height: 400px;" *}

                            <style>
                                .ignoreHoverAnimation {
                                    opacity: 1 !important;
                                    filter: brightness(1) !important;
                                }
                            </style>

                            {* Search bar *}
                            <div class="input-group">
                                <input class="form-control input-sm" onkeyup="search_for()" type="text" name="search" id="searchbar" placeholder="{$SEARCH}">
                                <span class="input-group-btn">
                                    <button type="submit" class="btn btn-theme ignoreHoverAnimation" disabled>    
                                        <i class="fa-solid fa-magnifying-glass"></i>
                                    </button>
                                </span>
                            </div>

                            {* Search bar dropdown results *}
                            <div id="list" class="dropdown-menu ml-3 show" style="position: absolute; transform: translate3d(0px, 60px, 0px); 
                                    top: 0px; left: 0px; will-change: transform;" 
                                    x-placement="bottom-start"
                                    aria-labelledby="wikiProSearchDropdown">
                            </div>

                            <script>
                                document.addEventListener('click', (event)=> { 
                                    if(event.target.id == "searchbar") {
                                        // Make sure search popup open when someone clicks on the searchbar
                                        search_for();
                                    } else {
                                        // If person clicks on searchlist dont clear it
                                        if(event.target.classList.contains("dropdown-item")) {
                                            return;
                                        }
                                        
                                        //When someone clicks anywhere, clear the list of search results  
                                        clearList();
                                    }  
                                });
                            </script>
                        </div>
                        
                        <div class="card-body" style="padding-top: 0px;{if $SCROLL_AFTER_PIXELS != 0} max-height: {$SCROLL_AFTER_PIXELS}px; overflow-y: auto; overflow-x: hidden; z-index: 20;{/if}">

                            <div class="wiki-pro-menu">
                            
                                <ul class="nav nav-tabs" id="myTab" role="tablist">

                                    {foreach from=$PAGES item=page}

                                        {if !empty($page.subpages)}

                                            <li class="nav-item dropdown">
                                                {* Check if any of this pages subpages ids are the ACTIVE PAGE ID *}
                                                {assign var=dropdown_active value=false}
                                                {foreach from=$page.subpages item=_subpage}
                                                    {if $_subpage->id == $ACTIVE_WIKI_PAGE}
                                                        {assign var=dropdown_active value=true}
                                                        {break}
                                                    {/if}
                                                {/foreach}

                                                <button class="btn btn-block btn-theme dropdown-toggle {if $dropdown_active}active{/if}" href="#" id="dropdownMenuButton"
                                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="margin-bottom: 8px">

                                                    {if isset($page.icon) && $page.icon|count_characters > 0}{$page.icon}{/if}
                                                    {$page.name}

                                                    <a class="badge float-right badge-dark" style="background-color: rgb(0,0,0,0.2);
                                                        margin-top: 3px">{count($page.subpages)}</a>
                                                </button>

                                                <style>
                                                    .fixDropdownPosition {
                                                        transform: translate3d(0px, 39px, 0px) !important;
                                                    }
                                                </style>

                                                <div class="dropdown-menu ml-3 fixDropdownPosition" aria-labelledby="dropdownMenuButton">
                                                    {foreach from=$page.subpages item=subpage}

                                                        {if $subpage->visibility || ($subpage->id) == ($ACTIVE_WIKI_PAGE)}
                                                            {* Only show page if its visible or the active page id equals it (meaning a url was used) *}
                                                            <a class="dropdown-item {if $subpage->id == $ACTIVE_WIKI_PAGE}active{/if} onClickIncrementPageViews" 
                                                                id="id-{$subpage->id}-tab" data-toggle="tab" data-tab="id-{$subpage->id}"
                                                                href="#id-{$subpage->id}" role="tab" aria-controls="id-{$subpage->id}"
                                                                aria-selected="{if $subpage->id == $ACTIVE_WIKI_PAGE}true{/if}false">
                                                                {if isset($subpage->icon) && $subpage->icon|count_characters > 0}{$subpage->icon}
                                                                {/if}{$subpage->name}
                                                            </a>
                                                        {/if}

                                                    {/foreach}
                                                </div>

                                            </li>

                                        {else}

                                            {if $page.visibility || ($page.id) == ($ACTIVE_WIKI_PAGE)}
                                                {* Only show page if its visible or the active page id equals it (meaning a url was used) *}
                                                <li class="nav-item">
                                                    <a class="btn btn-block btn-theme{if $page.id == $ACTIVE_WIKI_PAGE} active{/if} onClickIncrementPageViews"
                                                    style="margin-bottom: 8px" id="id-{$page.id}-tab" data-tab="id-{$page.id}"
                                                        data-toggle="tab" href="#id-{$page.id}" role="tab" aria-controls="id-{$page.id}"
                                                        aria-selected="{if $page.id == $ACTIVE_WIKI_PAGE}true{else}false{/if}">
                                                        {if isset($page.icon) && $page.icon|count_characters > 0}
                                                            {$page.icon}
                                                        {/if}
                                                        <span>{$page.name}</span>
                                                    </a>
                                                </li>
                                            {/if}
                                        {/if}
                                    {/foreach}
                                </ul>

                            </div>
                        </div>
                    </div>
                    {* Add left widgets below side menu *}
                    {if count($WIDGETS_LEFT)}
                        {foreach from=$WIDGETS_LEFT item=widget}
                            {$widget}
                        {/foreach}
                    {/if}

                </div>
            </div>

            {* Page content and last edited container *}
            <div class="{if count($WIDGETS_RIGHT) }col-lg-6{else}col-lg-9{/if}">

                {* Page content container*}
                <div class="card contentidentifier">

                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            {* Create a content tab for each page *}
                            {foreach from=$PAGES item=page}
                                {if empty($page.subpages)}
                                    {* Add Content *}

                                    {if !$page.visibility && ($page.id) != ($ACTIVE_WIKI_PAGE)}
                                        {* if page not visible and person hasnt used the link to view it, dont render it *}
                                    {else}
                                        <div class="tab-pane fade{if $page.id == $ACTIVE_WIKI_PAGE} show active{/if}" id="id-{$page.id}"
                                            role="tabpanel" aria-labelledby="id-{$page.id}-tab">

                                            {if $DISPLAY_TITLE}
                                                <div style="font-size:36px;" class="menu-title theme-text"><strong>{$page.name}</strong></div>
                                            {/if}

                                            {* Add the last edited message  *}
                                            <i class="fas fa-clock"></i><span> {$LAST_EDITED_BY}</span>
                                            <a style="{$page.editor.user_style}" href="{$page.editor.profile}"
                                            data-poload="{$USER_INFO_URL}{$page.editor.id}"
                                            data-html="true">{$page.editor.username}</a>

                                            &middot; <span data-toggle="tooltip"
                                                        title="{$page.editor.post_date}">{$page.editor.date_friendly}</span>
                                            
                                            {*people can manually add the horizontal line in the editor if they wish *}
                                            {if $DISPLAY_TITLE}
                                                <hr>
                                            {/if}

                                            <div class="forum_post">
                                                {$page.content}
                                            </div>

                                            <hr>

                                            {* Add Link and Edit button and view icon *}
                                            <button class="btn btn-theme" style="margin-left: 0px; margin-right: 5px"
                                                onclick="fireCobaltToast('{$page.copy_url}', '{$YOU_SUCCESSFULLY_COPIED}')">
                                                <i class="fas fa-chain"></i>
                                                {$LINK}
                                            </button>

                                            {if {$page.can_edit}}
                                                <button class="btn btn-theme" onclick="window.location.href='{$page.edit_url}'"><i
                                                        class="fas fa-edit fa-fw"></i> {$EDIT}</button>
                                            {/if}

                                            {if $DISPLAY_VIEWS}
                                                <div class="views-box" style="float: right; margin-top: 0px;"><i class="fa-solid fa-eye"></i> {$page.views}</div>
                                            {/if}

                                        </div>
                                    {/if}

                                {/if}

                                {if !empty($page.subpages)}
                                    {* Create a content tab for each sub page *}
                                    {foreach from=$page.subpages item=subpage}
                                        {* Add Content *}

                                        {if !$subpage->visibility && ($subpage->id) != ($ACTIVE_WIKI_PAGE)}
                                            {* if page not visible and person hasnt used the link to view it, dont render it *}
                                        {else}
                                            <div class="tab-pane fade{if $subpage->id == $ACTIVE_WIKI_PAGE} show active{/if}"
                                                id="id-{$subpage->id}" role="tabpanel" aria-labelledby="id-{$subpage->id}-tab">

                                                {if $DISPLAY_TITLE}
                                                    <div style="font-size:36px;" class="menu-title theme-text"><strong>{$subpage->name}</strong></div>
                                                {/if}

                                                {* Add the last edited message  *}
                                                <i class="fas fa-clock"></i><span> {$LAST_EDITED_BY}</span>
                                                <a style="{$subpage->editor.user_style}" href="{$subpage->editor.profile}"
                                                data-poload="{$USER_INFO_URL}{$subpage->editor.id}"
                                                data-html="true">{$subpage->editor.username}</a>
                                                &middot; <span data-toggle="tooltip"
                                                            title="{$subpage->editor.post_date}">{$subpage->editor.date_friendly}</span>
                                                
                                                {*people can manually add the horizontal line in the editor if they wish *}
                                                {if $DISPLAY_TITLE}
                                                    <hr>
                                                {/if}

                                                <div class="forum_post">
                                                    {$subpage->content}
                                                </div>

                                                <hr>

                                                {* Add Link and Edit button and view icon*}
                                                <button class="btn btn-theme" style="margin-left: 5px; margin-right: 5px"
                                                        onclick="fireCobaltToast('{$subpage->copy_url}', '{$YOU_SUCCESSFULLY_COPIED}')">
                                                    <i class="fas fa-chain"></i>
                                                    {$LINK}
                                                </button>

                                                {if {$subpage->can_edit}}
                                                    <button class="btn btn-theme" onclick="window.location.href='{$subpage->edit_url}'"><i
                                                            class="fas fa-edit fa-fw"></i> {$EDIT}</button>
                                                {/if}

                                                {if $DISPLAY_VIEWS}
                                                    <div class="views-box" style="float: right; margin-top: 0px;"><i class="fa-solid fa-eye"></i> {$subpage->views}</div>
                                                {/if}

                                            </div>
                                        {/if}

                                    {/foreach}
                                {/if}
                            {/foreach}
                        </div>
                    </div>
                </div>

            </div>

        {else}
            {* If can't view any pages *}

            {* Add left widgets*}
            {if count($WIDGETS_LEFT)}
                <div class="col-lg-3">
                    {foreach from=$WIDGETS_LEFT item=widget}
                        {$widget}
                    {/foreach}
                </div>
            {/if}
            {* Add message *}
            <div
                class="{if count($WIDGETS_LEFT) && count($WIDGETS_RIGHT) }col-md-6{elseif count($WIDGETS_LEFT) || count($WIDGETS_RIGHT)}col-lg-9{else}col-lg-12{/if}">
                <div class="alert alert-danger">
                    {$NO_PAGES_AVAILABLE}
                </div>
            </div>
        {/if}


        {* Right side widgets *}
        {if count($WIDGETS_RIGHT)}

            <div class="col-lg-3">

                {* Enable sticky right hand side widgets *}
                <div id="rightsidewidgets">
                    {foreach from=$WIDGETS_RIGHT item=widget}
                        {$widget}
                    {/foreach}
                </div>

            </div>
        {/if}

    </div>

</div>

{include file='footer.tpl'}

<script>
    function fireCobaltToast(url, copy_success_message) {
        navigator.clipboard.writeText(url);
        Swal.fire({
            titleText: copy_success_message,
            icon: 'success',
            toast: true,
            position: 'bottom-start',
            timer: 3000,
            showConfirmButton: false,
            customClass: {
                container: 'wiki-toast'
            }
        });
    }
</script>