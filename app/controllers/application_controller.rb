class ApplicationController < ActionController::API
  def not_found
    { status: 404, error: 'Page not found' }
  end
end
