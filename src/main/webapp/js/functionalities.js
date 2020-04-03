function showBanner(id)
{
	 $("#"+id).fadeIn('slow', function(){
	       $("#"+id).delay(5000).fadeOut(); 
	    });
}

/******************************************************************/
/******************************************************************/
/******************************************************************/

function minval(e) {
    // alert("dsadass");
    //yyy- mm - dd
    var mindate = e.target.value;
  //  alert(mindate);
    var x = mindate.toString();
    var minday = new Date(mindate);
    var yyyy = minday.getFullYear();
    var dd = minday.getDate();
    var mm = minday.getMonth() + 1;
    //alert(yyyy);
    //=2565201

    var today = new Date();
    var yyyy2 = today.getFullYear();
    var dd2 = today.getDate();
   var mm2 = today.getMonth() + 1;

    if(yyyy==yyyy2 ){
        if(mm==mm2  && dd>=dd2){
            var t= new Date();
        t.setFullYear(2017, 0, 1);
        //alert(today);
        e.target.value = t.toISOString().split('T')[0];
        }else if(mm > mm2){
            var t= new Date();
        t.setFullYear(2017, 0, 1);
        //alert(today);
        e.target.value = t.toISOString().split('T')[0];
        }else{

        }
    }
    if (yyyy > yyyy2 ) {

        var t= new Date();
        t.setFullYear(2017, 0, 1);
        //alert(today);
        e.target.value = t.toISOString().split('T')[0];
         }
         var t1= new Date();
        t1.setFullYear(2017, 0, 1);
         e.target.setAttribute("min",t1.toISOString().split('T')[0]);
   //      e.target.setAttribute("defaultDate",t1.toISOString().split('T')[0]);
        e.target.setAttribute("max",today.toISOString().split('T')[0]);
}

// Function to disable submit button in case or errors in form
function disableSubmitButton(errorid)
{
	if(document.getElementById("erroradd1").innerHTML=="" && 
			document.getElementById("errormobile").innerHTML=="" &&
			document.getElementById("errorpassword").innerHTML=="" &&
			document.getElementById("passwarn").innerHTML=="" &&
			document.getElementById("erroremail").innerHTML=="" && 
			document.getElementById("errorfirstname").innerHTML=="" &&
			document.getElementById("errorlastname").innerHTML=="" &&
		 	document.getElementById("errorusername").innerHTML=="")
	{
		document.getElementById("submitbtn").disabled=false;
		document.getElementById(errorid).style.display="none";
		if(errorid=="passwarn")
			document.getElementById("errorpassword").style.display="none";
	} 
	else
	{
		document.getElementById("submitbtn").disabled=true;
	}
}

/******************************************************************/
/******************************************************************/
/******************************************************************/

// Function to verify email in overlay when user clicks on forget password
function verifyEmail(id, errorid)
{
	var email=document.getElementById(id).value;
	document.getElementById(errorid).innerHTML="Please wait ...";
	var ajax = new XMLHttpRequest();
	ajax.open("GET", "checkemail?email=" +email , true);
	ajax.send();
	ajax.onreadystatechange = function() {
		var res = ajax.responseText;
		if (ajax.readyState == 4 && ajax.status == 200) 
		{
			if(res.length>0)
			{
				document.getElementById(errorid).style.display="block";
				 if(res=="success")
				 {	
					document.getElementById(errorid).innerHTML="Link for password reset has been sent. ";
				 }
				else if(res=="invalid")
				{
					document.getElementById(errorid).innerHTML="Email address not registered.";
				} 
			}
		}
		}
	disableSubmitButton(errorid);
}

/******************************************************************/
/******************************************************************/
/******************************************************************/

//Login Functionality		
function login()
{
	var userName=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	document.getElementById("errorusernamelogin").innerHTML="";
	document.getElementById("errorpasswordlogin").innerHTML="";
	document.getElementById("errorlogin").innerHTML="";
	if(userName==null || userName=="")
	{
		document.getElementById("errorusernamelogin").innerHTML="Please enter the username";
	}
	if(password==null || password=="")
	{
		document.getElementById("errorpasswordlogin").innerHTML="Please enter the password";
	}
	if(userName==null || userName=="" ||password==null || password=="")
	{
		return;
	}
	else
	{
		var url=location.href;
		var urlParts=url.split("#");
		var ajax = new XMLHttpRequest();
		ajax.open("POST", "login", true);
		ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		ajax.send("userName=" +userName+"&userPassword="+password);
		ajax.onreadystatechange = function() {
		var res = ajax.responseText;
		if (ajax.readyState == 4 && ajax.status == 200) 
		{
			if(res.length>0)
			{
				if(res=="success")
				{
					var str=urlParts[0];
					str=str.replace('logout','');
					str=str.replace('updatepassword','');
					str=str.replace('getregister','');
					str=str.replace('register','');
					if(str.includes('search'))
					str = str.substring(0,str.lastIndexOf("/"))+"/searchpage"
					if(str.includes('verifymail'))
					str = str.substring(0,str.lastIndexOf("/"))
					location.href=str;
				}
				else if(res=="invalid1"){
					document.getElementById("errorlogin").innerHTML="You are already logged in another PC";
				}
				else
				{
					document.getElementById("errorlogin").innerHTML="Incorrect Credentials";
				}
			}
		}
		}
		}
}

/******************************************************************/
/******************************************************************/
/******************************************************************/

//Function to set state in dropdown in form
function setState()
{
	var countryId=document.getElementById("country").value;
	var sel = document.getElementById("state");
	var ajax = new XMLHttpRequest();
	console.log(countryId)
	ajax.open("GET", "getstates?countryid=" +countryId , true);
	ajax.send();
	ajax.onreadystatechange = function() {
		var res = ajax.responseText;
		if (ajax.readyState == 4 && ajax.status == 200) 
		{
			if(res.length>0)
			{
				document.getElementById("state").innerHTML="";
				var json = JSON.parse(res);
				var opt = document.createElement("option");
				opt.value= "";
				opt.innerHTML = "--Select a State--";
				opt.selected="selected";
				sel.appendChild(opt);
				for (var idx = 0; idx < json.length; idx++) 
				{
					var opt = document.createElement("option");
					opt.value= json[idx].stateId;
					opt.innerHTML = json[idx].stateName;
					sel.appendChild(opt);
				}
			} 
		}
		}
	setCity();
	setPostal();
}

/******************************************************************/
/******************************************************************/
/******************************************************************/

//Function to set state in dropdown in form
function setCity()
{
	var stateId=document.getElementById("state").value;
	document.getElementById("city").innerHTML="";
	var sel = document.getElementById("city");
	if(stateId=="")
	{
		var opt = document.createElement("option");
		opt.value= "";
		opt.innerHTML = "--Select a City--";
		opt.selected="selected";
		sel.appendChild(opt);
		document.getElementById("postal").value="";
		return;
	}
	var ajax = new XMLHttpRequest();
	ajax.open("GET", "getcities?stateid=" +stateId , true);
	ajax.send();
	ajax.onreadystatechange = function() {
		var res = ajax.responseText;
		if (ajax.readyState == 4 && ajax.status == 200) 
		{
			if(res.length>0)
			{
				var opt = document.createElement("option");
				opt.value= "";
				opt.innerHTML = "Select a City";
				opt.selected="selected";
				sel.appendChild(opt);
				var json = JSON.parse(res);
				for (var idx = 0; idx < json.length; idx++) 
				{
					var opt = document.createElement("option");
					opt.value= json[idx].cityId;
					opt.innerHTML = json[idx].cityName;
					sel.appendChild(opt);
				}
			} 
		}
		}
	setPostal();	
}

/******************************************************************/
/******************************************************************/
/******************************************************************/

//Function to auto-fill Postal code in form from city
function setPostal()
{
	var cityId=document.getElementById("city").value;
	if(cityId=="")
	{
		document.getElementById("postal").value="";
	}
	var ajax = new XMLHttpRequest();
	ajax.open("GET", "getpostal?cityid=" +cityId , true);
	ajax.send();
	ajax.onreadystatechange = function() {
		var res = ajax.responseText;
		if (ajax.readyState == 4 && ajax.status == 200) 
		{
			if(res.length>0)
			{
				document.getElementById("postal").value=res;	
			}
		} 
		}
}
	
/******************************************************************/
/******************************************************************/
/******************************************************************/

//Function to verify username in form	
function validUsername(id, errorid)
{
	var username=document.getElementById(id);
	//if(username.value.trim()=="")
		username.value=username.value.trim();
	document.getElementById("submitbtn").disabled=false;
	document.getElementById(errorid).style.display="none";
	document.getElementById(errorid).innerHTML="";
	var regex=/^\s*\S+\s*$/;
	if(regex.test(username.value)==false)
	{
		document.getElementById(errorid).style.display="block";
		document.getElementById(errorid).innerHTML='<span><i class="icon-exclamation-sign"></i></span> Username cannot have spaces in between.';
		document.getElementById("submitbtn").disabled=true;
	} 
	if(username.value.length>25||username.value.length<5)
	{
		document.getElementById(errorid).style.display="block";
		document.getElementById(errorid).innerHTML='<span><i class="icon-exclamation-sign"></i></span>Length is not less than 5 and not more than 25.';
		document.getElementById("submitbtn").disabled=true;
	}
	var ajax = new XMLHttpRequest();
	ajax.open("GET", "checkusername?username=" +username.value, true);
	ajax.send();
	ajax.onreadystatechange = function() {
	var res = ajax.responseText;
	//alert(res);
	if (ajax.readyState == 4 && ajax.status == 200) 
	{
		if(res.length>0)
		{
			if(res=="success")
			{
//				alert("exists!")
				document.getElementById(errorid).style.display="block";
				document.getElementById(errorid).innerHTML='<span><i class="icon-exclamation-sign"></i></span>User Name Already Exists.';
				document.getElementById("submitbtn").disabled=true;
			}					
		}
	}
	}
	disableSubmitButton(errorid);
}

/******************************************************************/
/******************************************************************/
/******************************************************************/

//Function to verify email format in form	
function verifyUserEmail(id, errorid)
{
	var email=document.getElementById(id).value;
	var emailregex = /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/;
	document.getElementById("submitbtn").disabled=false;
	document.getElementById(errorid).style.display="none";
	document.getElementById(errorid).innerHTML="";
	if(emailregex.test(email)==false)
	{
		document.getElementById(errorid).style.display="block";
	   	document.getElementById(errorid).innerHTML='<span><i class="icon-exclamation-sign"></i></span>Email format incorrect. Please check for @ and .';
		document.getElementById("submitbtn").disabled=true;
	}
	else
	{
		var ajax = new XMLHttpRequest();
		ajax.open("GET", "checkemail1?email=" +email , true);
		ajax.send();
		ajax.onreadystatechange = function() {
		var res = ajax.responseText;
//		alert(res)
		if (ajax.readyState == 4 && ajax.status == 200) 
		{
			if(res.length>0)
			{
				if(res=="success")
				{
					
					document.getElementById(errorid).style.display="block";
				   	document.getElementById(errorid).innerHTML='<span><i class="icon-exclamation-sign"></i></span>Email Already Exists.';
					document.getElementById(errorid).disabled=true;
					document.getElementById("submitbtn").disabled=true;
					return;
				}
			}
		}
		}
	}
	disableSubmitButton(errorid);
}

/******************************************************************/
/******************************************************************/
/******************************************************************/

//Function to validate password and retype password
function checkMatch(pid, cid, errorpid, errorcid)
{
	var pwd=document.getElementById(pid).value;
	var rpwd=document.getElementById(cid).value;
	document.getElementById(errorcid).innerHTML="";
	document.getElementById(errorpid).innerHTML="";
	document.getElementById(errorcid).style.display="none";
	document.getElementById(errorpid).style.display="none";
	var regex=/^(?=.*\d)[a-zA-Z\d_@./#&+-]{8,13}$/; 
	if(pwd.length<8 || pwd.length>13 || regex.test(pwd)==false)
	{
		document.getElementById(errorpid).style.display="block";
		document.getElementById(errorpid).innerHTML='<span><i class="icon-exclamation-sign"></i></span> Password should be between 8 and 13 characters and at least one number should be included.';
		document.getElementById("submitbtn").disabled=true;
	}
	if(pwd==rpwd)
	{
	}
	else
	{
		document.getElementById(errorcid).style.display="block";
		document.getElementById(errorcid).innerHTML='<span><i class="icon-exclamation-sign"></i></span> Passwords don\'t match';
		document.getElementById("submitbtn").disabled=true;
	}
	disableSubmitButton(errorcid);
}

/******************************************************************/
/******************************************************************/
/******************************************************************/

//Function to validate reset password form
function resetPassCheck(pid, cid, errorpid, errorcid)
{
	var pwd=document.getElementById(pid).value;
	var rpwd=document.getElementById(cid).value;
	document.getElementById(errorcid).innerHTML="";
	document.getElementById(errorpid).innerHTML="";
	document.getElementById(errorcid).style.display="none";
	document.getElementById(errorpid).style.display="none";
	var regex=/^(?=.*\d)[a-zA-Z\d_@./#&+-]{8,13}$/; 
	if(pwd.length<8 || pwd.length>13 || regex.test(pwd)==false)
	{
		document.getElementById(errorpid).style.display="block";
		document.getElementById(errorpid).innerHTML='<span><i class="icon-exclamation-sign"></i></span> Password should be between 8 and 13 characters and at least one number should be included.';
		document.getElementById("submitbtn").disabled=true;
	}
	if(pwd==rpwd)
	{
	}
	else
	{
		document.getElementById(errorcid).style.display="block";
	    document.getElementById(errorcid).innerHTML='<span><i class="icon-exclamation-sign"></i></span> Passwords don\'t match';
		document.getElementById("submitbtn").disabled=true;
	}
	if(	document.getElementById(errorpid).innerHTML=="" &&
			document.getElementById(errorcid).innerHTML=="" )
	{
		document.getElementById(errorcid).style.display="none";
		document.getElementById(errorpid).style.display="none";
		document.getElementById("submitbtn").disabled=false;
	} 
	else
	{
		document.getElementById("submitbtn").disabled=true;
	}
}

/******************************************************************/
/******************************************************************/
/******************************************************************/

//Function to verify first name and last name in form
function check_Alpha(id, errorid)
{
    var regex = /^[a-zA-Z ]*$/;
    var letters=document.getElementById(id);
    if(letters.value.trim()=="")
    	letters.value = letters.value.trim();
    letters.value=letters.value.replace(/ +/g," "); 
    document.getElementById(errorid).innerHTML="";
    document.getElementById(errorid).style.display="none";
    document.getElementById("submitbtn").disabled=false;
    if(regex.test(letters.value) == false || letters.value.trim().length==0 || letters.value.trim().length>25)
    {
    	document.getElementById(errorid).style.display="block";
	   	document.getElementById(errorid).innerHTML='<span><i class="icon-exclamation-sign"></i></span> Name must be in alphabets only and length between 1 and 25.'; 
		document.getElementById("submitbtn").disabled=true;
	}
    disableSubmitButton(errorid);
}

function removespaces(id)
{
	var x = document.getElementById(id);
    x.value = x.value.trim();
    x.value=x.value.replace(/ +/g," ");
} 
/******************************************************************/
/******************************************************************/
/******************************************************************/

//Function to verify phone format in form
function check_Phone(id, errorid)
{
	var regex=/^[0-9]{10}$/;
	var phone=document.getElementById(id).value;
	document.getElementById(errorid).innerHTML="";
	document.getElementById(errorid).style.display="none";
	document.getElementById("submitbtn").disabled=false;
	if(regex.test(phone)==false)
	{
		document.getElementById(errorid).style.display="block";
		document.getElementById(errorid).innerHTML='<span><i class="icon-exclamation-sign"></i></span> Incorrect format.';
		document.getElementById("submitbtn").disabled=true;
	}
	disableSubmitButton(errorid);
} 

/******************************************************************/
/******************************************************************/
/******************************************************************/

//Function to verify address format in form
function check_address(id, errorid)
{
	var add=document.getElementById(id).value;
	if(add.trim()=="")
		document.getElementById(id).value = add.trim();
	document.getElementById(errorid).innerHTML="";
	document.getElementById(errorid).style.display="none";
	document.getElementById("submitbtn").disabled=false;
	if(add.length>200 || add.length<5)
	{
		document.getElementById(errorid).style.display="block";
		document.getElementById(errorid).innerHTML='<span><i class="icon-exclamation-sign"></i></span> length should be between 5 & 200';
		document.getElementById("submitbtn").disabled=true;
	}
	disableSubmitButton(errorid);
}

/******************************************************************/
/******************************************************************/
/******************************************************************/

//Function to enable edit customer form
function EnableForm()
{
	document.getElementById("firstName").removeAttribute("readonly");
	document.getElementById("lastName").removeAttribute("readonly");
	document.getElementById("passwarn").style.display="none";
	document.getElementById("mobile").removeAttribute("readonly");
	document.getElementById("addressLine1").removeAttribute("readonly");
	document.getElementById("addressLine2").removeAttribute("readonly");
	document.getElementById("country").disabled=false;
	document.getElementById("state").disabled=false;
	document.getElementById("city").disabled=false;
	document.getElementById("block1").style.display="none";
	document.getElementById("block2").style.display="block";
	setState();
}

/******************************************************************/
/******************************************************************/
/******************************************************************/

//Function to disable edit customer form
function DisableForm()
{
	var url=location.href;
	location.href=url.replace("updateprofile", "editprofile");
}
/******************************************************************/
/******************************************************************/
/******************************************************************/

	function hide(id){
		document.getElementById(id).style.display="none";
	}
	
	function review_calc(id){
		var review = document.getElementById(id).innerHTML
		document.getElementById(id).innerHTML = Math.floor(review);
		
	}
	
	function addcart(isbn){
		var ajax=new XMLHttpRequest();
		ajax.open("GET","addbooktoCart?isbn="+isbn, true);
		ajax.send();
		ajax.onreadystatechange=function(){
			var res=ajax.responseText;
			if(ajax.readyState==4 && ajax.status==200){
				
				if(res=="invalid"){
					$('#carterrormsg').fadeIn('slow', function(){
					       $('#carterrormsg').delay(5000).fadeOut(); 
					    });
					location.href='#top';
					return;
				}
				
				var url=location.href;
				url= url.split(document.domain)[1].slice(16)
				console.log(url);
				var url1=location.href;
				if(url.includes("search")){
					url1=url1.replace(url,'searchpage');
					location.href=url1;
				}
				else if(!url.includes("addr")){
					location.href=url1;
				}
				else{
					url1=url1.replace(url,"");
					console.log(location.hostname+"/sapestore/viewdetails?isbn="+isbn);
					var url=url1+"/viewdetails?isbn="+isbn;
					location.href=url;
					console.log(url);
				}
				
			}
		}
		
		
	}
	
	function addcartrent(isbn){
		var ajax=new XMLHttpRequest();
		ajax.open("GET","addtoCart?isbn="+isbn, true);
		ajax.send();
		ajax.onreadystatechange=function(){
			var res=ajax.responseText;
			if(ajax.readyState==4 && ajax.status==200){
				
				if(res=="invalid"){
					$('#carterrormsg').fadeIn('slow', function(){
					       $('#carterrormsg').delay(5000).fadeOut(); 
					    });
					location.href='#top';
					return;
				}
				
				var url=location.href;
				url= url.split(document.domain)[1].slice(16)
				console.log(url);
				var url1=location.href;
				if(url.includes("search")){
					url1=url1.replace(url,'searchpage');
					location.href=url1;
				}
				else if(!url.includes("addr")){
					location.href=url1;
				}
				else{
					url1=url1.replace(url,"");
					console.log(location.hostname+"/sapestore/viewdetails?isbn="+isbn);
					var url=url1+"/viewdetails?isbn="+isbn;
					location.href=url;
					console.log(url);
				}
				
			}
		}
		
		
	}
	
	
	function removecart(isbn){
		var divis = document.getElementById("bookrow"+isbn);
		divis.style.display = 'none';
		doTotal();
		var ajax=new XMLHttpRequest();
		ajax.open("GET","removefromcart?isbn="+isbn, true);
		ajax.send();
		ajax.onreadystatechange=function(){
			var res=ajax.responseText;
			if(ajax.readyState==4 && ajax.status==200){
				/* updateDiv(); */
				var x = document.getElementById("row"+isbn);
			    x.parentNode.removeChild(x);
			    
			    if(res == 0){
			    	document.getElementById("itemsofcart").style.display='block';
			    	document.getElementById("itemsofcart").innerHTML="";
			    	document.getElementById("totalamtpay").style.display="none";
			    	var html = "<div style='position: absolute; left: 320px; top: 200px' >Your "+
			    	"cart is empty</div>"+
			    	"<a href='/sapestore/' ><input type='submit'"+
			    	"value='Close &amp; Continue Shopping' class='lightButton'"+
			    	"style='position: absolute; left: 20px; bottom: 30px'>";
			    	document.getElementById("shoppingCart").innerHTML+=html;
			    }
//			    var v = ${sessionScope.cartitems};
//			    alert(length);
			    doTotal();
			}
		}
		
	}
	
		function checkFirstVisit() {
			  if(document.cookie.indexOf('mycookie')==-1) {
			    // cookie doesn't exist, create it now
			    document.cookie = 'mycookie=1';
			  }
			  else {
			    // not first visit, so alert
				  sleep(10000);
				  document.getElementById("cartmsg").innerHTML = "  ";
			  }
			}

		function sleep(milliseconds) {
			  var start = new Date().getTime();
			  for (var i = 0; i < 1e7; i++) {
			    if ((new Date().getTime() - start) > milliseconds){
			      break;
			    }
			  }
			} 
		
		function displaytransaction(id, countid, orderbodyid)
		{
			if(document.getElementById(id).style.display == 'block'){
				document.getElementById(id).style.display = 'none';
				
				return 
			}
			
			for (var i = 0; i < countid; i++) {
				if(document.getElementById(i) != null)
					{
					 document.getElementById(i).style.display = 'none';
					 
					}
				   
			} 
			document.getElementById(id).style.display = "block";
			
		}
		
		

		function sendverificationmail(){
			var email=document.getElementById("mail").value;
			document.getElementById("someHiddenDiv").style.display="block";
			document.getElementById("someHiddenDiv").innerHTML="Please wait ...";
			var ajax=new XMLHttpRequest();
			ajax.open("GET","sendverificationmail?email="+email, true);
			ajax.send();
			ajax.onreadystatechange=function(){
				var res=ajax.responseText;
				if(ajax.readyState==4 && ajax.status==200){
					document.getElementById("someHiddenDiv").innerHTML="Email for account verification has been sent!";
					
				}
			}
		}
		
		function checkOrderStatus(){
			var orderId=document.getElementById("orderId").value;
			if(isNaN(orderId)){
				document.getElementById("orderdisplay").innerHTML="Invalid Order Id";
				return;
			}
			var ajax=new XMLHttpRequest();
			ajax.open("GET","trackorder?orderid="+orderId, true);
			ajax.send();
			ajax.onreadystatechange=function(){
				var res=ajax.responseText;
				if(ajax.readyState==4 && ajax.status==200){
					console.log(res);
					if(res=="" || res==null){
						
						document.getElementById("orderdisplay").innerHTML="Invalid Order Id";
						return;
					}
					var json = JSON.parse(res);
//					console.log(json[0].status+"  sas");
					var html ="<div class='divTable'>"+
					"<div class='divTableHeading'>"+
						"<div class='divTableRow'>"+
							"<div class='divTableHead2'>Date and Time</div>"+
							"<div class='divTableHead2'>Status</div>"+
						"</div>"+
					"</div>";
					html+="<div class='divTableBody'>";
					for(var idx=0;idx<json.length;idx++){
						html+="<div class='divTableRow'>"+
								"<div class='divTableCell2'>"+(new Date(json[idx].createdDate)).toUTCString()+"</div>"+
								"<div class='divTableCell2'>"+json[idx].status+"</div>"+						
							"</div>";
					}
					html+="</div>";
					html+="</div>";
					document.getElementById("orderdisplay").innerHTML=html;
				}
			}
		}
		
		/******************************************************************/
		/******************************************************************/
		/******************************************************************/

		function changePassCheck(pid, cid, errorpid, errorcid)
		{
			var pwd=document.getElementById(pid).value;
			var rpwd=document.getElementById(cid).value;
			document.getElementById(errorcid).innerHTML="";
			document.getElementById(errorpid).innerHTML="";
			document.getElementById(errorcid).style.display="none";
			document.getElementById(errorpid).style.display="none";
			var regex=/^(?=.*\d)[a-zA-Z\d_@./#&+-]{8,13}$/; 
			if(pwd.length<8 || pwd.length>13 || regex.test(pwd)==false)
			{
				document.getElementById(errorpid).style.display="block";
				document.getElementById(errorpid).innerHTML='<span><i class="icon-exclamation-sign"></i></span> Password should be between 8 and 13 characters and at least one number should be included.';
				document.getElementById("submitbtn").disabled=true;
			}
			if(pwd==rpwd)
			{
			}
			else
			{
				document.getElementById(errorcid).style.display="block";
			    document.getElementById(errorcid).innerHTML='<span><i class="icon-exclamation-sign"></i></span> Passwords don\'t match';
				document.getElementById("submitbtn").disabled=true;
			}
			if(	document.getElementById(errorpid).innerHTML=="" &&
					document.getElementById(errorcid).innerHTML=="" &&
					document.getElementById("erroroldpassword").innerHTML=="")
			{
				document.getElementById(errorcid).style.display="none";
				document.getElementById(errorpid).style.display="none";
				document.getElementById("erroroldpassword").style.display="none";
				document.getElementById("submitbtn").disabled=false;
			} 
			else
			{
				document.getElementById("submitbtn").disabled=true;
			}
		}	
		/******************************************************************/
		/******************************************************************/
		/******************************************************************/

		//Function to verify user password in form	
		function validUserPassword()
		{
			var uname=document.getElementById("uname").value;
			var pass=document.getElementById("opwd").value;
			document.getElementById("erroroldpassword").style.display="none";
			document.getElementById("erroroldpassword").innerHTML="";
			document.getElementById("submitbtn").disabled=false;
			var ajax = new XMLHttpRequest();
			ajax.open("GET", "checkuserpassword?uname=" +uname+"&pass="+pass , true);
			ajax.send();
			ajax.onreadystatechange = function() {
			var res = ajax.responseText;
			if (ajax.readyState == 4 && ajax.status == 200) 
			{
				if(res.length>0)
				{
					if(res=="invalid")
					{
						document.getElementById("erroroldpassword").style.display="block";
						document.getElementById("erroroldpassword").innerHTML='<span><i class="icon-exclamation-sign"></i></span>Password Incorrect.';
						document.getElementById("submitbtn").disabled=true;
					}					
				}
			}
			}
			if(	document.getElementById("errorpassword").innerHTML=="" &&
					document.getElementById("passwarn").innerHTML=="" &&
					document.getElementById("erroroldpassword").innerHTML=="")
			{
				document.getElementById("errorpassword").style.display="none";
				document.getElementById("passwarn").style.display="none";
				document.getElementById("erroroldpassword").style.display="none";
				document.getElementById("submitbtn").disabled=false;
			} 
			else
			{
				document.getElementById("submitbtn").disabled=true;
			}

		}
		/******************************************************************/
		/***************************Retain Ratings*************************/
		/******************************************************************/
		function retainRating(value){
			document.getElementById("star5").removeAttribute("checked")
			switch(value){
			 case 0.5:
				 document.getElementById("starhalf").setAttribute("checked", "checked");
				 break;
			 case 1.0:
				 document.getElementById("star1").setAttribute("checked", "checked");
				 break;
			 case 1.5:
				 document.getElementById("star1half").setAttribute("checked", "checked");
				 break;
			 case 2.0:
				 document.getElementById("star2").setAttribute("checked", "checked");
				 break;
			 case 2.5:
				 document.getElementById("star2half").setAttribute("checked", "checked");
				 break;
			 case 3.0:
				 document.getElementById("star3").setAttribute("checked", "checked");
				 break;
			 case 3.5:
				 document.getElementById("star3half").setAttribute("checked", "checked");
				 break;
			 case 4.0:
				 document.getElementById("star4").setAttribute("checked", "checked");
				 break;
			 case 4.5:
				 document.getElementById("star4half").setAttribute("checked", "checked");
				 break;
			 default:
				 document.getElementById("star5").setAttribute("checked", "checked");
				
		     
		    	 
			}
			
			
		}
