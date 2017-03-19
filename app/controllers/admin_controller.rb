class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorise_admin


  def tasks_index
    @tasks = Task.all
  end

private

  def authorise_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'This action can only be performed by an admin user'
  end
end
