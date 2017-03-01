import "imagesloaded"
import "slick-carousel"
import fitvids from "fitvids"
import Masonry from "masonry-layout"

fitvids();

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

if ($('.filter').length) {
  $('.toggle-filter').click(function() {
    $('.filter-caret').toggleClass('fa-caret-down fa-caret-right');
    $('.filter-list').toggle();
  });
}

if ($('.categories').length) {
  $('.toggle-categories').click(function() {
    $('.category-caret').toggleClass('fa-caret-down fa-caret-right');
    $('.category-list').toggle();
  });
}
