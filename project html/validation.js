// JavaScript Document
function validation()
{

var fn=document.getElementById("fname");
var ln=document.getElementById("lname");
var em=document.getElementById("email");
var atpos=em.value.indexOf("@");
var dotpos=em.value.lastIndexOf(".");
var pass=document.getElementById("password");
var cpass=document.getElementById("cpassword");

	
	
	if (/[^a-z]/gi.test(fn.value)) {
	alert ("Only characters are valid in First Name"); 
	fn.value = "";
	fn.focus();
	return false;
}
else if (fn.value==null || fn.value=="")
	{
    alert("First name must be filled out");
  	return false;
	}
else if (/[^a-z]/gi.test(ln.value))
 {
	alert ("Only characters are valid in Last Name");
	ln.value = "";
	ln.focus();
	return false;
 }
else if (ln.value==null || ln.value=="")
  {
  	alert("Last name must be filled out");
 	return false;
  } 
else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=em.value.length)
  {
 	 alert("Not a valid e-mail address");
	 em.value = "";
	 em.focus();
 	 return false;
  } 


else if (pass.value==null || pass.value=="")
  {
 	 alert("Password must be filled out");
	 pass.value = "";
 	 pass.focus();
 	 return false;
  }   
 
  
else if (cpass.value==null || cpass.value=="")
  {
	  alert("Confirm Password must be filled out");
  	  return false;
  } 
  
else if (pass.value!=cpass.value)  
	{
		alert("Password does not match!")
		cpass.value = "";
 	   	
 	    return false;
	}
else
{
	
	return true;
}
}

	