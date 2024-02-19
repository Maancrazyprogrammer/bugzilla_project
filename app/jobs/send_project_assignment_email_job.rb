class SendProjectAssignmentEmailJob < ApplicationJob
  queue_as :default

  def perform(user, project)
    ProjectAssignmentMailer.project_assigned_email(user, project).deliver_now
  end
end
