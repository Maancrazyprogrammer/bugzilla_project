class BugAssignmentMailer < ApplicationMailer
  default from: 'muhammadnoumankhokhar52@gmail.com'
  def bug_assigned_email(user, bug)
    @user = user
    @bug = bug
    mail(to: @user.email, subject: 'New Project Assignment')
  end

end
