// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
//= require jquery.colorbox-min.js
//= require jquery.blocksit-min.js
//= require jquery.geocomplete.js

$(function(){
  $(".locator").on("click", function(){
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position){
        console.log(
          "lat", position.coords.latitude,
          "long", position.coords.longitude
        );
        window.location.href = "/locations/" 
        + position.coords.latitude 
        + "/" + position.coords.longitude;
      }, function(){
        window.location.href = "/locations/ip";
      },{timeout:5000});
    } else{
        window.location.href = "/locations/ip";
    }
  });


  $(".search-query").geocomplete().bind("geocode:result", function(e, r){
    window.location.href = "/locations/" 
      + r.geometry.location.kb 
      + "/" + r.geometry.location.lb ;
  });

  $(".grid .thumbnail img").click(function(){
    $.colorbox({href: $(this).attr("src")})    ;
  });

  $(".twitter-colorbox").colorbox({inline: true})

});

