class ApplicationController < ActionController::Base
  before_filter :touch
  protect_from_forgery
  include SessionsHelper

  private

  def touch
    if signed_in?
      current_user.touch
    end
  end
end
