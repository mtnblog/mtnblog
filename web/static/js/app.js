import fitvids from "fitvids"
import "imagesloaded"
import Masonry from "masonry-layout"

if ($('.grid').length) {
  $('.grid').imagesLoaded(function() {
    $('.grid').animate({'opacity': 1});
    var masonry = new Masonry('.grid', {
      columnWidth: '.grid-sizer',
      itemSelector: '.grid-item',
      gutter: 5 
    });
  });
}

fitvids();
