import "imagesloaded"
import fitvids from "fitvids"
import Masonry from "masonry-layout"

fitvids();

$('.grid').imagesLoaded(function() {
  $('.grid').animate({'opacity': 1});
  var masonry = new Masonry('.grid', {
    columnWidth: '.grid-sizer',
    itemSelector: '.grid-item',
    gutter: 5 
  });
});

