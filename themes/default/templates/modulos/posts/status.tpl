{if $tsPost.post_status > 0 || $tsAutor.user_activo != 1}
<div class="alert alert-danger" role="alert">
    Este post se encuentra 
    {if $tsPost.post_status == 2}eliminado
    {elseif $tsPost.post_status == 1}inactivo por acomulación de denuncias
    {elseif $tsPost.post_status == 3}en revisión
    {elseif $tsAutor.user_activo != 1} oculto porque pertenece a una cuenta desactivada
    {/if}, tú puedes verlo porque {if $tsUser->is_admod == 1}eres Administrador{elseif $tsUser->is_admod == 2}eres Moderador{else}tienes permiso{/if}.
</div>
{/if}