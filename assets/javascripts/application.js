// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery

//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require moment
//= require select2
//= require bootstrap
//= require_tree .
//= require_self


    
$(document).on('turbolinks:load', function(){var data = {'data-date-format': 'YYYY/MM/DD' };
  $('.datepicker').attr(data);
  $('.datepicker').datetimepicker();
})

$(document).on('turbolinks:load', function(){var data = {'data-date-format': 'YYYY/MM/DD hh:mm' };
  $('.datepicker2').attr(data);
  $('.datepicker2').datetimepicker();
})
document.addEventListener("turbolinks:load", function() {
 $('#tab-menu li').on('click', function(){
    if($(this).not('active')){
      // タブメニュー
      $(this).addClass('active').siblings('li').removeClass('active');
      // タブの中身
      var index = $('#tab-menu li').index(this);
      $('#tab-box div').eq(index).addClass('active').siblings('div').removeClass('active');
    }
  });
})
document.addEventListener("turbolinks:load", function() {
 $('#tab-menu2 li').on('click', function(){
    if($(this).not('active')){
      // タブメニュー
      $(this).addClass('active').siblings('li').removeClass('active');
      // タブの中身
      var index = $('#tab-menu2 li').index(this);
      $('#tab-box2 div').eq(index).addClass('active').siblings('div').removeClass('active');
    }
  });
})
document.addEventListener("turbolinks:load", function() {
 $('#tab-menu3 li').on('click', function(){
    if($(this).not('active')){
      // タブメニュー
      $(this).addClass('active').siblings('li').removeClass('active');
      // タブの中身
      var index = $('#tab-menu3 li').index(this);
      $('#tab-box3 div').eq(index).addClass('active').siblings('div').removeClass('active');
    }
  });
})
document.addEventListener("turbolinks:load", function() {
$(document).ready(function(){
    $(".dropdown-toggle").dropdown();
});
})  
