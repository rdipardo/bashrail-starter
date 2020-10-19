class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit

  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render text: exception, status: 500
  end

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to request.referrer, alert: exception.message }
    end
  end

  protect_from_forgery with: :null_session
end
