jQuery(function($) {
  $('#editor').wysiwym(Wysiwym.Markdown, {});

  // For the Live Preview we want to check the value of
  // textarea changes as some set interval.  If it's
  // changed, we'll call Showdown to convert the textarea
  // input to HTML then prettify to colorize code blocks.
  var showdown = new Showdown.converter();
  var prev_text = "";
  var update_live_preview = function() {
      var input_text = $('#editor').val();
      if (input_text != prev_text) {
          var text = $("<div>"+ showdown.makeHtml(input_text) +"</div>");
          text.find('pre').addClass('prettyprint');
          text.find('p code').addClass('prettyprint');
          text.find('code').each(function() {
              $(this).html(prettyPrintOne($(this).html()));
          });
          $('#preview').html(text);
          prev_text = input_text;
      }
  };
  setInterval(update_live_preview, 200);
});

