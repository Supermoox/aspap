class MailboxController < ApplicationController
  before_action :authenticate_user!

  def inbox
    @inbox = mailbox.inbox
    @active = :inbox
   # @search = Search.new

  end

  def sent
    @sent = mailbox.sentbox
    @active = :sent
   # @search = Search.new
  end

  def trash
    @trash = mailbox.trash
    @active = :trash
  end

end
