class SendBugAssignmentEmailJob < ApplicationJob
  queue_as :default

  def perform(user, bug)
  user=User.find(user)
  bug=Bug.find(bug)
   BugAssignmentMailer.bug_assigned_email(user, bug).deliver_now
  end
end
