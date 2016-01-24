class Converter::LinksController < Converter::BaseController

  def new
    set_cookies
  end


  def show
    if without_cookies?
      redirect_to new_converter_link_path and return
    end

    @task = Task.find_by(remember_token: get_cookies)

    unless @task
      @report = Report.first
      @task = Task.find (@report.current_id )
      @task.update_attribute(:remember_token, get_cookies)
      @task.used
      @report.update_attribute :current_id, (@report.current_id + 1)
    end
  end

  private

  def set_cookies
    cookies.permanent[:remember_token_link] ||= create_remember_token
  end

  def get_cookies
    cookies.permanent[:remember_token_link]
  end

  def without_cookies?
    cookies.permanent[:remember_token_link].nil?
  end


  def new_remember_token
    SecureRandom.urlsafe_base64
  end

  def token_encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def create_remember_token
    token_encrypt new_remember_token
  end
end
