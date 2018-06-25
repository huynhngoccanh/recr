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
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require select2
//= require turbolinks
//= require selects
//= require countUp
//= require_tree .

$(document).on('ready turbolinks:load', function (){

  var $window     = $(window);
  var $header     = $('header');
  var $searchForm = $('.search-header');
  var $dashboardNav = $('.dashboardNav ul');
  var controllerNamme = '<%= controller_name %>';
  if (controllerName != 'message') {
    $window.on('scroll', function(){

      var $scrollTop    = $window.scrollTop();
      var $sidebarTop   = $('.dashboardHeader').outerHeight() - 60;

      if( $scrollTop > 60){

          $header.addClass('small');
          $searchForm.addClass('active');

      } else{

          $header.removeClass('small');
          $searchForm.removeClass('active');

      }
    });
    //$("body, html").scrollTop($("[data-behavior='set-scroll-top']").offset().top);

  }

});
$(document).on('click', '[data-behavior="toggleMenu"]', function(){

  var $userMenu = $('.userMenu');

  $(this).toggleClass('active');
  $userMenu.toggleClass('open');

});


$(document).on('click', '[data-behavior="toggleSearch"]', function(){

  var $appSearch = $('#appSearch');

  $appSearch.fadeToggle('fast', function(){

    $appSearch.find('input').val('');

  });
  $('body').toggleClass('overflowHidden');

});


$(document).on('click', '[data-behavior="closeSearch"]', function(){

  var $appSearch = $('#appSearch');

  $appSearch.fadeOut('fast', function(){

    $appSearch.find('input').val('');

  });
  $('body').removeClass('overflowHidden');

});


$(document).on('click', '[data-behavior="openMobileMenu"]', function(){

  $('#main, .mobile-nav').toggleClass('open');
  $(this).toggleClass('active');

});










