class GoalMailer < ActionMailer::Base
  default from: "team@hilltop.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.goal_mailer.progress_report.subject
  #
  def progress_report(user)
    @greeting = "Hi"
    @user = user
    mail :to => user.email, :subject => "Keep going! Hilltop progress report."
  end
end
