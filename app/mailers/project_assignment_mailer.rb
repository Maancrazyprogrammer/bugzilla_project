class ProjectAssignmentMailer < ApplicationMailer
  default from: 'muhammadnoumankhokhar52@gmail.com'
  def project_assigned_email(user, project)
    @user = user
    @project = project
    mail(to: @user.email, subject: 'New Project Assignment')
  end
end
