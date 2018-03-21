App.chatChannel = App.cable.subscriptions.create { channel: "ChatChannel", room: "Best_Room" },
	received: (data) ->
	    @appendLine(data)
	 
	  appendLine: (data) ->
      if (data.type_of_message == "chat_person") 
	      html = @createLine(data)
	      $("#room").append(html)
	      $('#chat-message-counter').text(parseInt($('#chat-message-counter').text()) + 1)
	      $('.chat-feedback').hide()
	      $('#room').animate({scrollTop: $('#room').prop("scrollHeight")}, 500)
      else if (data.type_of_message == "bot") 
	      html = @createLine(data)
	      $("#room").append(html)
	      $('#chat-message-counter').text(parseInt($('#chat-message-counter').text()) + 1)
	      $('.chat-feedback').hide()
	      $('#room').animate({scrollTop: $('#room').prop("scrollHeight")}, 500)
      else if (data.type_of_message == "search") 
	      html = @createCard(data)
	      $("#room").append(html)
	      $('#chat-message-counter').text(parseInt($('#chat-message-counter').text()) + 1)
	      $('.chat-feedback').hide()
	      $('#room').animate({scrollTop: $('#room').prop("scrollHeight")}, 500)      
      
			

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
	  createCard: (data) ->
	  	div_data = """
	  		<h4>Here are results for #{data['query']}</h4><div class="chat-message clearfix" style="width:700px;overflow-x:scroll;overflow:hidden;">
	  	"""
	  	for data in data.products
		   	div_data += """
						<div class="card" style="width:100px;float:left;margin-right:10px;padding: 10px; border: 1px solid grey;">
	            <a href="#{data['link']}"><img src="#{data['image']}" alt="Avatar" style="width:100%;max-height:100px;max-width:100px;"></a>
	            <div class="container">
	            <h4><b>#{data["body"]}</b></h4> 
	             
	            </div>
	          </div>
					
		    """
		  div_data += "</div>"
	$(document).ready ->
  	$('form#message_form').submit (event) -> #HERE
    	App.chatChannel.send({ sent_by: $('#name').val(), body: $('#msg_text').val(), type_of_message: "chat_person" })
    	event.preventDefault()
    	$('#chat-message-counter').text('0')
    	$('.chat-feedback').show()
    	$('#msg_text').val('')

    	
    	

    	
