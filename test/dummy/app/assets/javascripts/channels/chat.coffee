App.chatChannel = App.cable.subscriptions.create { channel: "ChatChannel", room: "Best_Room" },
	received: (data) ->
	    @appendLine(data)
	 
	  appendLine: (data) ->
	    html = @createLine(data)
	    $("#room").append(html)
	    $('#chat-message-counter').text(parseInt($('#chat-message-counter').text()) + 1)
	    $('.chat-feedback').hide()
	   	$('#room').animate({scrollTop: $('#room').prop("scrollHeight")}, 500);
			

	  createLine: (data) ->
	    """
	    <div class="chat-message clearfix">
					<img src="http://gravatar.com/avatar/2c0ad52fc5943b78d6abe069cc08f320?s=32" alt="" width="32" height="32">
					<div class="chat-message-content clearfix">
						<span class="chat-time">#{data["time"]}</span>
						<h5>#{data["sent_by"]}</h5>
						<p>#{data["body"]}</p>
					</div> <!-- end chat-message-content -->
				</div> <!-- end chat-message -->
				<hr>
	    """
	$(document).ready ->
  	$('form#message_form').submit (event) -> #HERE
    	App.chatChannel.send({ sent_by: $('#name').val(), body: $('#msg_text').val() })
    	event.preventDefault()
    	$('#chat-message-counter').text('0')
    	$('.chat-feedback').show()
    	$('#msg_text').val('')

    	
    	

    	
