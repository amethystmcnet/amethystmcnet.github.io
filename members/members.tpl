{include file='header.tpl'}
{include file='navbar.tpl'}


<div class="container">

{if isset($ERROR)}
<div class="alert alert-danger">
        {$ERROR}
</div>
{/if}

    <div class="row">
        <div class="col-lg-3">


        <div class="user-nav">
            <a href="{$MEMBER_LIST_URL}" class="user-nav-link{if $VIEWING_LIST eq "overview"} active{/if}">{$OVERVIEW}</a>
                {foreach from=$SIDEBAR_MEMBER_LISTS item=list}
                    <a href="{$list->url()}" class="user-nav-link{if $VIEWING_LIST eq $list->getName()} active{/if}"><i class="{if $list->getIcon()}{$list->getIcon()}{else}dot circle icon{/if}"></i> {$list->getFriendlyName()}</a>
                {/foreach}
        </div>

            {*<div class="card">
                <div class="card-header header-theme">{$FIND_MEMBER}</div>
                <div class="card-body">

                        <div class="ui search">
                            <div class="ui icon fluid input">
                                <input class="form-control" type="text" minlength="2" required placeholder="{$NAME}" autocomplete="off">
                            </div>
                            <div class="results"></div>
                        </div>
                </div>
            </div>*}
            {if $GROUPS|count}
                <div class="card">
                    <div class="card-header header-theme">{$VIEW_GROUP}</div>
                    <div class="card-body">
                            <select class="form-control" onchange="viewGroup(this)">
                                <option value="">{$GROUP}</option>
                                {foreach from=$GROUPS item=group}
                                    <option value="{$group.id}" {if $VIEWING_GROUP.id == $group.id} selected {/if}>{$group.name}</option>
                                {/foreach}
                            </select>
                    </div>
                </div>
            {/if}
            <div class="card">
                <div class="card-header header-theme">{$NEW_MEMBERS}</div>
                <div class="card-body">
                        <div class="row" id="new-members-grid" style="margin-right: -10px; margin-left: -10px">
                            {foreach from=$NEW_MEMBERS_VALUE item=member}
                                <div class="col-md-3" style="padding-right: 10px; padding-left: 10px; ">
                                    <a class="d-block mb-3" href="{$member->getProfileUrl()}" data-toggle="popup" data-poload="{$USER_INFO_URL}{$member->data()->id}">
                                        <img class="avatar-img w-100" src="{$member->getAvatar()}" alt="{$member->getDisplayname()}">
                                    </a>
                                </div>
                            {/foreach}
                        </div>
                </div>
            </div>
        </div>
            {if $VIEWING_LIST == "group" || $MEMBER_LISTS_VIEWING|count}
                    {if $VIEWING_LIST == "group"}
                        <div class="col-lg-9">
                            <div class="card members-card">
                                <div class="card-header header-theme">{$VIEWING_GROUP.name}</div>
                                <div class="card-body">
                                    <div id="member_list_group_{$VIEWING_GROUP.id}">
                                </div>
                                    <div class="pagination">{$PAGINATION}</div>
                                </div>
                            </div>
                        </div>
                    {else}
                        {foreach from=$MEMBER_LISTS_VIEWING item=list}
                        <div class="{if $VIEWING_LIST == "overview"}col-lg-3{else}col-lg-9{/if}">
                                <div class="card members-card">
                                    <div class="card-header header-theme">{$list->getFriendlyName()}</div>
                                    <div class="card-body">
                                        <div id="member_list_{$list->getName()}">
                                    </div>
                                    {if $VIEWING_LIST == "overview"}
                                        <a class="btn btn-secondary mt-2" href="{$list->url()}">{$VIEW_ALL}</a>
                                    {else}
                                        <div class="pagination">{$PAGINATION}</div>
                                    {/if}
                                    </div>
                                </div>
                            </div>
                        {/foreach}
                    {/if}
            {else}
                <div class="alert alert-danger">{$NO_OVERVIEW_LISTS_ENABLED}</div>
            {/if}
    </div>
</div>

<script type="text/javascript">
    const viewGroup = (e) => {
        window.location.href = '{$VIEW_GROUP_URL}' + e.value;
    }
    const renderList = (name) => {
        const list = document.getElementById('member_list_' + name);
        list.innerHTML = '<div class="ui active centered inline loader"></div>';
        fetch(
            '{$QUERIES_URL}'
                .replace({literal}'{{list}}'{/literal}, name)
                .replace({literal}'{{page}}'{/literal}, new URLSearchParams(window.location.search).get('p') ?? 1)
        )
            .then(async response => {
                const data = await response.json();
                if (data.length === 0) {
                    list.parentElement.innerHTML = '<div class="alert alert-danger">{$NO_MEMBERS_FOUND}</div>';
                    return;
                }
                list.innerHTML = '';
                for (const member of data) {
                    const mainDiv = document.createElement('div');
                    mainDiv.classList.add('mb-3', 'd-flex', 'members-container');
                    mainDiv.onclick = () => window.location.href = member.profile_url;
                    const contentDiv = document.createElement('div');
                    contentDiv.classList.add('flex-grow-1');
                    const avatarDiv = document.createElement('img');
                    avatarDiv.classList.add('avatar-img', 'members-staff-av');
                    avatarDiv.setAttribute('src', member.avatar_url);
                    {if $VIEWING_LIST == "overview"}
                        contentDiv.appendChild(avatarDiv);
                    {else}
                        mainDiv.appendChild(avatarDiv);
                    {/if}
                    const nameDiv = document.createElement('span');
                    nameDiv.style = member.group_style;
                    nameDiv.classList.add('username');
                    {if $VIEWING_LIST != "overview"}
                        nameDiv.innerHTML = member.username + '&nbsp;' + member.group_html.join('');
                    {else}
                        nameDiv.innerText = member.username;
                    {/if}
                    contentDiv.appendChild(nameDiv);
                    {if $VIEWING_LIST != "overview"}
                        const metaDiv = document.createElement('div');
                        metaDiv.classList.add('description');
                        const metaSpan = document.createElement('span');
                        metaSpan.classList.add('ui', 'text', 'small');
                        const memberMeta = member.metadata;
                        metaSpan.innerHTML = Object.keys(memberMeta).map(key => key + ': ' + memberMeta[key]).join(' &middot; ');
                        metaDiv.appendChild(metaSpan);
                        contentDiv.appendChild(metaDiv);
                    {/if}
                    mainDiv.appendChild(contentDiv);
                    list.appendChild(mainDiv);
                    const countDiv = document.createElement('div');
                    countDiv.classList.add('members-count');
                    if (member.count !== null) {
                        const countHeader = document.createElement('h3');
                        countHeader.classList.add('ui');
                        countHeader.innerText = member.count;
                        countDiv.appendChild(countHeader);
                        mainDiv.appendChild(countDiv);
                    }
                }
        });
    }
    window.onload = () => {
        {if $VIEWING_LIST == "group"}
            renderList('group_{$VIEWING_GROUP.id}');
        {else}
            {foreach from=$MEMBER_LISTS_VIEWING item=list}
                renderList('{$list->getName()}');
            {/foreach}
        {/if}
        $('.ui.search')
            .search({
                minCharacters: 2,
                maxResults: 5,
                selectFirstResult: true,
                fields: {
                    title: 'username',
                    description: 'nickname',
                    image: 'avatar_url',
                    url: 'profile_url',
                },
                apiSettings: {
                    url: '{$SEARCH_URL}&search={literal}{query}{/literal}&limit=5'
                },
                error: {
                    noResultsHeader: "{$NO_RESULTS_HEADER}",
                    noResults: "{$NO_RESULTS_TEXT}",
                }
            })
        ;
    }
</script>
{include file='footer.tpl'}