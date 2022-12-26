class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_sign_up_parameters, if: :devise_controller?
  before_action :configure_permitted_sign_in_parameters, if: :devise_controller?

  # ログイン後の遷移先を決めるメソッド
  def after_sign_in_path_for(_resource)
    root_path
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']  # 環境変数を読み込む
    end
  end

  def configure_permitted_sign_up_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :uid])
  end

  def configure_permitted_sign_in_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :uid])
  end
end
