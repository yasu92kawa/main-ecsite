
! function($) {
    "use strict";

    var KerriApp = function() {};

    //scroll
    KerriApp.prototype.initStickyMenu = function() {
        $(window).on('scroll',function() {
            var scroll = $(window).scrollTop();

            if (scroll >= 50) {
                $(".sticky").addClass("stickyadd");
            } else {
                $(".sticky").removeClass("stickyadd");
            }
        });
    },

    //Scrollspy
    KerriApp.prototype.initScrollspy = function() {
        $("#navbarCollapse").scrollspy({
            offset:20
        });
    },

  //Scrollspy
    KerriApp.prototype.initScrollspy = function() {
        $("#navbarCollapse").scrollspy({
            offset:20
        });
    },

  //Typed
    KerriApp.prototype.initTextType = function() {
        $(".element").each(function() {
            var $this = $(this);
            $this.typed({
                strings: $this.attr('data-elements').split(','),
                typeSpeed: 100,
                backDelay: 3000
            });
        });
    },



    KerriApp.prototype.init = function() {
        this.initStickyMenu();
        this.initScrollspy();
        this.initTextType();
    },
    //init
    $.KerriApp = new KerriApp, $.KerriApp.Constructor = KerriApp
}(window.jQuery),

//initializing
function($) {
    "use strict";
    $.KerriApp.init();
}(window.jQuery);