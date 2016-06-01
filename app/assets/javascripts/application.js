//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require moment
//= require turbolinks

$(document).on('turbolinks:load', function(e) {
  $('[data-toggle="tooltip"]').tooltip();
});
