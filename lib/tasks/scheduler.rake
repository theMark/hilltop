desc "This task is called by the Heroku scheduler add-on"

task :send_progress_reports => :environment do
    @users = User.all
    @users.each do |user|
      GoalMailer.progress_report(user).deliver
    end
end