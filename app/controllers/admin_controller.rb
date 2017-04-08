class AdminController < ApplicationController
  before_action :basic_auth
  def index
  end
  private
  def basic_auth
    authenticate_or_request_with_http_basic do |user,pass|
      user == ENV["POTATO_BASIC_NAME"] && pass == ENV["POTATO_BASIC_PASSWORD"]
    end
  end
end
