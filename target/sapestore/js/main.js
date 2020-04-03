	$(function() {
    $('#forgotPassword').submit(function() {
        // show a hidden div to indicate progression
        $('#someHiddenDiv').show();
        return false;
    });
});

$(document).ready(function() {
	// get current URL path and assign 'active' class
	var url = $(location).attr('href');
	var pathname = url.split(document.domain)[1].slice(16)
	$('#header nav li').removeClass('active');
	if(pathname==""){
		$('.nav > li > a[href="/sapestore/"]').parent().addClass('active');
	}
	else
	    $('.nav > li > a[href="'+pathname+'"]').parent().addClass('active');
})

$(document).ready(function() {
	// get current URL path and assign 'highlighted' class
	var url = $(location).attr('href');
	var pathname = url.split(document.domain)[1].slice(16)
	$('.leftCol > nav > ul > li').removeClass('highlighted');
	$('.leftCol > nav > ul > li > a[href="'+pathname+'"]').parent().addClass('highlighted');
})

$('.pagination li').click(function() {
  $('.pagination li').removeClass('currentPage');    
  $(this).addClass('currentPage').css('color : #fff');
}); 

$( document ).ready(function(){
    $('#cnfrmregmsg').fadeIn('slow', function(){
       $('#cnfrmregmsg').delay(5000).fadeOut(); 
    });
});
$( document ).ready(function(){
    $('#emailVerifiedMessage').fadeIn('slow', function(){
       $('#emailVerifiedMessage').delay(5000).fadeOut(); 
    });
});
$( document ).ready(function(){
    $('#emailVerificationFailMessage').fadeIn('slow', function(){
       $('#emailVerificationFailMessage').delay(5000).fadeOut(); 
    });
});