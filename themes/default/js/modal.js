var mydialog={is_show:false,class_aux:'',close_button:false,show:function(class_aux){if(this.is_show)return;else this.is_show=true;if($('#mydialog').html()=='')$('#mydialog').html('<div class="modal" id="dialog" tabindex="-1" role="dialog"><div class="modal-dialog modal-dialog-centered" role="document"><div class="modal-content"><div class="modal-header"><h5 class="modal-title"></h5><button type="button" class="close close_dialog" onclick="mydialog.close();"><span aria-hidden="true">&times;</span></button></div><div class="modal-body" id="cuerpo"><div id="procesando"><div id="mensaje"></div></div><div class="modal_body"></div></div><div class="modal-footer d-flex justify-content-between"><button type="button" class="btn btn-secondary" onclick="mydialog.close();">Cerrar</button></div></div></div></div>');if(!this.close_button)$('.close_dialog').remove();if(class_aux==true)$('#mydialog').addClass(this.class_aux);else if(this.class_aux!=''){$('#mydialog').removeClass(this.class_aux);this.class_aux='';}$("#dialog").modal({backdrop:'static',keyboard:false});},close:function(){this.class_aux='';this.close_button=false;this.is_show=false;this.procesando_fin();$('#mydialog #dialog').modal('toggle');$('#mydialog #dialog').on('hidden.bs.modal',function(e){$('#mydialog #dialog').remove();});},center:function(){},title:function(title){$('.modal-title').html(title);},body:function(body,width,height){$('.modal_body').html(body);},buttons:function(display_all,btn1_display,btn1_val,btn1_action,btn1_enabled,btn1_focus,btn2_display,btn2_val,btn2_action,btn2_enabled,btn2_focus){if(!display_all){$('.modal-footer').css('display','none').html('');return;}if(btn1_action=='close')btn1_action='mydialog.close()';if(btn2_action=='close'||!btn2_val)btn2_action='mydialog.close()';if(!btn2_val){btn2_val='Cancelar';btn2_enabled=true;}var html='';if(btn1_display)html+='<input type="button" class="btn btn-primary btn-sm'+(btn1_enabled?'':' disabled')+'" style="display:'+(btn1_display?'inline-block':'none')+'"'+(btn1_display?' value="'+btn1_val+'"':'')+(btn1_display?' onclick="'+btn1_action+'"':'')+(btn1_enabled?'':' disabled')+' />';if(btn2_display)html+=' <input type="button" class="btn btn-danger btn-sm'+(btn1_enabled?'':' disabled')+'" style="display:'+(btn2_display?'inline-block':'none')+'"'+(btn2_display?' value="'+btn2_val+'"':'')+(btn2_display?' onclick="'+btn2_action+'"':'')+(btn2_enabled?'':' disabled')+' />';$('.modal-footer').html(html).css('display','inline-block');if(btn1_focus)$('.modal-footer .btn.btn-success').focus();else if(btn2_focus)$('.modal-footer .btn.btn-danger').focus();},buttons_enabled:function(btn1_enabled,btn2_enabled){if($('.modal-footer .btn.btn-success'))if(btn1_enabled) $('.modal-footer .btn.btn-success').removeClass('disabled').removeAttr('disabled');else $('.modal-footer .btn.btn-success').addClass('disabled').attr('disabled','disabled');if($('.modal-footer .btn.btn-danger')) if(btn2_enabled)$('.modal-footer .btn.btn-danger').removeClass('disabled').removeAttr('disabled');else $('.modal-footer .btn.btn-danger').addClass('disabled').attr('disabled','disabled');},alert:function(title,body,reload){this.show();this.title(title);this.body(body);this.buttons(true,true,'Aceptar','mydialog.close();'+(reload?'location.reload();':'close'),true,true,false);this.center();},error_500:function(fun_reintentar){setTimeout(function(){mydialog.procesando_fin();mydialog.show();mydialog.title('Error');mydialog.body('Error al procesar');mydialog.buttons(true,true,'Reintentar','mydialog.close();'+fun_reintentar,true,true,true,'Cancelar','close',true,false);mydialog.center();},200);},procesando_inicio:function(value,title){if(!this.is_show){this.show();this.title(title);this.body('');this.buttons(false,false);this.center();}$('.modal-body #procesando #mensaje').html('<div class="text-center" style="padding: 2rem 10px;"><h4>Procesando tu petición...</h4><br><div class="spinner-border text-danger" role="status"><span class="sr-only">Cargando...</span></div>');$('.modal-body #procesando').fadeIn('slow');},procesando_fin:function(){$('.modal-body #procesando').fadeOut('slow');}};document.onkeydown=function(e){key=(e==null)?event.keyCode:e.which;if(key==27)mydialog.close();};