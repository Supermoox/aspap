class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def new
    #@search = Search.new
  end

  def create
    recipients = User.where(id: conversation_params[:recipients])
    recipients.each do |recipient|
      if recipient != current_user
        @recipient = recipient
      end
    end
    conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
    flash[:success] = "Your message was successfully sent!"
    #redirect_to conversation_path(conversation)
     redirect_to root_path
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    conversation.mark_as_read(current_user)
  end

  def reply
    current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply message was successfully sent!"
   # redirect_to conversation_path(conversation)
   # redirect_to mailbox_inbox_url
    redirect_to root_path
  end

  private

  def message_params
    params.require(:message).permit(:body, :subject)
  end
  
  def conversation_params
    params.require(:conversation).permit(:subject, :body,recipients:[])
  end

end
