/**
 * 
 */
var httpRequest = null;

function sendRequest(method, url, callback, param){
	 httpRequest = new XMLHttpRequest();
	var httpMethod = method ? method : "GET";
	
	if(httpMethod !="GET" && httpMethod !="POST"){
		httpMethod = "GET";
	}
	var httpUrl = url;
	var httpParam = (param == null || param == "") ? null : param;
	//param 이없으면 null값으로 하게 함
	if(httpMethod == "GET" && httpUrl != null){
		httpUrl = httpUrl + "?" + httpParam;
	}
	
	httpRequest.open(httpMethod, httpUrl, true);
	httpRequest.onreadystatechange = callback;
	httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded; charset=utf-8");
	httpRequest.send(httpMethod=="POST"?httpParam:null);	

}