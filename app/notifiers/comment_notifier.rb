# To deliver this notification:
#
# CommentNotifier.with(record: @post, message: "New post").deliver(User.all)

class CommentNotifier < ApplicationNotifier
  # Add your delivery methods
  #
  deliver_by :email do |config|
    config.mailer = "UserMailer"
    config.method = "new_comment"
    config.params = ->(recipient) { { user: recipient } }
  end
  
 

  notification_methods do
    def message
      case params[:type]
      when "message"
        "You have a new message from #{params[:author]} in your chatroom."
      when "comment"
        "You have a new comment from #{params[:author]} on your post."
      when "like"
        "#{params[:author]} liked your post."
      else
        "This is #{recipient.username}'s foo: #{params[:foo]}"
      end
      
    end
  end
  #
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end

  # Add required params
  #
  # required_param :message
end
