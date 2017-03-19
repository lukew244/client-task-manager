$(document).ready(function() {
    var text_max = 500;
    $('#textarea_feedback').html(text_max + ' characters remaining');

    $('#description-textarea').keyup(function() {
        var text_length = $('#description-textarea').val().length;
        var text_remaining = text_max - text_length;

        $('#textarea_feedback').html(text_remaining + ' characters remaining');
    });
});
