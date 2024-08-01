<div class="form-group custom-control custom-switch">
    <input type="hidden" name="{$name}" value="no">
    <input id="{$name}" name="{$name}" type="checkbox" class="custom-control-input" value="yes" {if ${$name|upper}_VALUE eq 'yes'}checked{/if}>
    <label class="custom-control-label" for="{$name}">{${$name|upper}}</label>

    {if $right !== "no"}<span class="float-right">{$right}</span>{/if}
    {if $last !== "yes"}<br />{/if}
</div>