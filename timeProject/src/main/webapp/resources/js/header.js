// Header 메뉴바 고정
$(document).ready(function() {
	
    var wind = $(window),
    header = $('#gnbMenu'),
    headerOffsetTop = header.offset().top;


    wind.scroll(function() {
    	
       if(wind.scrollTop()>= headerOffsetTop) {
        header.addClass('sticky');
        
       } else {
        header.removeClass('sticky');
      }
       
    });
    
    const login_user = document.querySelector('#login_user');  
    const login_user_menu = document.querySelector('.login_user_menu');  
    
    login_user.addEventListener('mouseover', function() {	
    	
    	login_user_menu.style.display = 'block';
    });
    login_user_menu.addEventListener('mouseout', function() {  	
    	
    	login_user_menu.style.display = 'none';
	});
   
});