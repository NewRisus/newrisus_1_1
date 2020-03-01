<script type="text/javascript">
//
var button_title = '     {if $tsDraft}Aplicar Cambios{else}Agregar post{/if}     ';
// {literal}
function countUpperCase(string) {
	var len = string.length, strip = string.replace(/([A-Z])+/g, '').length, strip2 = string.replace(/([a-zA-Z])+/g, '').length, percent = (len  - strip) / (len - strip2) * 100;
	return percent;
}
//
function showError(obj, str) {
	if (obj.tagName.toLowerCase() == 'textarea') {
		obj = $(obj).parent().parent();
	}
	$(obj).parent('li.form-group').addClass('error').children('span.errormsg').html(str).show(); // TODO QUE ONDA
	$.scrollTo($(obj).parent('li'), 500);
}
//
function hideError(obj) {
	if (obj.tagName.toLowerCase() == 'textarea') {
		obj = $(obj).parent().parent();
	}
	$(obj).parent('li.form-group').removeClass('error').children('span.errormsg').html('').hide();
}
//
function save_borrador(){
	var params = 'titulo=' + encodeURIComponent($('input[name="titulo"]').val()) + '&cuerpo=' + encodeURIComponent($('textarea[name="cuerpo"]').bbcode()) + '&tags=' + encodeURIComponent($('input[name="tags"]').val()) + '&categoria=' + encodeURIComponent($('select[name="categoria"]').val());
	params += $('input[name="privado"]').is(':checked') ? '&privado=1' : '';
	params += $('input[name="sin_comentarios"]').is(':checked') ? '&sin_comentarios=1' : '';
	params += $('input[name="patrocinado"]').is(':checked') ? '&patrocinado=1' : '';
	params += $('input[name="sticky"]').is(':checked') ? '&sticky=1' : '';
	$('div#borrador-guardado').html('Guardando...');

	borrador_setTimeout = setTimeout('borrador_save_enabled()', 60000);
	borrador_save_disabled();

	//Actualizo el borrador id
	if(!empty($('input[name="borrador_id"]').val())){
		$.ajax({
			type: 'POST',
			url: global_data.url + '/borradores-guardar.php',
			data: params + '&borrador_id=' + encodeURIComponent($('input[name="borrador_id"]').val()),
			success: function(h){
				switch(h.charAt(0)){
					case '0': //Error
						clearTimeout(borrador_setTimeout);
						borrador_setTimeout = setTimeout('borrador_save_enabled()', 5000);
						borrador_ult_guardado = h.substring(3);
						$('div#borrador-guardado').html(borrador_ult_guardado);
						break;
					case '1': //Guardado
						var currentTime = new Date();
						borrador_ult_guardado = 'Guardado a las ' + currentTime.getHours() + ':' + currentTime.getMinutes() + ':' + currentTime.getSeconds() + ' hs.';
						$('div#borrador-guardado').html(borrador_ult_guardado);
				}
			},
			error: function(){
				mydialog.error_500('save_borrador()');
			}
		});
	}else{
		$.ajax({
			type: 'POST',
			url: global_data.url + '/borradores-agregar.php',
			data: params,
			success: function(h){
				switch(h.charAt(0)){
					case '0': //Error
						clearTimeout(borrador_setTimeout);
						borrador_setTimeout = setTimeout('borrador_save_enabled()', 5000);
						borrador_ult_guardado = h.substring(3);
						$('div#borrador-guardado').html(borrador_ult_guardado);
						break;
					case '1': //Creado
						$('input[name="borrador_id"]').val(h.substring(3));
						var currentTime = new Date();
						borrador_ult_guardado = 'Guardado a las ' + currentTime.getHours() + ':' + currentTime.getMinutes() + ':' + currentTime.getSeconds() + ' hs.';
						$('div#borrador-guardado').html(borrador_ult_guardado);
				}
			},
			error: function(){
				mydialog.error_500('save_borrador()');
			}
		});
	}
}

var borrador_setTimeout;
var borrador_ult_guardado = '';
var borrador_is_enabled = true;

function borrador_save_enabled(){
	if($('input#borrador-save'))
		$('input#borrador-save').removeClass('disabled').removeAttr('disabled');
	borrador_is_enabled = true;
}
function borrador_save_disabled(){
	if($('input#borrador-save'))
		$('input#borrador-save').addClass('disabled').attr('disabled', 'disabled');
	borrador_is_enabled = false;
}
//
var confirm = true;
window.onbeforeunload = confirmleave;
function confirmleave() {
	if (confirm && ($('input[name=titulo]').val() || $('textarea[name=cuerpo]').val())) return "Este post no fue publicado y se perdera.";
}
//
var tags = false;
$(document).ready(function(){
	// QUITAR LOS ERRORES
	$('.required').on('keyup change',function(){
		if ($.trim($(this).val())) {
			hideError(this);
		}
	});
	// CHECAR EL TITULO
	$('input[name=titulo]').on('keyup',function(){
		if ($(this).val().length >= 5 && countUpperCase($(this).val()) > 90) {
			showError(this, 'El t&iacute;tulo no debe estar en may&uacute;sculas');
		}
		else {
			hideError(this);
		}
	});
    // NO REPOST
    $('input[name=titulo]').blur(function(){
        var q = $(this).val();
		$.ajax({
			type: 'post',
			url: global_data.url + '/posts-genbus.php?do=search',
			data: 'q=' + q,
			success: function(h) {
                $('#repost').html(h);
			}
		});
    });
    // GENERADOR DE TAGS
    $('input[name=tags]').click(function(){
        if(tags == true) return true;
        var q = $('input[name=titulo]').val();
		$.ajax({
			type: 'post',
			url: global_data.url + '/posts-genbus.php?do=generador',
			data: 'q=' + q,
			success: function(h) {
                $('input[name=tags]').val(h);
                tags = true;
			}
		});
    });
	// PREVIEW
	$('#PublicarPost').on('click',function(){
		//COMPROBAR TITULO
		var titulo = $('input[name=titulo]').val();
		if (titulo.length < 1) {
			showError($('input[name=titulo]').get(0), 'Debes ingresar un titulo para el post');
			$('input[name=titulo]').focus();
			return false;
		}
		//COMPROBAR CONTENIDO
		var cuerpo = $('textarea[name=cuerpo]').bbcode();
		if (cuerpo.length < 1) {
			showError($('textarea[name=cuerpo]').get(0), 'Ingresa contenido para el post');
			$('textarea[name=cuerpo]').focus();
			return false;
		}		
		//COMPROBAR CATEGORIA
		var categoria = $('select[name=categoria]').val();
		if (!categoria) {
			showError($('select[name=categoria]').get(0), 'Selecciona una categor&iacute;a');
			return false;
		}		
		//COMPROBAR TAGS
		var tags = $('input[name=tags]').val().split(',');
		if (tags.length < 4) {
			$('.tagsinput').addClass('error');
			$('#tagerror').html('Ingresa por lo menos 4 tags separados por comas').show();
			$.scrollTo($('#tagerror').parent('li'), 500);	
			$('#tags').focus();
			return false;
		}else{ 
			$('.tagsinput').removeClass('error');
			hideError($('input[name=tags]').get(0));	
		}		
		//GUARDAR POST DESPUES DE COMPROBAR CAMPOS
		postSave();

	});
	//PREVISUALIZAR BY TO-UP
	$('#vistaPrevia').on('click',function(){
		//COMPROBAR TITULO
		var titulo = $('input[name=titulo]').val();
		if (titulo.length < 1) {
			showError($('input[name=titulo]').get(0), 'Debes ingresar un titulo para el post');
			$('input[name=titulo]').focus();
			return false;
		}
		//COMPROBAR CONTENIDO
		var cuerpo = $('textarea[name=cuerpo]').bbcode();
		if (cuerpo.length < 1) {
			//showError($('textarea[name=cuerpo]').get(0), 'Ingresa contenido para el post');
			$('textarea[name=cuerpo]').focus();
			return false;
		}				
			mydialog.class_aux = 'preview';
			mydialog.show(true);
			mydialog.title('Previsualizaci&oacute;n');
			mydialog.body('<div class="text-center"><p>Cargando vista previa</p><div class="spinner-border" style="width: 3rem; height: 3rem;" role="status"><span class="sr-only">Loading...</span></div></div>');
            mydialog.buttons(false);
			//mydialog.center();
            // PREVIEW
			$.ajax({
				type: 'post',
				url: global_data.url + '/posts-preview.php?ts=true',
				data: 'titulo=' + encodeURIComponent($('input[name=titulo]').val()) + '&cuerpo=' + encodeURIComponent($('textarea[name=cuerpo]').bbcode()),
				success: function(r) {
					mydialog.body(r);
					mydialog.buttons(true, true, 'Cerrar', 'close', true, false);
					//mydialog.center();
					$('#mydialog #buttons .ui.button').addClass('blue');
					//$('#mydialog #buttons .mBtn.btnOk').removeClass('btnCancel').addClass('btnGreen');
					$.scrollTo(0, 500)
				}
			});	
	});
    
	//
    $('a.consejos-view-more-button').on(
		'click',
		function () {
			$(this).hide();
			$('div.consejos-view-more').show();
		}
	);
});
//
function postSave() {
	mydialog.class_aux = 'preview';
	mydialog.show(true);
	mydialog.title('Publicando');
	mydialog.body('<div class="text-center"><p>Comprobando contenido</p><div class="spinner-border" style="width: 3rem; height: 3rem;" role="status"><span class="sr-only">Loading...</span></div></div>');
	mydialog.buttons(false);
	//// mydialog.center();	
	confirm = false;
	$('form[name=newpost]').submit();
}
</script>
{/literal}