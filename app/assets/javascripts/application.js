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
  $("table.posts tr").hover(function() {
    $(this).children("td.delete").children("a.delete").fadeToggle('fast');
  });
  $("ul.comments li").hover(function() {
    $(this).children("a.delete").fadeToggle('fast');
  });
});

$(function() {
  if ($("#posts").length > 0) {
    setTimeout(updateNewsFeed, 10000);
  }
})

function updateNewsFeed() {
  // We use setTimeout instead of setInterval in case the request takes time
  // process and we end up polling more frequently than we can handle them
  var user_id = $("#posts").attr("data-id");
  var after = $(".post:first").attr("data-time");
  $.getScript("/users/" + user_id + "/posts.js?user_id=" + user_id + "&after=" + after)
  setTimeout(updateNewsFeed, 10000);
}
