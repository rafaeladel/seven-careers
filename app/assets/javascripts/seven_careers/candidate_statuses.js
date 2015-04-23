// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$('document').on('click', '.candidate_status_id', function() {
    var candidate_id = $(this).data('candidate');
    var url = $(this).data('url');
    $.ajax({
        url: ''
    })
    ;
});