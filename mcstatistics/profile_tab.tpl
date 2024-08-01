{if isset($MCSTATISTICS_ERROR)}
  <div class="alert alert-danger">
    {$MCSTATISTICS_ERROR}
  </div>
{else}

    {foreach from=$MCSTATISTICS_SERVERS item=server}
      <h3 class="theme-text mb-3 d-inline-block">{$server.name}</h3>
      <div class="row mb-2">
        {foreach from=$server.fields item=field}
          <div class="col-xl-3 col-lg-4">
            <div class="card">
              <div class="card-body">
                <b>{$field.title}</b><br />
                {$field.value}
              </div>
            </div>
          </div>
        {/foreach}
      </div>
    {/foreach}

  <div class="text-center">Statistics provided by <a class="white-link" href="https://mcstatistics.org/"
      target="_blank">MCStatistics</a></div>
{/if}