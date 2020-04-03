<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/vendor/jquery-1.9.1.min.js"><\/script>')</script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>
<script src="js/cart.js"></script>
<script src="js/functionalities.js"></script>
<script src="js/vendor/modernizr-2.6.2.min.js"></script>
<script src="js/align.js"></script>
<script type="text/javascript">

function enterlogin()
{
	setTimeout(function(){$("#username").focus()}, 500); 
	var uname = document.getElementById("password");
	var pword = document.getElementById("username");
	uname.addEventListener("keyup", function(event) {
	    event.preventDefault();
	    if (event.keyCode === 13) {
	        document.getElementById("loginbutton").click();
	    }
	});	
	pword.addEventListener("keyup", function(event) {
	    event.preventDefault();
	    if (event.keyCode === 13) {
	        document.getElementById("loginbutton").click();
	    }
	});	
} 

function valthisform(list1,list2)
{
    var checkboxs=document.getElementsByName(list1);
    var checkbox1=document.getElementsByName(list2);
    for(var i=0,l=checkboxs.length;i<l;i++)
    {	
        if(checkboxs[i].checked)
        {	
        	checkbox1[i].disabled=false;
        }
        if(!checkboxs[i].checked)
        {	
        	checkbox1[i].checked=false;
        	checkbox1[i].disabled=true;
        }
    }
    
}

			$(document).ready(function(){
				$(".inline").colorbox({inline:true, width:"auto", height:"auto"});
				$(".callbacks").colorbox({
					onOpen:function(){ alert('onOpen: colorbox is about to open'); },
					onLoad:function(){ alert('onLoad: colorbox has started to load the targeted content'); },
					onComplete:function(){ alert('onComplete: colorbox has displayed the loaded content'); },
					onCleanup:function(){ alert('onCleanup: colorbox has begun the close process'); },
					onClosed:function(){ alert('onClosed: colorbox has completely closed'); }
				});
			});
	
function display(id) {
		if(document.getElementById(id).style.display == 'block'){
			document.getElementById(id).style.display = 'none';
			return 
		}
		for (var i = 0; i < 3; i++) {
			if(document.getElementById(i) != null)
			    document.getElementById(i).style.display = 'none';
		}
		document.getElementById(id).style.display = "block";
	} 
	
function checkAuthor(id, errorid){	
	var regex = /^[a-zA-Z ]*$/;
    var letters=document.getElementById(id).value;
    var textbox = document.getElementById(id);
    document.getElementById(errorid).innerHTML="";
    
    if(textbox.value.trim()=="")
		textbox.value = textbox.value.trim();
	textbox.value=textbox.value.replace(/ +/g," ");
	
    if(regex.test(letters) == false){
    	document.getElementById(errorid).innerHTML="Name must be in alphabets only";
		document.getElementById("submitbtn").disabled=true;
    }
    /* if(letters.length>50){
    	document.getElementById(errorid).innerHTML="make sure the input is between 1-50 characters long";
    } */
    if(regex.test(letters) == false && letters.length>50)
    	{
    	document.getElementById(errorid).innerHTML="Name must be in alphabets only and not greater than 50 charecters";
		document.getElementById("submitbtn").disabled=true;
    	}
    
    disableBtnAddEdit();
  }	

function checkRent(){
	var sPrice=(document.getElementById("sellPrice").value);
	var rPrice=document.getElementById("rentPrice").value;
	    //document.getElementById("submitbtn").disabled=false;
	document.getElementById("errorRPrice").innerHTML="";
	document.getElementById("errorSPrice").innerHTML="";

	checkNum('rentPrice','errorRPrice');
	checkNum('sellPrice','errorSPrice');
	if(rPrice>sPrice/10)
		{
		document.getElementById("errorRPrice").innerHTML="Rent Price cannot be greater than 10% of the Selling Price";
		document.getElementById("submitbtn").disabled=true;
		}
	disableBtnAddEdit();

	}

function checkLength(id,errorid){
	var textbox = document.getElementById(id);
	document.getElementById(errorid).innerHTML="";
	//document.getElementById("submitbtn").disabled=false;
	if(textbox.value.trim()=="")
		textbox.value = textbox.value.trim();
	textbox.value=textbox.value.replace(/ +/g," ");
	if(textbox.value.length>50){
		document.getElementById(errorid).innerHTML="make sure the input is between 1-50 characters long";
		document.getElementById("submitbtn").disabled=true;
	}
	/* checkNonEmpty(id,errorid); */
	disableBtnAddEdit();
	}
	
	

function checkISBN(id,errorid)
{
var regex = /^[0-9]*$/;
var letters=document.getElementById(id).value;
document.getElementById(errorid).innerHTML="";
//document.getElementById("submitbtn").disabled=false;

if(regex.test(letters) == false){
	var str1=letters.length-1;
	var res1=letters.slice(0,str1);
	document.getElementById(id).value = res1;
	document.getElementById(errorid).innerHTML="isbn must be a number";
	document.getElementById("submitbtn").disabled=true;
}

if(letters.length>13)
	{var res=letters.slice(0,13);
	 document.getElementById(id).value = res;
	document.getElementById(errorid).innerHTML="isbn cannot be greater than 13 digts";
	document.getElementById("submitbtn").disabled=false;
	}
disableBtnAddEdit();

}

function checkNum(id, errorid)
{
var val=parseInt(document.getElementById(id).value);
document.getElementById(errorid).innerHTML="";

	
    if(val<0)
    	{
    		document.getElementById(errorid).innerHTML="number has to be positive";
    		document.getElementById("submitbtn").disabled=true;
    	}  

    disableBtnAddEdit();

    
}

function disableBtnAddEdit()
{
	if(document.getElementById("errortitle").innerHTML=="" && document.getElementById("errorauthor").innerHTML==""&&
			document.getElementById("errorpublisher").innerHTML=="" && document.getElementById("errorisbn").innerHTML=="" && 
			document.getElementById("errorRPrice").innerHTML=="" && document.getElementById("errorSPrice").innerHTML=="" && 
			document.getElementById("errorlatefee").innerHTML=="" && document.getElementById("errorsell").innerHTML=="" && 
			document.getElementById("errorrent").innerHTML=="")
		document.getElementById("submitbtn").disabled=false;
}

function displaytabs(myid) {
    var id = document.getElementById(myid).id;
    document.getElementById('d1').style.background = "#f5f5f5";
    document.getElementById('r1').style.background = "#f5f5f5";
    document.getElementById('p1').style.background = "#f5f5f5";

    if (id == "p1") {
         setblock("purchasedrented");
        setnone("defaulterslist");
        setnone("revenuelist");
        document.getElementById('d1').style.background = "#e0e0e0";
        document.getElementById('r1').style.background = "#e0e0e0";

    } else if (id == "d1") {
         setblock("defaulterslist");
        setnone("revenuelist");
        setnone("purchasedrented");
        document.getElementById('r1').style.background = "#e0e0e0";
        document.getElementById('p1').style.background = "#e0e0e0";

    } else {
         setblock("revenuelist");
        setnone("purchasedrented");
        setnone("defaulterslist");
        document.getElementById('p1').style.background = "#e0e0e0";
        document.getElementById('d1').style.background = "#e0e0e0";

    }

}

function setblock(str) {
    document.getElementById(str).style.display = "block";
}
function setnone(str) {
    document.getElementById(str).style.display = "none";
}

function removespaces(id)
{
	var x = document.getElementById(id);
    x.value = x.value.trim();
    x.value=x.value.replace(/ +/g," ");
}

</script>