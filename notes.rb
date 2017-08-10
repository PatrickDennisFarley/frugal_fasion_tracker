# ALL OF THIS TAKES PLACE INSIDE THE TASK BLOCK IN THE RAKE FILE
# api call w/ ruby
#
# api call results >> new_custom_post_array
#
# new_custom_post_array.each do |post|
#   if post.created_at > last_send_task_datetime
#     ~send twilio message~
#     return
#   end
# end



require 'twilio-ruby'


# desc "Sends a notification to users when they have a new custom post."
# task :send_notifications do
#
# end

TWILIO_ACCOUNT_SID=ENV["TWILIO_ACCOUNT_SID"]
TWILIO_AUTH_TOKEN=ENV["TWILIO_AUTH_TOKEN"]

  @client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
  @client.messages.create({
    :from => "+12408984715",
    :to => "+12022105352",
    body: "Hi Patrick! There are new deals for your keywords! Check them out on https://frugal-fashion-tracker.herokuapp.com/custom_posts"
    })