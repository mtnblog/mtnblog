// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"
import "imagesloaded"
import "slick-carousel"
import fitvids from "fitvids"
import Masonry from "masonry-layout"
import socket from "./socket"

fitvids()

$('.grid').imagesLoaded(function() {
  $('.grid').animate({'opacity': 1});
  var masonry = new Masonry('.grid', {
    columnWidth: '.grid-sizer',
    itemSelector: '.grid-item',
    gutter: 5 
  });
});

/*
$('.hero').slick({
  slidesToShow: 1,
  slidesToScroll: 1,
  arrows: false,
  fade: true,
  adaptiveHeight: true,
  asNavFor: '.carousel'
});
$('.carousel').slick({
  centerMode: true,
  infinite: true,
  slidesToShow: 3,
  asNavFor: '.hero',
  variableWidth: true,
  responsive: [
    {
      breakpoint: 480,
      settings: {
        slidesToShow: 1
      }
    }
  ]
});
*/
