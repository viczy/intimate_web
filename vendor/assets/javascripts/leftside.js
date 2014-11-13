;( function( window ) {
	
	'use strict';

	var leftsideUL;
    var all;

    // if (window.currentIndex === undefined) {
    // 	window.currentIndex = 12;
    // };
    
    if (!leftsideUL) {
    	leftsideUL = $('#leftside');
    };

    if (!all) {
    	all= leftsideUL.children('li');
    };

    // all.click(function(){
    //     leftsideUL.class= 'leftside';
    //     leftsideUL.addClass($(this).attr('class'));
    // });

    all.hover(
        function () {
            $('a',$(this)).stop().animate({'marginLeft':'-2px'},200);
        },
        function () {
            $('a',$(this)).stop().animate({'marginLeft':'-75px'},200);
        }
    );

    all.each(function(){
        var indexA = $(this);
        indexA.removeClass("tab_current");
        if (leftsideUL.hasClass(indexA.attr('class'))) {
            indexA.addClass("tab_current");
        };
    });

    $('#leftside a').stop().animate({'marginLeft':'-75px'},1000);

})( window );