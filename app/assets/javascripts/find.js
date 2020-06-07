document.addEventListener("turbolinks:load", function(){
	$input = $("[data-behavior= 'autocomplete']")

	var options = {


		getValue: function (element) {
				if (element.firstname == ""){
		    	return element.title  
				}
		    else
		    {    	
		    	return element.firstname + " " + element.middlename + " " + element.surname 	   		
		    }
		},

		url: function(phrase) {
			return "find.json?q=" + phrase;
		},


    template: {
        type: "description",
        fields: {
            description: "name"
        }
    },
		categories: [
			{
				listLocation: "users",
				header: "<h4>People</h4>",			
			},
			{
				listLocation: "articles" ,
				header: "<h4>ASPAP - Articles</h4>",
			},

		],
		list: {
			onChooseEvent: function() {
				var url = $input.getSelectedItemData().url
				Turbolinks.visit(url)
			}
		},
		theme: "round"
	}

	$input.easyAutocomplete(options)
});
