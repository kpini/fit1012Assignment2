// Product Search
function checkProductForm(myForm) {
  var showError = [false, false, false] // assume it is vaild - only check for blanks
  var invalidNum = false // only check for invalid characters
  var fields = ["q", "priceMin", "priceMax"]; // list of required fields
  
  // delete previous errors (if any)
  if (document.getElementById("errorMsg") != null) {
    var getError = document.getElementById("errorMsg");
    myForm.removeChild(getError);
  }
  
  for (i in fields) {
    fieldName = fields[i];
    
    // check if it is blank
    if (!myForm[fieldName].value) {
      showError[i] = true;
    }
    
    // check numbers are numbers
    if ((i == 1 || i == 2) && isNaN(myForm[fieldName].value)) {
      invalidNum = true;
    }
  }
  
  // if error has not already been shown (otherwise ignore)
  if (showError[0] == true && showError[1] == true && showError[2] == true) {
    // create error div
    var addMessageLocator = myForm.getElementsByTagName("p")[0];
    var errorMsg = document.createElement("p");
    var errorTxt = document.createTextNode("Please fill in a field in order to search.");
    errorMsg.id = "errorMsg";
    errorMsg.appendChild(errorTxt);
    
    // insert it before intro paragraph
    myForm.insertBefore(errorMsg, addMessageLocator);
    
    return false;
  }
  else if (invalidNum == true) {
    // create error div
    var addMessageLocator = myForm.getElementsByTagName("p")[0];
    var errorMsg = document.createElement("p");
    var errorTxt = document.createTextNode("Numbers are incorrect.");
    errorMsg.id = "errorMsg";
    errorMsg.appendChild(errorTxt);
    
    // insert it before intro paragraph
    myForm.insertBefore(errorMsg, addMessageLocator);
    
    return false;
  }
  else {
    // disable unrequired fields
    if(showError[0] == true) {
      myForm[fields[0]].disabled = true;
    }
    
    if(showError[1] == true) {
      myForm[fields[1]].disabled = true;
    }
    
    if(showError[2] == true) {
      myForm[fields[2]].disabled = true;
    }
    
    // finally submit form
    myForm.submit();
  }
}

function validateContactForm(myForm) {
  var showError = false; // assume it is valid
  var requiredFields = ["contactName", "contactEmail", "contactPhone", "contactSubject", "contactMessage"]; // list of required fields
  
  // delete previous errors (if any)
  if (document.getElementById("errorMsg") != null) {
    var getError = document.getElementById("errorMsg");
    myForm.removeChild(getError);
  }
  if (document.getElementById("requiredAlert") != null) {
    var getError = document.getElementById("requiredAlert");
    myForm.removeChild(getError);
  }
  
  for (i in requiredFields) {
    fieldName = requiredFields[i];  
    // check if it is blank
    if (myForm[fieldName].value == "" || !myForm[fieldName].value) {
      showError = true;
			myForm[fieldName].className = "validateError";
    }
  }
  
  if (showError == true) {
    // create error div
    var addMessageLocator = myForm.getElementsByTagName("p")[0];
    var errorMsg = document.createElement("p");
    var errorTxt = document.createTextNode("Please fill in all fields before submitting the form.")
    errorMsg.id = "errorMsg";
    errorMsg.appendChild(errorTxt);
    
    // insert it before intro paragraph
    myForm.insertBefore(errorMsg, addMessageLocator);
    
    return false;
  } else {
    myForm.submit();
  }
}

function resetForm(myForm) {
	var requiredFields = ["contactName", "contactEmail", "contactPhone", "contactSubject", "contactMessage"];
	for (i in requiredFields) {
    fieldName = requiredFields[i];  
		myForm[fieldName].className = "";
		myForm[fieldName].value = "";
  }
}