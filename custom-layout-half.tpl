<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
	<head>
		{% include "html-head" %}
		{% stylesheet_link "custom-layouts-grid.css" %}
	</head>

	<body>
		<div class="wrapper">
			<div class="header">
				{% include "header" %}
			</div>

			<div class="main js-bg-data" style="background-color:{{ page.data.main-bg.color }}; background-image:url({{ page.data.main-bg.image }});">
				{% if editmode %}
					<button class="js-bg-picker" data-bind="main-bg" data-bg="{{ page.data.main-bg | json | escape }}"></button>
				{% endif %}

				<div class="container">
					<div class="custom-row">
						<div class="main__content main__content--1 js-bg-data clear" style="background-color:{{ page.data.content-bg-1.color }}; background-image:url({{ page.data.content-bg-1.image }});">
						{% if editmode %}
							<button class="js-bg-picker" data-bind="content-bg-1" data-bg="{{ page.data.content-bg-1 | json | escape }}"></button>
						{% endif %}

							<div class="custom-col-sm-12">{% content name="main-content-1" %}</div>
						</div>
					</div>

					<div class="custom-row">
						<div class="main__content main__content--2 js-bg-data clear" style="background-color:{{ page.data.content-bg-2.color }}; background-image:url({{ page.data.content-bg-2.image }});">
						{% if editmode %}
							<button class="js-bg-picker" data-bind="content-bg-2" data-bg="{{ page.data.content-bg-2 | json | escape }}"></button>
						{% endif %}

							<div class="custom-col-sm-6">{% content name="main-content-2" %}</div>
							<div class="custom-col-sm-6">{% content name="main-content-3" %}</div>
						</div>
					</div>

					<div class="custom-row">
						<div class="main__content main__content--3 js-bg-data clear" style="background-color:{{ page.data.content-bg-3.color }}; background-image:url({{ page.data.content-bg-3.image }});">
						{% if editmode %}
							<button class="js-bg-picker" data-bind="content-bg-3" data-bg="{{ page.data.content-bg-3 | json | escape }}"></button>
						{% endif %}

							<div class="custom-col-sm-12">{% content name="main-content-4" %}</div>
						</div>
					</div>

					<div class="custom-row">
						<div class="main__content main__content--4 js-bg-data clear" style="background-color:{{ page.data.content-bg-4.color }}; background-image:url({{ page.data.content-bg-4.image }});">
						{% if editmode %}
							<button class="js-bg-picker" data-bind="content-bg-4" data-bg="{{ page.data.content-bg-4 | json | escape }}"></button>
						{% endif %}

							<div class="custom-col-sm-6">{% content name="main-content-5" %}</div>
							<div class="custom-col-sm-6">{% content name="main-content-6" %}</div>
						</div>
					</div>

					<div class="custom-row">
						<div class="main__content main__content--5 js-bg-data clear" style="background-color:{{ page.data.content-bg-5.color }}; background-image:url({{ page.data.content-bg-5.image }});">
						{% if editmode %}
							<button class="js-bg-picker" data-bind="content-bg-5" data-bg="{{ page.data.content-bg-5 | json | escape }}"></button>
						{% endif %}

							<div class="custom-col-sm-12">{% content name="main-content-7" %}</div>
						</div>
					</div>
				</div>
			</div>

			<div class="footer">
				{% include "footer" %}
			</div>
		</div>

		{% include "javascripts" %}

		{% editorjsblock %}
		<script src='{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js'></script>
		<script>
			$(function() {
				var binds = {},
						preview = {},
						pageDataObject = {},
						pageData = new Edicy.CustomData({
							type: 'page',
							id: '{{ page.id }}'
						});

				$.each($('.js-bg-picker'), function(index, picker) {
					var bgPicker = new Edicy.BgPicker(picker, {
						preview: function(data) {
							binds = {
								color: data.color,
								image: data.image
							};

							preview = {
								'background-image': 'url('+binds.image+')' || 'none',
								'background-color': binds.color || 'transparent'
							};

							var name = $(picker).data('bind');
							pageDataObject[name] = binds;
							console.log(pageDataObject);

							$(picker).closest('.main__content').css(preview);
						},
						commit: function(data) {
							pageData.set(BGPicker = pageDataObject);
						}
					});
				});
			});
		</script>
		{% endeditorjsblock %}
	</body>
</html>
