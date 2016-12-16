require "application_responder"

class ApplicationController < ActionController::API
  self.responder = ApplicationResponder
  respond_to :json
  include ActionController::MimeResponds
  include CanCan::ControllerAdditions

  def authenticate_user!

  end
  def current_user
    @user ||= User.find(params[:id])
  end
  def authenticate!
    if current_user.blank?
      render json: {error: 'Unauthorized user!'}
    end
    end


  end

