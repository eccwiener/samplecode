$(function(){

	//forms to validate
	var form = {
		registration: {
			newBus: '.newBusForm'
		}
	};

	$(form.registration.newBus).parsley();
});