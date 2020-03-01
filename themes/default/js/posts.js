/*
	File: Posts.js
*/
/* Citar comentarios */
function citar_comment(id, nick){
	var textarea = $('#body_comm');
	textarea.focus();
	textarea.val(((textarea.val()!='') ? textarea.val() + '\n' : '') + '[quote=' + nick + ']' + htmlspecialchars_decode($('#citar_comm_'+id).html(), 'ENT_NOQUOTES') + '[/quote]\n');
}
/* Eliminar Comentario */
function borrar_com(comid, autor, postid, gew){
	mydialog.close();
    if(!postid) var postid = gget('postid');
	if(!gew){
            mydialog.show();
			
            mydialog.title('Borrar Comentarios');
			
            mydialog.body('&#191;Quiere eliminar este comentario?');
			
            mydialog.buttons(true, true, 'S&iacute;', 'borrar_com(' + comid + ', ' + autor + ', ' + postid + ', 1)', true, false, true, 'No', 'close', true, true);
			
            mydialog.center();
			
        }else{
        $('#loading').fadeIn(250);
	$.ajax({
		type: 'POST',
		url: global_data.url +'/comentario-borrar.php',
		data: 'comid=' + comid + '&autor=' + autor + '&postid=' + postid,
		success: function(h){
			switch(h.charAt(0)){
				case '0': //Error
					mydialog.alert('Error', h.substring(3));
					break;
				case '1':
					// RESTAMOS
					var ncomments = parseInt($('#ncomments').text());
					$('#ncomments').text(ncomments - 1);
					//
                    $('#div_cmnt_'+comid).slideUp( 1500, 'easeInOutElastic');
					$('#div_cmnt_'+comid).slideUp('normal', function(){ $(this).remove(); });
                    $('#loading').fadeOut(350);
					break;
			}
		},
		error: function(){
			mydialog.error_500("borrar_com('"+comid+"')");
            $('#loading').fadeOut(350);
		}
	});
	}
}
/* Ocultar Comentario */
function ocultar_com(comid, autor, postid){
	mydialog.close();
    $('#loading').fadeIn(250);
	$.ajax({
		type: 'POST',
		url: global_data.url +'/comentario-ocultar.php',
		data: 'comid=' + comid + '&autor=' + autor + '&post_id=' + postid + gget('postid'),
		success: function(h){
			switch(h.charAt(0)){
				case '0': //Error
					mydialog.alert('Error', h.substring(3));
					break;
				case '1':
					//
                    //mydialog.alert('Hecho', h.substring(3));
					$('#comentario_' +comid).css('opacity', 1);
					$('#pp_' +comid).css('opacity', 0.5);
					break;
				case '2':
					//
                    //mydialog.alert('Hecho', h.substring(3));
					$('#comentario_' +comid).css('opacity', 0.5);
					$('#pp_' +comid).css('opacity', 1);
					break;
			}
            $('#loading').fadeOut(350);
		},
		error: function(){
			mydialog.error_500("borrar_com('"+comid+"')");
		}
	});
}

function procesando(name, clean){
	if(clean){
		proc[name] = false;
		return true;
	}
	if(proc[name])
		return true;
	else{
		proc[name] = true;
		return false;
	}
}
/* Borrar Post */
function borrar_post(aceptar){
	if(!aceptar){
			mydialog.show();
			mydialog.title('Borrar Post');
			mydialog.body('&iquest;Seguro que deseas borrar este post?');
			mydialog.buttons(true, true, 'SI', 'borrar_post(1)', true, false, true, 'NO', 'close', true, true);
			mydialog.center();
			return;
	}else if(aceptar==1){
			mydialog.show();
			mydialog.title('Borrar Post');
			mydialog.body('Te pregunto de nuevo... &iquest;Seguro que deseas borrar este post?');
			mydialog.buttons(true, true, 'SI', 'borrar_post(2)', true, false, true, 'NO', 'close', true, true);
			mydialog.center();
			return;
	}
	mydialog.procesando_inicio('Eliminando...', 'Borrar Post');
    $('#loading').fadeIn(250);
	$.ajax({
		type: 'POST',
		url: global_data.url + '/posts-borrar.php',
		data: gget('postid', true),
		success: function(h){
			switch(h.charAt(0)){
				case '0': //Error
					mydialog.alert('Error', h.substring(3));
					break;
				case '1':
					mydialog.alert('Post Borrado', h.substring(3), true);
					break;
			}
            $('#loading').fadeOut(350);
		},
		error: function(){
			mydialog.error_500("borrar_post(2)");
            $('#loading').fadeOut(350);
		},
		complete: function(){
			mydialog.procesando_fin();
            $('#loading').fadeOut(350);
		}
	});
}

/* Votar post */
var votar_post_votado = false;
function show_votar_post(force_hide){
	if(votar_post_votado)
		return;
	if(!force_hide && $('#pointsPost .assing_points').css('display') == 'none')
		$('#pointsPost .assing_points').show();
	else
		$('#pointsPost .assing_points').hide();
}
function votar_post(puntos){
	if(votar_post_votado)
		return;
    if(puntos == null || isNaN(puntos) != false || puntos < 1) {
		mydialog.alert('Error', 'Debe introducir n&uacute;meros');
        return false;
    }
	votar_post_votado = true;
    $('#loading').fadeIn(250);
	$.ajax({
		type: 'POST',
		url: global_data.url + '/posts-votar.php',
		data: 'puntos=' + puntos + gget('postid'),
		success: function(h){
			show_votar_post(true);
			$('.assing_points').slideUp();
			console.log(h);
			switch(h.charAt(0)){
				case '0': //Error
					$('#pointsPost .col-12 .alert').addClass('alert-danger').html(h.substring(3)).slideDown();
					break;
				case '1': //OK
					$('#pointsPost .col-12 .alert').addClass('alert-success').html(h.substring(3)).slideDown();
                    $('#vp_pos').remove();
					$('#vp_neg').remove();
					var total = (puntos == 2) ? parseInt($('#vp_total').html())-1 : parseInt($('#vp_total').html())+1;
					$('#vp_total').html(total);
					console.log(total);
					if(total < 0) $('#vp_total').css({'background' : '#B92626'});
				break;
			}
            $('#loading').fadeOut(350);
		},
		error: function(){
			votar_post_votado = false;
			mydialog.error_500("votar_post('"+puntos+"')");
            $('#loading').fadeOut(350);
		}
	});
}

/* Agregar post a favoritos */
var add_favoritos_agregado = false;
function add_favoritos(){
	if(add_favoritos_agregado)
		return;
	if(!gget('key')){
		mydialog.alert('Login', 'Tienes que estar logueado para realizar esta operaci&oacute;n');
		return;
	}
	add_favoritos_agregado = true;
    $('#loading').fadeIn(250);
	$.ajax({
		type: 'POST',
		url: global_data.url + '/favoritos-agregar.php',
		data: gget('postid', true),
		success: function(h){
			switch(h.charAt(0)){
				case '0': //Error
					$('#pointsPost .col-12 .alert').addClass('alert-danger').html(h.substring(3)).slideDown();
					break;
				case '1': //OK
					$('#pointsPost .col-12 .alert').addClass('alert-success').html(h.substring(3)).slideDown();
					$('.favoritos_post').html(number_format(parseInt($('.favoritos_post').html().replace(".", "")) + 1, 0, ',', '.'));
					break;
			}
            $('#loading').fadeOut(350);
		},
		error: function(){
			add_favoritos_agregado = false;
			mydialog.error_500("add_favoritos()");
            $('#loading').fadeOut(250);
		}
	});
}

//Imprimir editores
function print_editor(){
    //Editor de posts comentarios
    if($('#body_comm').length && !$('.wysibb-texarea').length){
        var wbbOpt = { buttons: "smilebox,|,bold,italic,underline,strike,sup,sub,|,img,video,link" }
        $('#body_comm').removeAttr('onblur onfocus class style title').css('height', '80').html('').wysibb(wbbOpt);
    }
}
// POST COMMENTS
function com_page(postid, page, autor){
	$('#com_gif').show();
     $('#loading').fadeIn(250);
	//
	$.ajax({
		type: 'POST',
		url: global_data.url + '/comentario-ajax.php?page=' + page,
		data: 'postid=' + postid + '&autor=' + autor,
		success: function(h){
			$('#comentarios').html(h);
			//
			set_pages(postid, page, autor);
			//
             $('#loading').fadeOut(350);
             //
		}
	});
	//
	return false;
}
// PAGINAS PARA LOS COMENTARIOS EN POSTS
function set_pages(postid, page, autor){
	var total = parseInt($('#ncomments').text());
	//
     $('#loading').fadeIn(250);
	$.ajax({
		type: 'POST',
		url: global_data.url + '/comentario-pages.php?page=' + page,
		data: 'postid=' + postid + '&autor=' + autor + '&total=' + total,
		success: function(h){
			$('.paginadorCom').html(h);
			$('#com_gif').fadeOut();
             $('#loading').fadeOut(350);
		}
	});
}
/* COMENTARIOS */
var comentario = {
    /* VARIABLES */
    cache: {},
    cargado: false,
    /* FUNCIONES */
    cargar: function(postid, page, autor){
        // GIF
		$('#com_gif').show();
		//$.scrollTo('#comentarios-container', 250);
		$('div#comentarios').css('opacity', 0.4)
		// COMPRVAMOS CACHE
        if(typeof comentario.cache['c_' + page] == 'undefined'){
            $('#loading').fadeIn(250);                                     
    		$.ajax({
    			type: 'POST',
    			url: global_data.url + '/comentario-ajax.php?page=' + page,
    			data: 'postid=' + postid + '&autor=' + autor,
    			success: function(h){
    			    // CACHE
                    comentario.cache['c_' + page] = h;
                    // CARGAMOS
   				    $('#comentarios').html(h);
                    // PAGINAS
    				comentario.set_pages(postid, page, autor);
    				//
                    $('#loading').fadeOut(350);
    			}                                                 
    		});
      } else {
            $('#comentarios').html(comentario.cache['c_' + page]);
            $('.paginadorCom').html(comentario.cache['p_' + page]);
            $('#com_gif').hide();
            $('div#comentarios').css('opacity', 1);
      }
    },
    set_pages: function(postid, page, autor){
    	var total = parseInt($('#ncomments').text());
    	//
        $('#loading').fadeIn(250);                                 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/comentario-pages.php?page=' + page,
    		data: 'postid=' + postid + '&autor=' + autor + '&total=' + total,
    		success: function(h){
    		    comentario.cache['p_' + page] = h;
   			    $('.paginadorCom').html(h);
                $('#com_gif').hide();
				$('div#comentarios').css('opacity', 1);
                $('#loading').fadeOut(350);                                                                 
    		}
    	});
	},
    // NUEVO COMENTARIO
    nuevo: function(mostrar_resp, comentarionum){
        // EVITAR FLOOD
        $('#btnsComment').attr({'disabled':'disabled'});
        //
    	var textarea = $('#body_comm');
    	var text = textarea.bbcode();
        // VACIO o DEFAULT
    	if(text == '' || text == textarea.attr('title')){
    		textarea.focus();
            $('#btnsComment').removeAttr('disabled');
    		return;
    	}else if(text.length > 1500){
    		alert("Tu comentario no puede ser mayor a 1500 caracteres.");
    		textarea.focus();
            $('#btnsComment').removeAttr('disabled');
    		return;
    	}
        // IMAGEN
    	$('.miComentario #gif_cargando').show();
    	var auser = $('#auser_post').val();
        $('#loading').fadeIn(250);                                 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/comentario-agregar.php',
    		data: 'comentario=' + encodeURIComponent(text) + '&postid=' + gget('postid') + '&mostrar_resp=' + mostrar_resp + '&auser=' + auser,
    		success: function(h){
    			switch(h.charAt(0)){
    				case '0': //Error
    					$('.miComentario .error').html(h.substring(3)).show('slow');
                        $('#btnsComment').removeAttr('disabled');
    					break;
    				case '1': //OK
							$("#nuevos").slideUp(1);
    						$('#preview').remove();
    						/*textarea.attr('title', 'Escribir un comentario...').val('');
    						onblur_input(textarea);*/
							$('#nuevos').html(h.substring(3)).slideDown('slow', function () {
						$('#no-comments').hide('slow');
						$('.miComentario').html('<div class="alert alert-success">Tu comentario fue agregado correctamente :)</div>');
					});
    						// SUMAMOS
    						var ncomments = parseInt($('#ncomments').text());
    						$('#ncomments').text(ncomments + 1);
                            //$('#btnsComment').removeAttr('disabled');
                            // POR SI HABIA ERROR
                            //$('.miComentario .error').html('');
    					break;
    			}
                $('#loading').fadeOut(350);                                 
    			//
    			$('.miComentario #gif_cargando').hide();
                mydialog.close();
    		}
  	     });
    },
    // VISTA PREVIA DEL COMENTARIO
    preview: function(id, type){
    	var textarea = (type == 'new') ? $('#' + id) : $('#edit-comment-' + id);
    	var text = (type == 'new') ? textarea.bbcode() : textarea.val();
        var btn_text = (type == 'new') ? 'Enviar comentario' : 'Guardar';
        var btn_fn = (type == 'new') ? "comentario.nuevo('true')" : 'comentario.editar(' + id + ', \'send\')';
    
    	if(text == '' || text == textarea.attr('title')){
    		textarea.focus();
    		return;
    	}else if(text.length > 1500){
    		alert("Tu comentario no puede ser mayor a 1500 caracteres.");
    		textarea.focus();
    		return;
    	}
    	var auser = $('#auser_post').val();
    
    	$('.miComentario #gif_cargando').show();
        //
		mydialog.class_aux = 'preview';
		mydialog.show(true);
		mydialog.title('Vista previa');
		mydialog.body('Cargando vista previa....<br><br><img src="' + global_data.url + '/themes/default/images/loading_bar.gif">');
        mydialog.center();
        //
        $('#loading').fadeIn(250);                 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/comentario-preview.php?type=' + type,
    		data: 'comentario=' + encodeURIComponent(text) + '&auser=' + auser,
    		success: function(h){
    		  switch(h.charAt(0)){
                case '0': //Error
    				if(type == 'new') $('.miComentario .error').html(h.substring(3)).show('slow');
                    else  {
                        $('#edit-error-' + id).css('color','red').html(h.substring(3));
                        mydialog.close();
                    }
                    $('.miComentario #gif_cargando').hide();
    				break;
                case '1': //OK
                    //
					mydialog.body(h.substring(3));
					mydialog.buttons(true, true, btn_text, btn_fn, true, true, true, 'Cancelar', 'close', true, false);
                    mydialog.center();
                    //
                    //$('#preview').html(h.substring(3)).slideDown("slow");
                    $('.miComentario #gif_cargando').hide();
                    $('.miComentario .error').html('');
                    break;
                }
                $('#loading').fadeOut(350);                                 
                // DOBLE CENTER XQ SI NO, NO SE CENTRA :S
                mydialog.center();
    		}
    	});
    },
    // VOTAR COMENTARIO
    votar: function(cid, voto){
        var voto_tag = $('#votos_total_' + cid)
    	var total_votos = parseInt(voto_tag.text());
        total_votos = (isNaN(total_votos)) ? 0 : total_votos;
        // FIX
        voto = (voto == 1) ? 1 : -1;
        //
        $('#loading').fadeIn(250); 
    	$.ajax({
    		type: 'POST',
    		url: global_data.url + '/comentario-votar.php',
    		data: 'voto=' + voto + '&cid=' + cid + '&postid=' + gget('postid'),
    		success: function(h){
    			switch(h.charAt(0)){
    				case '0': //Error
    					mydialog.alert("Error al votar",h.substring(3));
    					break;
    				case '1': //OK
    					total_votos = total_votos + voto;
                        if(total_votos > 0) total_votos = '+' + total_votos; // PONEMOS EL SIGNO + POR ESTETICA :P
    					var klass = (total_votos < 0) ? 'negativo' : 'positivo'; // CLASS
                        // MOSTRAMOS SI NO ES VISIBLE Y AGREGAMOS LA NUEVA CLASS
                        $('#ul_cmt_' + cid + ' > .numbersvotes').show();
    					voto_tag.text(total_votos).removeClass('positivo, negativo').addClass(klass);
    					// ESCONDEMOS LAS MANITAS xd
                        $('#ul_cmt_' + cid).find('.icon-thumb-up, .icon-thumb-down').hide();
    					break;
    			}
                $('#loading').fadeOut(350); 
    		}
    	});	
    },
    // CITAR
    citar: function(id, nick){
    	var textarea = $('#body_comm');
    	textarea.focus();
    	textarea.val(((textarea.val()!='') ? textarea.val() + '\n' : '') + '[quote=' + nick + ']' + htmlspecialchars_decode($('#citar_comm_'+id).html(), 'ENT_NOQUOTES') + '[/quote]\n');
    },
    // EDITAR
    editar: function(id, step){
        switch(step){
            case 'show':
                var bbcode = htmlspecialchars_decode($('#citar_comm_'+id).html(), 'ENT_NOQUOTES');
                var html = '<textarea id="edit-comment-' + id + '" class="form-control textarea-edit" title="Escribir un comentario..." onfocus="onfocus_input(this)" onblur="onblur_input(this)">' + bbcode + '</textarea><br/><input type="button" class="btn btn-success btnEdit" onclick="comentario.preview(\'' + id + '\', \'edit\')" value="Continuar &raquo;"/> <strong id="edit-error-' + id + '"></strong>';
                $('#comment-body-' + id).html(html);
                $('#edit-comment-' + id).css('max-height', '300px');
            break;
            case 'send':
                var cid = $('#edit-cid-' + id).val()
                var comment = $('#edit-comment-' + id).val();
                $('#loading').fadeIn(250); 
            	$.ajax({
            		type: 'POST',
            		url: global_data.url + '/comentario-editar.php',
            		data: 'comentario=' + encodeURIComponent(comment) + '&cid=' + id,
            		success: function(h){
            			switch(h.charAt(0)){
            				case '0': //Error
                                $('#edit-error-' + id).css('color','red').html(h.substring(3));
            				break;
            				case '1': //OK
                                $('#comment-body-' + id).html($('#new-com-html').html());
                                var bbcode = htmlspecialchars_decode($('#new-com-bbcode').html(), 'ENT_NOQUOTES');
                                $('#citar_comm_'+id).html(bbcode) 
           					break;
            			}
                        $('#loading').fadeOut(350); 
            			//
                        mydialog.close();
            		}
                 });

            break;
        }  
    }
}
/* BBCode */
function spoiler(obj){
    $(obj).toggleClass('show').parent().next().slideToggle();
}
$(document).ready(function(){
    if($('.code').length > 0) $('#ver').show(); else $('#ver').remove();
});