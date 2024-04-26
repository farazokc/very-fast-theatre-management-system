$(document).ready(function() {
	  $('select').change(function() {
	    if ($(this).val() == 'all') {    
	      targList = document.getElementsByClassName("targ");
	      if (targList) {
	        for (var x = 0; x < targList.length; x++) {
	          targList[x].disabled = false;
	        }
	      }      
	    } else {
	      targList = document.getElementsByClassName("targ");
	      if (targList) {
	        for (var x = 0; x < targList.length; x++) {
	        if(targList[x].value=="all"){
	            targList[x].disabled = true;
	        }
	        else{
	            targList[x].disabled = false;
	        }
	        }
	      }
	    }
	  });
	});
