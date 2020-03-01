/* Registro */
var registro = {
      banned_passwords: ["111111", "11111111", "112233", "121212", "123123", "123456", "1234567", "12345678", "131313", "232323", "654321", "666666", "696969", "777777", "7777777", "8675309", "987654", "aaaaaa", "abc123", "abc123", "abcdef", "abgrtyu", "access", "access14", "action", "admin", "albert", "alexis", "amanda", "amateur", "andrea", "andrew", "angela", "angels", "animal", "anthony", "apollo", "apples", "arsenal", "arthur", "asdfgh", "asdfgh", "ashley", "asshole", "august", "austin", "badboy", "bailey", "banana", "barney", "baseball", "batman", "beaver", "beavis", "bigcock", "bigdaddy", "bigdick", "bigdog", "bigtits", "birdie", "bitches", "biteme", "blazer", "blonde", "blondes", "blowjob", "blowme", "bond007", "bonnie", "booboo", "booger", "boomer", "boston", "brandon", "brandy", "braves", "brazil", "bronco", "broncos", "bulldog", "buster", "butter", "butthead", "calvin", "camaro", "cameron", "canada", "captain", "carlos", "carter", "casper", "charles", "charlie", "cheese", "chelsea", "chester", "chicago", "chicken", "cocacola", "coffee", "college", "compaq", "computer", "cookie", "cooper", "corvette", "cowboy", "cowboys", "crystal", "cumming", "cumshot", "dakota", "dallas", "daniel", "danielle", "debbie", "dennis", "diablo", "diamond", "doctor", "doggie", "dolphin", "dolphins", "donald", "dragon", "dreams", "driver", "eagle1", "eagles", "edward", "einstein", "erotic", "extreme", "falcon", "fender", "ferrari", "fewfew", "firebird", "fishing", "florida", "flower", "flyers", "football", "forever", "freddy", "freedom", "fucked", "fucker", "fucking", "fuckme", "fuckyou", "gandalf", "gateway", "gators", "gemini", "george", "giants", "ginger", "golden", "golfer", "gordon", "gregory", "guitar", "gunner", "hammer", "hannah", "hardcore", "harley", "heather", "helpme", "hentai", "hockey", "hooters", "horney", "hotdog", "hunter", "hunting", "iceman", "iloveyou", "internet", "iwantu", "jackie", "jackson", "jaguar", "jasmine", "jasper", "jennifer", "jeremy", "jessica", "johnny", "johnson", "jordan", "joseph", "joshua", "junior", "justin", "killer", "knight", "ladies", "lakers", "lauren", "leather", "legend", "letmein", "letmein", "little", "london", "lovers", "maddog", "madison", "maggie", "magnum", "marine", "marlboro", "martin", "marvin", "master", "matrix", "matthew", "maverick", "maxwell", "melissa", "member", "mercedes", "merlin", "michael", "michelle", "mickey", "midnight", "miller", "mistress", "moderador", "monica", "monkey", "monkey", "monster", "morgan", "mother", "mountain", "muffin", "murphy", "mustang", "naked", "nascar", "nathan", "naughty", "ncc1701", "newyork", "nicholas", "nicole", "nipple", "nipples", "oliver", "orange", "packers", "panther", "panties", "parker", "password", "password", "password1", "password12", "password123", "patrick", "peaches", "peanut", "pepper", "phantom", "phoenix", "player", "please", "pookie", "porsche", "prince", "princess", "private", "purple", "pussies", "qazwsx", "qwerty", "qwertyui", "rabbit", "rachel", "racing", "raiders", "rainbow", "ranger", "rangers", "rebecca", "redskins", "redsox", "redwings", "richard", "robert", "rocket", "rosebud", "runner", "rush2112", "russia", "samantha", "sammy", "samson", "sandra", "saturn", "scooby", "scooter", "scorpio", "scorpion", "secret", "sexsex", "shadow", "shannon", "shaved", "sierra", "silver", "skippy", "slayer", "smokey", "snoopy", "soccer", "sophie", "spanky", "sparky", "spider", "squirt", "srinivas", "startrek", "starwars", "steelers", "steven", "sticky", "stupid", "success", "suckit", "summer", "sunshine", "superman", "surfer", "swimming", "sydney", "taylor", "tennis", "teresa", "tester", "testing", "theman", "thomas", "thunder", "thx1138", "tiffany", "tigers", "tigger", "tomcat", "topgun", "toyota", "travis", "trouble", "trustno1", "tucker", "turtle", "twitter", "united", "vagina", "victor", "victoria", "viking", "voodoo", "voyager", "walter", "warrior", "welcome", "whatever", "william", "willie", "wilson", "winner", "winston", "winter", "wizard", "xavier", "xxxxxx", "xxxxxxxx", "yamaha", "yankee", "yankees", "yellow", "zxcvbn", "zxcvbnm", "zzzzzz"],
      dialog: true,
      paso_actual: 1,
      datos: new Array(),
      datos_status: new Array(),
      datos_text: new Array(),
      no_requerido: new Array(),
      errores: new Array(),
      cache: new Array(),
      times: new Array(),
      times_sets: new Array(),

      //Un elemento obtiene el foco
      focus: function(el) {
         var name = $(el).attr('name');
         switch (name) {
            case 'password':

               break;
         }

         //    $(el).removeClass('mal');
         //    $(el).removeClass('bien');       
         $(el).addClass('selected');
         this.show_status(el, 'info', $(el).attr('title'), true);
      },

      //Un elemento pierde el foco
      blur: function(el) {
         var name = $(el).attr('name');
         switch (name) {
            case 'nick':
            case 'email':
               this.clear_time(name);
               $(el).removeClass('selected');
               this.check_campo(el, false, true);
               break;
            default:
               $(el).removeClass('selected');
               this.check_campo(el, false, true);
               break;
         }
         //LIMPIAR ESTILOS SI ESTA VACIO EL INPUT BY TO-UP
         //    var toup = $('#nick');     

         //FIN    
      },

      set_time: function(name) {
         if (this.times_sets[name])
            return false;
         this.times_sets[name] = true;
         this.times[name] = setTimeout("registro.time('" + name + "')", 500);
      },
      clear_time: function(name) {
         if (!this.times_sets[name])
            return false;
         this.times_sets[name] = false;
         clearTimeout(this.times[name]);
      },
      time: function(name) {
         var el = $('#RegistroForm #' + name);
         if (empty($(el).val()))
            this.show_status(el, 'info', $(el).attr('title'), true);
         else
            this.check_campo(el, false, true);
      },

      //Compruebo un campo
      check_campo: function(el, no_empty, force_check) {
         var campo = $(el).attr('name');
         var value = $(el).val();

         switch (campo) {
            /* Nick */
            case 'nick':
               //Si ya paso por aca y no hubieron cambios, devuelvo el mismo status
               if (!force_check && this.datos[campo] === value)
                  if (this.datos_status[campo] == 'empty')
                     return no_empty ? this.show_status(el, this.datos_status[campo], this.datos_text[campo]) : this.hide_status(el, this.datos_status[campo], this.datos_text[campo]);
                  else
                     return this.show_status(el, this.datos_status[campo], this.datos_text[campo]);


                  //Almaceno el dato
               this.datos[campo] = value;

               //!empty
               if (empty(value)) {
                  var status = 'empty';
                  var text = 'El campo es requerido';
                  if (no_empty)
                     return this.show_status(el, status, text);
                  else
                     return this.hide_status(el, status, text);
               }

               //TamaÃ±o
               if (value.length < 4 || value.length > 16)
                  return this.show_status(el, 'error', 'Debe tener entre 4 y 16 caracteres');
               /*             
                              return this.show_status(el, 'error', 'Debe tener entre 4 y 16 caracteres'),
                              $(el).removeClass('bien'), 
                              $(el).addClass('mal');
               */

               //No solo numeros
               if (!/[^0-9]/.test(value))
                  return this.show_status(el, 'error', 'No puede contener solo numeros');

               //Caracteres validos
               if (/[^a-zA-Z0-9_]/.test(value))
                  return this.show_status(el, 'error', 'S&oacute;lo se permiten letras, n&uacute;meros y guiones(_)');

               //ContraseÃ±a === nick
               //          if(value === this.datos['password'])
               //             return this.show_status($, 'error', 'La contrase&ntilde;a tiene que ser distinta que el nick');

               //Compruebo si ya esta en uso
               //Compruebo el Cache
               var value_lower = value.toLowerCase();
               if (!this.cache[campo]) {
                  this.cache[campo] = new Array();
                  this.cache[campo][value_lower] = new Array();
               } else if (this.cache[campo][value_lower]) {
                  if (this.cache[campo][value_lower]['status'])
                     return registro.show_status(el, 'ok', this.cache[campo][value_lower]['text']);
                  else
                     return registro.show_status(el, 'error', this.cache[campo][value_lower]['text']);
               }
               this.show_status(el, 'loading', 'Comprobando nick...');
               $('#loading').fadeIn(250);
               $.ajax({
                  type: 'POST',
                  url: global_data.url + '/registro-check-nick.php?t=nombre de usuario',
                  data: 'nick=' + value,
                  success: function(h) {
                     registro.cache[campo][value_lower] = new Array();
                     registro.cache[campo][value_lower]['text'] = h.substring(3);
                     switch (h.charAt(0)) {
                        case '0': //Estaba en uso
                           registro.cache[campo][value_lower]['status'] = false;
                           registro.show_status(el, 'error', h.substring(3));
                           /*                      
                                                   $('#nick').addClass('mal');
                                                   $('#nick').removeClass('bien');  
                           */
                           break;
                        case '1': //No esta en uso
                           registro.cache[campo][value_lower]['status'] = true;
                           registro.show_status(el, 'ok', h.substring(3));
                           /*                      
                                                   $('#nick').removeClass('mal');
                                                   $('#nick').addClass('bien');
                           */
                           break;
                     }
                     $('#loading').fadeOut(350);
                  },
                  error: function() {
                     registro.show_status(el, 'error', 'Hubo un error al intentar procesar lo solicitado');
                     registro.datos[campo] = '';
                  }
               });
               break;

               /* password */
            case 'password':
               //Si ya paso por aca y no hubieron cambios, devuelvo el mismo status
               if (!force_check && this.datos[campo] === value)
                  if (this.datos_status[campo] == 'empty')
                     return no_empty ? this.show_status(el, this.datos_status[campo], this.datos_text[campo]) : this.hide_status(el, this.datos_status[campo], this.datos_text[campo]);
                  else
                     return this.show_status(el, this.datos_status[campo], this.datos_text[campo]);

                  //Almaceno el dato
               this.datos[campo] = value;

               //!empty
               if (empty(value)) {
                  var status = 'empty';
                  var text = 'El campo es requerido';
                  if (no_empty)
                     return this.show_status(el, status, text);
                  else
                     return this.hide_status(el, status, text);
               }

               //ContraseÃ±a banneada
               if ($.inArray(value.toLowerCase(), this.banned_passwords) != -1)
                  return this.show_status(el, 'error', 'Ingresa una contrase&ntilde;a m&aacute;s segura');

               //ContraseÃ±a === nick
               if (value === this.datos['nick'])
                  return this.show_status(el, 'error', 'La contrase&ntilde;a tiene que ser distinta que el nick');

               //TamaÃ±o
               if (value.length < 5 || value.length > 35)
                  return this.show_status(el, 'error', 'Debe tener entre 5 y 35 caracteres');

               //OK
               return this.show_status(el, 'ok', 'OK');
               break;

               /* email */
            case 'email':
               value = value.toLowerCase();
               //Si ya paso por aca y no hubieron cambios, devuelvo el mismo status
               if (!force_check && this.datos[campo] === value)
                  if (this.datos_status[campo] == 'empty')
                     return no_empty ? this.show_status(el, this.datos_status[campo], this.datos_text[campo]) : this.hide_status(el, this.datos_status[campo], this.datos_text[campo]);
                  else
                     return this.show_status(el, this.datos_status[campo], this.datos_text[campo]);

                  //Almaceno el dato
               this.datos[campo] = value;

               if (empty(value)) {
                  var status = 'empty';
                  var text = 'El campo es requerido';
                  if (no_empty)
                     return this.show_status(el, status, text);
                  else
                     return this.hide_status(el, status, text);
               }

               //TamaÃ±o
               if (value.length > 35)
                  return this.show_status(el, 'error', 'El email es demasiado largo');

               //Caracteres validos
               if (!/^[_a-z0-9-]+(.[_a-z0-9-]+)*@[a-z0-9-]+(.[a-z0-9-]+)*(.[a-z]{2,3})$/.exec(value))
                  return this.show_status(el, 'error', 'El formato es incorrecto');

               //Compruebo si ya esta en uso
               //Compruebo el Cache
               if (!this.cache[campo]) {
                  this.cache[campo] = new Array();
                  this.cache[campo][value] = new Array();
               } else if (this.cache[campo][value]) {
                  if (this.cache[campo][value]['status'])
                     return registro.show_status(el, 'ok', this.cache[campo][value]['text']);
                  else
                     return registro.show_status(el, 'error', this.cache[campo][value]['text']);
               }
               this.show_status(el, 'loading', 'Comprobando email...');
               $('#loading').fadeIn(250);
               $.ajax({
                  type: 'POST',
                  url: global_data.url + '/registro-check-email.php?t=email',
                  data: 'email=' + value,
                  success: function(h) {
                     registro.cache[campo][value] = new Array();
                     registro.cache[campo][value]['text'] = h.substring(3);
                     switch (h.charAt(0)) {
                        case '0': //Estaba en uso
                           registro.cache[campo][value]['status'] = false;
                           registro.show_status(el, 'error', h.substring(3));
                           break;
                        case '1': //No esta en uso
                           registro.cache[campo][value]['status'] = true;
                           registro.show_status(el, 'ok', 'OK');
                           break;
                     }
                     $('#loading').fadeOut(350);
                  },
                  error: function() {
                     registro.show_status(el, 'error', 'Hubo un error al intentar procesar lo solicitado');
                     registro.datos[campo] = '';
                     $('#loading').fadeOut(350);
                  }
               });
               break;
               /* Sexo */
            case 'sexo':
               if (!$('#RegistroForm #sexo_f').is(':checked') && !$('#RegistroForm #sexo_m').is(':checked'))
                  value = '';
               else if ($('#RegistroForm #sexo_f').is(':checked'))
                  value = 'f';
               else
                  value = 'm';

               //Si ya paso por aca y no hubieron cambios, devuelvo el mismo status
               if (this.datos[campo] === value)
                  if (this.datos_status[campo] == 'empty')
                     return no_empty ? this.show_status(el, this.datos_status[campo], this.datos_text[campo]) : this.hide_status(el, this.datos_status[campo], this.datos_text[campo]);
                  else
                     return this.show_status(el, this.datos_status[campo], this.datos_text[campo]);

                  //Almaceno el dato
               this.datos[campo] = value;

               //!empty
               if (empty(value)) {
                  var status = 'empty';
                  var text = 'El campo es requerido';
                  if (no_empty)
                     return this.show_status(el, status, text);
                  else
                     return this.hide_status(el, status, text);
               }

               return this.show_status(el, 'ok', 'OK');
            break;
            
            /* ReCaptcha V3 */
            case 'recaptcha_response_field':﻿﻿﻿
               this.datos['g-recaptcha-response'] = $('#RegistroForm #response').val();﻿﻿﻿﻿
            break;

               /* Terminos */
            case 'terminos':
               var value = $(el).is(':checked');
               //Si ya paso por aca y no hubieron cambios, devuelvo el mismo status
               if (!force_check && this.datos[campo] === value)
                  if (this.datos_status[campo] == 'empty')
                     return no_empty ? this.show_status(el, this.datos_status[campo], this.datos_text[campo]) : this.hide_status(el, this.datos_status[campo], this.datos_text[campo]);
                  else
                     return this.show_status(el, this.datos_status[campo], this.datos_text[campo]);

                  //Almaceno el dato
               this.datos[campo] = value;

               //!empty
               if (!value) {
                  var status = 'empty';
                  var text = 'El campo es requerido';
                  if (no_empty)
                     return this.show_status(el, status, text);
                  else
                     return this.hide_status(el, status, text);
               }

               return registro.show_status(el, 'ok', 'OK');
               break;

               /* reCAPTCHA */
            case 'g-recaptcha-response':
               this.datos[campo] = value;
               //!empty
               if (!value) {
                  return this.show_status($('#RegistroForm .g-recaptcha'), 'empty', 'Demuestra que eres humano');
               }
               return registro.show_status($('#RegistroForm .g-recaptcha'), 'ok', 'OK');
               break;
         }
      },

      show_status: function(el, status_aux, text, no_cache_data) {
         var campo = $(el).attr('name');
         var status = (status_aux == 'empty') ? 'error' : status_aux;
         //Si es reCAPTCHA, lo busco directamente
         if (campo == 'recaptcha_response_field')
            el = $('#RegistroForm .pasoUno .help.recaptcha');
         else { //Paso al siguiente elemento hasta encontrar un .help
            do {
               el = $(el).next();
            } while (!$(el).is('.help'));
         }
         $(el).removeClass('ok').removeClass('error').removeClass('info').removeClass('loading').addClass(status).show().children().children().html(text);

         if (!no_cache_data) {
            this.datos_status[campo] = status_aux;
            this.datos_text[campo] = text;
         }
         return (status == 'ok');
      },
      hide_status: function(el, status, text) {
         var campo = $(el).attr('name');

         //Si es reCAPTCHA, lo busco directamente
         if (campo == 'recaptcha_response_field')
            el = $('#RegistroForm .pasoUno .help.recaptcha');
         else { //Paso al siguiente elemento hasta encontrar un .help
            do {
               el = $(el).next();
            } while (!$(el).is('.help'));
         }

         $(el).hide();

         this.datos_status[campo] = status;
         this.datos_text[campo] = text;
         return (status == 'ok');
      },

      check_paso: function() {
         switch (this.paso_actual) {
            case 1:
               var ok = true;
               //Ejecuto comprobacion de cada input dentro del paso
               var inputs = $('#RegistroForm .pasoUno :input');
               inputs.each(function() {
                  if (!registro.check_campo(this, true)) {
                     ok = false;
                  }
               });
               return ok;
               break;
         }
         return true;
      },

      change_paso: function(paso, no_focus) {
         //Si esta pasando a una pagina siguiente y hay error, no continua
         if (paso > this.paso_actual && !this.check_paso())
            return false;

         switch (paso) {
            //Muestro el paso 1
            case 1:
               $('#RegistroForm .pasoUno').show();
               //Botones cuando uso el dialog
               if (this.dialog) {
                  mydialog.buttons(true, true, 'Terminar', 'registro.submit()', true, false);
                  $('#mydialog #buttons .mBtn.btnOk').removeClass('btnCancel').addClass('btnGreen');
               } else {
                  $('.reg-login .registro #buttons #sig').hide();
                  $('.reg-login .registro #buttons #term').css('display', 'inline-block');
               }
               //Focus al primer elemento. Solo si no se especifico que no se quiere pasar el focus
               if (!no_focus)
                  $('#RegistroForm .pasoUno input:first').focus();
               break
         }
         //Si es el dialog, lo centro
         if (this.dialog) {
            // mydialog.center();
         }
         //Registro el paso actual
         this.paso_actual = paso;
      },

      //Envio los datos y completo el registro
      submit: function() {
         //Compruebo datos del paso actual (pasoUno)
         if (!this.check_paso())
            return false;
         //Oculto todos los mensajes informativos
         $('#RegistroForm .help').hide();

         var params = '';
         var amp = '';
         for (var campo in this.datos) {
            params += amp + campo + '=' + encodeURIComponent(this.datos[campo]);
            amp = '&';
         }

         /*if(this.dialog)
         mydialog.procesando_inicio('Enviando...', 'Registro');
         return false;
         */
         //Envio los datos

         $('#loading').fadeIn(250);
         $.ajax({
            type: 'POST',
            url: global_data.url + '/registro-nuevo.php',
            data: params,
            success: function(h) {
               console.log(h);
                //Si hubo algun error, recargo recaptcha
               if(SelectR == 0){
                   var rnum = h.substring(0, strpos(h, ':'));
                   if (rnum != '1' || rnum != '2') {
                       registro.datos['g-recaptcha-response'] = '';
                       grecaptcha.reset();
                   }
               }
               switch (h.substring(0, strpos(h, ':'))) {
                  case '0': //Error generico

                     break;
                  case 'nick': //Error nick
                     registro.change_paso(1, true);
                     registro.show_status($('#RegistroForm #nick'), 'error', h.substring(strpos(h, ':') + 2));
                     break;
                  case 'password': //Password
                     registro.change_paso(1, true);
                     registro.show_status($('#RegistroForm #password'), 'error', h.substring(strpos(h, ':') + 2));
                     registro.datos['password'] = '';
                     break;
                  case 'email': //Email
                     registro.change_paso(1, true);
                     registro.show_status($('#RegistroForm #email'), 'error', h.substring(strpos(h, ':') + 2));
                     break;
                  case 'sexo': //Sexo
                     registro.change_paso(1, true);
                     registro.show_status($('#RegistroForm #sexo_f'), 'error', h.substring(strpos(h, ':') + 2));
                     break;
                  case 'recaptcha': //reCAPTCHA
                     registro.change_paso(1, true);
                     registro.show_status($('#RegistroForm .g-recaptcha'), 'error', h.substring(strpos(h, ':') + 2));
                     break;
                  case '1':
                  case '2':
                     $('#RegistroForm').hide();
                     $('#boxms').html(h.substring(strpos(h, ':') + 2));
                     $('#listo').append('<a href="#" class="mt-3 btn btn-success" onclick="redireccionar();">Aceptar</a>');
                  break;
               }
               $('#loading').fadeOut(350);
            },
            error: function() {
               mydialog.error_500("registro.submit()");
               $('#loading').fadeOut(350);

            },
            complete: function() {
               if (registro.dialog)
                  mydialog.procesando_fin();
               $('#loading').fadeOut(450);
            }
         });
      }
   }
   // REDIRECCIONAR
function redireccionar() {
   location.href = global_data.url + '/cuenta/'
}