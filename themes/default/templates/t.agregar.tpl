{include file='sections/main_header.tpl'}

				
<script>
$(document).ready(function(){
    if($('.code').length > 0) $('#ver').show(); else $('#ver').remove();
});
</script>
<div id="form_div" class="row">

    <div style="display:none" id="preview"></div>

    {include file='modulos/agregar/js.tpl'}

    <div class="col-12">

        {include file='modulos/agregar/agregar.tpl'}

    </div>

</div>
<div id="ver">{PrettyPrint}</div>


{include file='sections/main_footer.tpl'}