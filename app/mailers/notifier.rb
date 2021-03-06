class Notifier < ActionMailer::Base
  include SendGrid
  default from: "chores@choreroom.com"

  # sendgrid_category :use_subject_lines
  # sendgrid_enable   :ganalytics, :opentrack
  # sendgrid_unique_args :key1 => "value1", :key2 => "value2"

  def chore_notification_email(chore)
    @user = chore.user
    @chore = chore
    sendgrid_category "Chore Notification"
    # sendgrid_unique_args :key2 => "newvalue2", :key3 => "value3"
    mail :to => @user.email, :subject => "#{@user.name}. You've got a chore!"
  end

end
