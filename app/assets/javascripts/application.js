// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require jquery.easy-autocomplete
//= require bootstrap-sprockets
//= require lightbox
//= require_tree .

$(document).ready(function(){
    $("#formButton").click(function(){
        $("#delete_acc").toggle();
    });
});




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
