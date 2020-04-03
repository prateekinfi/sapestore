/*package com.sapient.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sapient.entity.City;
import com.sapient.entity.State;
import com.sapient.service.IUserService;

@RestController
public class AddressController {
	
	@Autowired
	private IUserService userService;

	
	@RequestMapping("getStates")
	public List<State> getStates(@RequestParam("countryId")Long countryId){
		
		return userService.getListOfStates(countryId);
	}
	
	@RequestMapping("getCities")
	public List<City> getCities(@RequestParam("stateId")Long stateId){
		
		return userService.getListOfCities(stateId);
	}
	
}
<form:options items="${countries}" itemValue="countryId" itemLabel="countryName" />
function changeCountry(){
	
	 var countryId=document.getElementById("country").value;
	var ajax=new XMLHttpRequest();
	ajax.open("GET", "getStates?countryId="+countryId, true);
	ajax.send();
	ajax.onreadystatechange = function() {
		var res = ajax.responseText;
		if (ajax.readyState == 4 && ajax.status == 200) {
			var json=JSON.parse(res);
			for(var idx=0; idx<json.length;idx++){
				
			}
		}
	} 
	 document.getElementById("state").InnerHTML+="<form:option value='sagar'/>" 
	
}*/