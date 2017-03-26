import "imagesloaded"
import "slick-carousel"
import "particles.js"
import fitvids from "fitvids"
import Masonry from "masonry-layout"

fitvids();

if ($('#particles').length) {
  var settings = {
    "particles": {
      "number": {
        "value": 80,
        "density": {
          "enable": true,
          "value_area": 800
        }
      },
      "color": {
        "value": "#ffffff"
      },
      "shape": {
        "type": "circle",
        "stroke": {
          "width": 0,
          "color": "#000000"
        },
        "polygon": {
          "nb_sides": 5
        },
        "image": {
          "src": "img/github.svg",
          "width": 100,
          "height": 100
        }
      },
      "opacity": {
        "value": 0.4,
        "random": false,
        "anim": {
          "enable": false,
          "speed": 1,
          "opacity_min": 0.1,
          "sync": false
        }
      },
      "size": {
        "value": 2,
        "random": true,
        "anim": {
          "enable": false,
          "speed": 40,
          "size_min": 0.1,
          "sync": false
        }
      },
      "line_linked": {
        "enable": false,
        "distance": 130,
        "color": "#ffffff",
        "opacity": 0.4,
        "width": 1
      },
      "move": {
        "enable": true,
        "speed": 1,
        "direction": "none",
        "random": false,
        "straight": false,
        "out_mode": "out",
        "bounce": false,
        "attract": {
          "enable": false,
          "rotateX": 600,
          "rotateY": 1200
        }
      }
    },
    "interactivity": {
      "detect_on": "canvas",
      "events": {
        "onhover": {
          "enable": false,
          "mode": "repulse"
        },
        "onclick": {
          "enable": false,
          "mode": "push"
        },
        "resize": true
      },
      "modes": {
        "grab": {
          "distance": 400,
          "line_linked": {
            "opacity": 1
          }
        },
        "bubble": {
          "distance": 400,
          "size": 40,
          "duration": 2,
          "opacity": 8,
          "speed": 3
        },
        "repulse": {
          "distance": 200,
          "duration": 0.4
        },
        "push": {
          "particles_nb": 4
        },
        "remove": {
          "particles_nb": 2
        }
      }
    },
    "retina_detect": true
  };
  
  particlesJS('particles', settings);
}

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

/*
function loop() {
    $('.clouds-fg').css({left:2288});
    $('.clouds-fg').animate ({
        left: '-=4576',
    }, 10000, 'linear', function() {
        loop();
    });
}
loop();
*/
