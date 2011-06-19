// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function() {
  $( ".calendarLayout" ).datepicker();
  $("#project_user_ids").multiselect({
    noneSelectedText: 'Wähle Benutzer',
    selectedList: 4
  })
});

// var natDays = ["4/22/2009","4/23/2009","4/24/2009","4/25/2009","4/26/2009","5/27/2009","5/28/2009","6/26/2009","6/27/2009","6/28/2009","6/29/2009","6/30/2009"];
//   function nationalDays(date) {
//     var sDate = (date.getMonth()+1).toString() + "/" + date.getDate().toString() + "/" + date.getFullYear().toString();
//     if ($.inArray(sDate, natDays) != -1) return [false,"","Not this day!"];
//     else return [true, ""];
//   }