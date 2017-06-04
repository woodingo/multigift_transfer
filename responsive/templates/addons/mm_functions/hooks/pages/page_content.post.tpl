{*
{if $page.page_id == 106}

{assign var="mm_functions_promz_form_lang_vars" value=[
	"nl"=> [
		"sex"=> "Aanhef",
		"sex_m"=> "De heer",
		"sex_f"=> "Mevrouw",
		"firstname"=> "Voornaam",
		"lastname"=> "Achternaam",
		"companyname" => "Bedrijfsnaam",
		"email"=> "Email",
		"subscribe_prefix"=> "Ja, als dank voor mijn stem wil ik graag een gratis abonnement op",
		"subscribe_suffix"=> "ontvangen.",
		"subscribe_fields_intro"=> "Als dank voor uw stem, bieden wij u graag een gratis jaarabonnement op PromZ Magazine aan ter waarde van € 30,-. PromZ Magazine verschijnt 4x per jaar en is het enige vakblad in Nederland over actiemarketing, promotionele producten en diensten. Het enige dat u hoeft te doen is hieronder uw bedrijfsgegevens invullen.",
		"companyname"=> "Bedrijfsnaam",
		"street"=> "Straat",
		"number"=> "Huisnummer",
		"addition"=> "Toevoeging adres",
		"city"=> "Plaats",
		"postal"=> "Postcode",
		"send"=> " Stemmen op MultiGift",
		"status_success_title" => "Succes",
		"status_success_message" => "Een bevestigingsmail is toegestuurd. Nadat u op de link in de bevestigingsmail heeft geklikt, is uw stem op MultiGift bevestigd. Hartelijk dank voor het stemmen op MultiGift Relatiegeschenken.",
		"status_exists_title" => "Fout",
		"status_exists_message" => "Met dit emailadres lijkt al een stem uitgebracht. Per emailadres kan slechts één keer worden gestemd. Deze stem telt dus helaas niet mee.",
		"status_missing_required_fields_title" => "Fout",
		"status_missing_required_fields_message" => "Niet alle velden zijn ingevuld."
	],
	"en"=> [
		"sex"=> "Salutation",
		"sex_m"=> "Sir",
		"sex_f"=> "Madam",
		"firstname"=> "First name",
		"lastname"=> "Surname",
		"companyname" => "Company name",
		"email"=> "Email",
		"send"=> " Vote for MultiGift",
		"status_success_title" => "Succes",
		"status_success_message" => "A confirmation email has been sent (Dutch only). After you have clicked on the link in the confirmation email, your vote is confirmed. Thank you for voting for MultiGift.",
		"status_exists_title" => "Error",
		"status_exists_message" => "It looks like  that this email address already cast a vote. Per email address only once can be voted for MultiGift. Unfortunately this vote does not count.",
		"status_missing_required_fields_title" => "Error",
		"status_missing_required_fields_message" => "Not all fields are completed."
	],
	"de"=> [
		"sex"=> "Anrede",
		"sex_m"=> "Herr",
		"sex_f"=> "Frau",
		"firstname"=> "Vorname",
		"lastname"=> "Nachname",
		"companyname" => "Firmenname",
		"email"=> "E-Mail Adresse",
		"send"=> " Stimme für MultiGift",
		"status_success_title" => "Succes",
		"status_success_message" => "Eine Bestätigungsmail wurde gesendet (nur auf Niederländisch). Nachdem Sie auf den Link in der Bestätigungs-E-Mail angeklickt haben, wird Ihre Stimme bestätigt. Vielen Dank für Ihre Unterstützung von MultiGift.",
		"status_exists_title" => "Error",
		"status_exists_message" => "Diese E-Mail Adresse hat bereits eine Stimme abgegeben. Jeder E-Mail-Adresse darf nur einmal abstimmen. Diese Abstimmung zahlt leider nicht.",
		"status_missing_required_fields_title" => "Error",
		"status_missing_required_fields_message" => "Nicht alle Felder sind ausgefüllt."
	],
	"fr"=> [
		"sex"=> "Salutation",
		"sex_m"=> "Monsieur",
		"sex_f"=> "Madame",
		"firstname"=> "Prénom",
		"lastname"=> "Nom de famille",
		"companyname" => "Nom de l'entreprise",
		"email"=> "E-mail",
		"send"=> " Votez pour MultiGift",
		"status_success_title" => "Succes",
		"status_success_message" => "Un courriel de confirmation a été envoyé (uniquement en néerlandais). Après avoir cliqué sur le lien dans l'email de confirmation, votre vote est confirmé. Merci de voter pour MultiGift.",
		"status_exists_title" => "Error",
		"status_exists_message" => "On a déjà voté avec cette addresse. I lest seulement possible de voter 1 fois par addresse mail.",
		"status_missing_required_fields_title" => "Error",
		"status_missing_required_fields_message" => "Pas tous les champs sont remplis."
	]
]}

{if !empty($mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE})}
	<form id="mm_functions_promz_form" name="mm_functions_promz_form" action="{"mm_functions.submit_promz_form"|fn_url}" class="cm-ajax" method="POST">
		<input type="hidden" name="vote_choice" id="vote_choice" value="22" />
	    <input type="hidden" name="vote_name" id="vote_name" />
	    <input type="hidden" name="vote_category" id="vote_category" value="2" />
	
		<div class="ty-control-group">
	        <label class="ty-control-group__title">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.sex}</label>
	        <label for="vote_sex_m" class="radio-inline"><input type="radio" name="vote_sex" id="vote_sex_m" value="M" checked="" style="margin-right: 3px;"> {$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.sex_m}</label>&nbsp;&nbsp;&nbsp;
	        <label for="vote_sex_f" class="radio-inline"><input type="radio" name="vote_sex" id="vote_sex_f" value="F" style="margin-right: 3px;"> {$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.sex_f}</label>
	    </div>
		<div class="ty-control-group">
			<label for="vote_firstname" class="ty-control-group__title">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.firstname}</label>
			<input id="vote_firstname" class="ty-form-builder__input-text ty-input-text" size="50" type="text" name="vote_firstname" value="" />
		</div>
		<div class="ty-control-group">
			<label for="vote_lastname" class="ty-control-group__title">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.lastname}</label>
			<input id="vote_lastname" class="ty-form-builder__input-text ty-input-text" size="50" type="text" name="vote_lastname" value="" />
		</div>
		<div class="ty-control-group">
			<label for="vote_companyname" class="ty-control-group__title">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.companyname}</label>
			<input id="vote_companyname" class="ty-form-builder__input-text ty-input-text" size="50" type="text" name="vote_companyname" value="" />
		</div>
		<div class="ty-control-group">
			<label for="vote_email" class="ty-control-group__title cm-email">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.email}</label>
			<input id="vote_email" class="ty-form-builder__input-text ty-input-text" size="50" type="text" name="vote_email" value="" />
		</div>
		
		{if $smarty.const.CART_LANGUAGE == "nl"}
			<div class="ty-control-group">
	            <input type="checkbox" name="vote_subscribe" id="vote_subscribe" value="1"><label for="vote_subscribe">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.subscribe_prefix} <a href="http://www.promz.nl/magazine" target="_blank">PromZ Magazine</a> {$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.subscribe_suffix}</label>
	        </div>
	        
	        <div id="additional_vote_subscribe_fields" style="display: none;">
	        	{if !empty($mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.subscribe_fields_intro)}
				<p>{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.subscribe_fields_intro}</p>
				{/if}
				<div class="ty-control-group">
					<label for="vote_companyname" class="ty-control-group__title">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.companyname}</label>
					<input id="vote_companyname" class="ty-form-builder__input-text ty-input-text" size="50" type="text" name="vote_companyname" value="" />
				</div>
				<div class="ty-control-group">
					<label for="vote_street" class="ty-control-group__title">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.street}</label>
					<input id="vote_street" class="ty-form-builder__input-text ty-input-text" size="50" type="text" name="vote_street" value="" />
				</div>
				<div class="ty-control-group">
					<label for="vote_number" class="ty-control-group__title">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.number}</label>
					<input id="vote_number" class="ty-form-builder__input-text ty-input-text" size="50" type="text" name="vote_number" value="" />
				</div>
				<div class="ty-control-group">
					<label for="vote_addition" class="ty-control-group__title">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.addition}</label>
					<input id="vote_addition" class="ty-form-builder__input-text ty-input-text" size="50" type="text" name="vote_addition" value="" />
				</div>
				<div class="ty-control-group">
					<label for="vote_postal" class="ty-control-group__title">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.postal}</label>
					<input id="vote_postal" class="ty-form-builder__input-text ty-input-text" size="50" type="text" name="vote_postal" value="" />
				</div>
				<div class="ty-control-group">
					<label for="vote_city" class="ty-control-group__title">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.city}</label>
					<input id="vote_city" class="ty-form-builder__input-text ty-input-text" size="50" type="text" name="vote_city" value="" />
				</div>
	        </div>
	    {/if}
		<div class="ty-form-builder__buttons buttons-container">
			<button class="ty-btn__secondary ty-btn cm-submit">{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.send}</button>
		</div>
	</form>
	
	{literal}
	<script type="text/javascript">
	(function(_, $) {
		$("#mm_functions_promz_form #vote_subscribe").click(function() {
			$("#additional_vote_subscribe_fields").slideToggle(500);
		});
		
		$.ceEvent('on', 'ce.formajaxpost_mm_functions_promz_form', function(data){
			if(data.result == "missing_required_fields"){
				$.ceNotification('show', {
					type: 'E',
					title: "{/literal}{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.status_missing_required_fields_title}{literal}",
					message: "{/literal}{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.status_missing_required_fields_message}{literal}",
					message_state: 'I'
				});
			}else if(data.result == "exists"){
				$.ceNotification('show', {
					type: 'W',
					title: "{/literal}{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.status_exists_title}{literal}",
					message: "{/literal}{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.status_exists_message}{literal}",
					message_state: 'I'
				});
			}else if(data.result == "success"){
				$.ceNotification('show', {
					type: 'N',
					title: "{/literal}{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.status_success_title}{literal}",
					message: "{/literal}{$mm_functions_promz_form_lang_vars.{$smarty.const.CART_LANGUAGE}.status_success_message}{literal}",
					message_state: 'I'
				});
				$("#mm_functions_promz_form").fadeOut(250, function(){
					$(this).remove();
				});
			}else{
				
			}
		});
		
	}(Tygh, Tygh.$));
	</script>
	{/literal}
	{/if}
{/if}
*}