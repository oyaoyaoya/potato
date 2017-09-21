class HomeController < ApplicationController
  before_action :complete_user?, only: :index
  def index
  end

  def search
  end

  def help
  end

  def show
  end

  private

  def complete_user?
    if user_signed_in? && current_user.completed == false
      redirect_to edit_user_path(current_user)
    end
  end
end
