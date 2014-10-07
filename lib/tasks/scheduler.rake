desc "This task is called by the Heroku scheduler add-on"

task :send_progress_reports => :environment do
  # if Date.today.monday? || Date.today.wednesday? || Date.today.friday?  
    @users = User.all
    @users.each do |user|
      GoalMailer.progress_report(user).deliver
      puts "sent progress report or got to this line " + user.email.to_s
    end
  # end
end