class AuditMessagesController < ApplicationController

  def index
    user_id = request.headers['HTTP_USER_ID']
    user = User.find(user_id)
    @audit_messages = AuditMessage.where(org_id: user.org.id)
    render json: @audit_messages
  end

end
