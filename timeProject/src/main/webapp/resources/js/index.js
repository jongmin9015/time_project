$(document).ready(function(){

    
    let totalNum = $(".main_img_box img").length;
    let imgWidth = $(".slider li").width();
    let imgTotalWidth = imgWidth * totalNum;

    let roll = setInterval(next, 10000);
    
    init()
    
    $(".nextBtn").click(function(){
        clearInterval(roll);
        next();
    });

    $(".prevBtn").click(function(){
        clearInterval(roll);
        prev();
    });

    function init() {
    $(".page span:first").text(1);
    $(".page span:last").text(totalNum); 
    $(".slider").width( imgTotalWidth );
    }

    $(".main_img_box > button").mouseleave(function(){
        let roll = setInterval(next, 1000);
    });

    function next() {
        $(".slider").stop().animate({marginLeft: -imgWidth}, 500, "swing", function(){
            $(".slider>li:first").appendTo(".slider");
            $(".slider").css({marginLeft: 0});
            let num = $(".slider>li:first").children("img").attr("alt");
            $(".page span:first").text(num);
        });
    }
    function prev() {
        $(".slider").css({marginLeft: -imgWidth}); 
        $(".slider>li:last").prependTo(".slider");
        $(".slider").animate({marginLeft: 0}, 500, "swing", function(){
            let num = $(".slider>li:first").children("img").attr("alt");
            $(".page span:first").text(num);
        });
    }


    $('.main_content_list').bxSlider({  

        minSlides: 4,

        maxSlides: 4,
      
        slideWidth: 300,

        pager : false,

        HideControlOnEnd : true
      
    });

});
