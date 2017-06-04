{assign var="style_font_attributes" value="font-family:Arial;font-size:11px;"}
<!DOCTYPE html>
<html>
	<head>
	<title>{__("mm_print_codes_your_invoice")} - {$product_name} - {$product_code}</title>
	</head>
	<body style="{$style_font_attributes}width: 680px;">
		<h1 style="margin:0;padding:0;"><a href="http://{$runtime.company_data.storefront}" target="_blank" title="{$runtime.company_data.company}" style="border:none;"><img src="{$logos.mail.image.image_path}" width="{$logos.mail.image.image_x}" height="{$logos.mail.image.image_y}" border="0" alt="{$logos.mail.image.alt}" style="border:none;" /></a></h1>
		<hr style="background-color: #dd0802; color: #dd0802;height: 1px;border:none;" />
		<table cellpadding="0" cellspacing="0" border="0" width="100%" style="height: 100%;{$style_font_attributes}">
			<tbody style="{$style_font_attributes}">
				<tr style="height: 25px;"><td colspan="2"><p>{__("mm_print_codes_invoice_salutation")}<br /><br />{__("mm_print_codes_invoice_you_hereby_receive", ["[store_name]" => $runtime.company_data.company])}</p></td></tr>
				<tr style="height: 25px;"><td valign="center" width="30%">{if $product_image}<a href="{$product_url}">{include file="common/image.tpl" obj_id=$product_id images=$product_image image_height=120}</a>{/if}</td><td valign="center" width="70%">{if $is_custom_made_product}&nbsp;{else}{__("mm_print_codes_invoice_currently_in_stock")}: {$product_total_stock|number_format:"0":"":"." nofilter} {__("mm_print_codes_pieces")}{/if}</td></tr>
				<tr style="height: 20px;"><td colspan="2"><h2 style="text-decoration: underline;font-size: 14px;margin:0;">{__("mm_print_codes_invoice_global_prices_of_product_above", ["[product_name]" => $product_name])}</h2></td></tr>
				<tr style="height: 25px;"><td colspan="2"><p>{$product_quantity_pricing_table nofilter}</p></td></tr>
				<tr style="height: 20px;"><td colspan="2"><h2 style="text-decoration: underline;font-size: 14px;margin:0;">{__("mm_print_codes_your_invoice")}</h2><p><a href="{$product_url}">{$product_url}</a></p><p>{$product_invoice_table nofilter}</p></td></tr>
				<tr style="height: 10px;"><td colspan="2" style="font-size: 8px;">{__("mm_print_codes_invoice_price_disclaimer")}</td></tr>
				<tr style="height: 5px;"><td colspan="2"><hr style="margin:0;" /></td></tr>
				<tr style="height: 25px;"><td colspan="2"><p>{__("mm_print_codes_invoice_order_instructions", ["[product_name]" => {$product_name|lower}, "[company_orders_department_email]" => {""|fn_mm_print_codes_get_first_email_address_in_company_orders_department_setting}])}</p></td></tr>
			</tbody>
		</table>
	<p style="{$style_font_attributes}">
{__("admin_text_letter_footer", ["[company_name]" => $runtime.company_data.company])}<br />
<hr style="clear: both;width:100%;" />
{$settings.Company.company_name}<br />
{$settings.Company.company_address}<br />
Postbus 285 - {$settings.Company.company_zipcode} - {$settings.Company.company_city} ({$settings.Company.company_state})<br />{__("mm_functions_email_footer_country")}
<br />Tel.: {$settings.Company.company_phone}<br />Fax: {$settings.Company.company_fax}<br />Email: {__("mm_functions_email_footer_email")}<br /><br />{__("mm_functions_email_footer_more_promotional_gifts_via")}<br />{__("mm_functions_email_footer_stress_balls_in_any_shape_via")}<br />{__("mm_functions_email_footer_promotional_coin_banks_via")}<br>
<hr style="clear: both;width:100%;" />
</p>
</body>
</html>