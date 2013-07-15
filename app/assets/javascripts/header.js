function ready(){
	console.log("HI I'M HERE!!!");
	$('#approval_link').popover({placement: 'bottom', html: true, content: $("#approval_popover").html()});
}


$(document).on('page:load', ready);
$(document).ready(ready);