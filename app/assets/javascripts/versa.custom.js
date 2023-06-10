$(function () {
    /**tooltip & popovers **/
    $('[data-toggle="tooltip"]').tooltip();
    $('[data-toggle="popover"]').popover();
    $(".dropdown-search > .search-dropdown-menu").click(function (e) {
        e.stopPropagation();
    });
    /**testimonials**/
    if ($('.owl-testimonials').length) {
        $('.owl-testimonials').owlCarousel({
            loop: true,
            margin: 10,
            nav: false,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 3
                },
                1000: {
                    items: 3
                }
            }
        });
    }
    /**testimonials full**/
    if ($('.owl-testimonials-full').length) {
        $('.owl-testimonials-full').owlCarousel({
            loop: true,
            margin: 10,
            nav: false,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 1
                },
                1000: {
                    items: 1
                }
            }
        });
    }
    /**testimonials full with parallax background**/
    if ($('.testimonials-light').length) {
        $('.testimonials-light').owlCarousel({
            loop: true,
            margin: 10,
            nav: false,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 1
                },
                1000: {
                    items: 1
                }
            }
        });
    }
    /**web app saas**/
    if ($('.owl-image-header').length) {
        $('.owl-image-header').owlCarousel({
            loop: true,
            margin: 10,
            nav: false,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 1
                },
                1000: {
                    items: 1
                }
            }
        });
    }
    /**web app saas**/
   if ($('.owl-clients').length) {
        $('.owl-clients').owlCarousel({
            loop: true,
            margin: 10,
            nav: false,
            dots: false,
            responsive: {
                0: {
                    items: 2
                },
                600: {
                    items: 3
                },
                1000: {
                    items: 5
                }
            }
        });
   }
    /**image slides only**/
    if($(".cta-bg-slider").length) {
        $(".cta-bg-slider").backstretch([
            "./images/bg-5.jpg",
            "./images/bg-6.jpg",
            "./images/bg-4.jpg"
        ], {duration: 4000});
    }
    /**on hover tabs**/
    $('.nav-tabs.hover-tabs > li > a').hover(function () {
        $(this).tab('show');
    });
    /** default onload modal magnific popup**/
    setTimeout(function () {
        if ($('#onloadModal').length) {
            $.magnificPopup.open({
                items: {
                    src: '#onloadModal'
                },
                type: 'inline'
            });
        }
    }, 500);
    /**video modal**/
    if($('.video-popup').length) {
        $('.video-popup').magnificPopup({
            type: 'iframe'
                // other options
        });
    }
    /**navbar sticky **/
    $(window).scroll(function () {
        var winTop = $(window).scrollTop();
        if (winTop >= 100) {
            $(".navbar-sticky").addClass("sticky-active");
        } else {
            $(".navbar-sticky").removeClass("sticky-active");
        }//if-else
    });//win func.
    if($(".typed").length) {
        $(".typed").typed({
            strings: ["Beautifully handcrafted", "Easily customizable", "Modern tools for startups"],
            typeSpeed: 50,
            backSpeed: 10,
            backDelay: 2000,
            showCursor: false,
            fadeOut: true,
            loop: true
        });
    }
    /**animation**/
    wow = new WOW(
            {
                boxClass: 'wow',
                animateClass: 'animated',
                offset: 0,
                mobile: true,
                live: true
            }
    );
    wow.init();
    /**smooth scroll**/
    scroll = new SmoothScroll('[data-scroll]', {
        // Selector for links (must be a class, ID, data attribute, or element tag)
        speed: 1000, // Integer. How fast to complete the scroll in milliseconds
        easing: 'easeInOutCubic', // Easing pattern to use
        offset: 56, // Integer. How far to offset the scrolling anchor location in pixels
        callback: function (anchor, toggle) {} // Function to run after scrolling
    });

});

