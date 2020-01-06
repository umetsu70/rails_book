class ApplicationController < ActionController::Base
    #CSRF保護が有効になっているため、CSRF保護を無効にする
    protect_from_forgery with: :null_session
    
    skip_before_action :verify_authenticity_token
end
