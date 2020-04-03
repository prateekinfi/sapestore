
function toDoTransaction(rentprice, sellprice, isbn){
	transactionChange(rentprice, sellprice, isbn);
	var ttype = document.getElementById("transactiontype"+isbn).value;
	console.log(ttype);
	var a=1;
	if(ttype=="Rent")
		a=0;
	updateSessionPurchase(isbn,a)
	console.log(ttype);
	doTotal();
	
}


function updateSessionPurchase(isbn,type){
	var ajax=new XMLHttpRequest();
	ajax.open("GET","updatesessionpurchase?isbn="+isbn+"&type="+type,true);
	ajax.send();
	ajax.onreadystatechange=function(){
		var res=ajax.responseText;
		if(ajax.readyState==4 && ajax.status==200){
			console.log("updated");
		}
	}
}



function toDoQuantity(rentprice, sellprice, isbn){
	quantityChange(rentprice, sellprice, isbn);
	var quantity = parseInt(document.getElementById("quantity"+isbn).value);
	console.log(quantity);
	updateSessionQuantity(isbn, quantity);
}



function updateSessionQuantity(isbn,quantity){
	var ajax=new XMLHttpRequest();
	ajax.open("GET","updatesessionquantity?isbn="+isbn+"&quantity="+quantity,true);
	ajax.send();
	ajax.onreadystatechange=function(){
		var res=ajax.responseText;
		if(ajax.readyState==4 && ajax.status==200){
			console.log("updated");
		}
	}
}


function doTotal() {
    var total = 0.0;
    var x=document.getElementsByName("finalprice");
    
	for (var i=0; i < x.length; i++) {
		total+=parseInt(x[i].innerHTML);
	}
	document.getElementById("total").innerHTML=total;
    
}






function transactionChange(rentprice, sellprice, isbn) {

    var price;
    var quan = document.getElementById("quantity"+isbn).value;
    var ttype = document.getElementById("transactiontype"+isbn).value;
    if(quan<=0 ){
    	quan=1;
    	document.getElementById("quantity"+isbn).value=quan;
    }

    price = ( ttype == "Rent" ) ? rentprice : sellprice;

    // alert(price);
    var finalprice = quan * price;

    document.getElementById("price"+isbn).innerHTML = ""+price.toString();
    document.getElementById("finalprice"+isbn).innerHTML = ""+finalprice.toString();

}

function quantityChange(rentprice, sellprice, isbn) {
    var price;
    
    var quan = parseInt(document.getElementById("quantity"+isbn).value);
    /*if(!quan.isInteger()){
    	document.getElementById("quantity"+isbn).value = 
    }*/
    if(Number.isNaN(quan)){
    	quan =1;
    }
    var e = document.getElementById("transactiontype"+isbn);
    var option = e.options[e.selectedIndex].value;
    var max;
    
    document.getElementById("quantity"+isbn).value=quan;
    
    if(quan<=0 ){
    	quan=1;
    	document.getElementById("quantity"+isbn).value=quan;
    }
    
    var ajax = new XMLHttpRequest();
    if(option=="Purchase"){
    	ajax.open("GET","getquantity?isbn="+isbn+"&flag=1",true);	
    }else{
    	ajax.open("GET","getquantity?isbn="+isbn+"&flag=0",true);
    }
    ajax.send();
    ajax.onreadystatechange=function(){
    	var res = ajax.responseText;
		if (ajax.readyState == 4 && ajax.status == 200) {
			max = parseInt(res);
		    if(quan > max){
		    	document.getElementById("quantitymessage"+isbn).innerHTML = "Sorry we have only "+max+" books in the stock";
		    	document.getElementById("quantity"+isbn).value = max;
		    	quan = max;
		    }else{
		    	document.getElementById("quantitymessage"+isbn).innerHTML = "";
		    }
		    
		    var ttype = document.getElementById("transactiontype"+isbn).value;
		    if (quan <= 0) {
		        quan = 1;
		        document.getElementById("quantity"+isbn).innerHTML = quan;
		    }
		    if (ttype == "Rent") { price = rentprice; }
		    else { price = sellprice; }
		    var finalprice = quan * price;
		    document.getElementById("price"+isbn).innerHTML = price;
		    document.getElementById("finalprice"+isbn).innerHTML =""+ finalprice;
		    
		    doTotal();
		}
    }
    
    
    
}


