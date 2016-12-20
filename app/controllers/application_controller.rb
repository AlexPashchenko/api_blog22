require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :json
  protect_from_forgery with: :null_session
  include ActionController::MimeResponds
  include CanCan::ControllerAdditions
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def authorized!
    unless Devise.exists?(params[:token]).try(:user)
      render json: { errors: "Not authenticated" }, status: :unauthorized
    end
  end

  #how to set current_user????

end



