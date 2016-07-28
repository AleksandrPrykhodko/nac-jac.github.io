class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :redirect_if_other_domain_name

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end


  protected

  def redirect_if_other_domain_name
    if request.host != 'nacjac.com'
      redirect_to "#{request.protocol}nacjac.com#{request.fullpath}", :status => :moved_permanently
    end
  end
end
