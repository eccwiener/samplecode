organization_module = (function($){


    var organize = {}


    jQuery(".organization-type").bind("click", function(){

       organize.type = jQuery(this).data();

       jQuery("[data-content='"+organize.type.manage+"']").find("#add-"+organize.type.manage).slideToggle();


        // Custom jQuery Validtor Rules

        jQuery.validator.addMethod("zipCode", function (value, element) {
            return this.optional(element) || /^\d{5}(?:-\d{4})?$/.test(value);
        }, "Please provide a valid zipcode.");

        // accepted type number or letters
        jQuery.validator.addMethod("accept", function(value, element, param) {
            return value.match(new RegExp("^" + param + "$"));
        }, "Must contain letters only");

        // accepted type number or letters
        jQuery.validator.addMethod("accept", function(value, element, param) {
            return value.match(new RegExp("^" + param + "$"));
        }, "Must contain letters only");


        jQuery("#add-"+organize.type.manage).validate({
            rules: {
                first_name:{
                    minlength: 2,
                    accept: "[a-zA-Z ]+"
                },
                last_name:{
                    minlength: 2,
                    accept: "[a-zA-Z ]+"
                },
                dept_name:{
                    minlength: 2,
                    accept: "[a-zA-Z ]+"
                },
                email:{
                    email: true
                },
                street:{
                    required: true
                },
                city:{
                    minlength: 2,
                    accept: "[a-zA-Z ]+"
                },
                zip_code:{
                    zipCode: true
                },
                state:{
                    minlength: 2,
                    accept: "[a-zA-Z ]+"
                }
            }
        });


    });




})(jQuery);
