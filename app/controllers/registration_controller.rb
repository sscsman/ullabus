class RegistrationController < ApplicationController
  before_action :check
  def index
  end

  def show
  end

  def check
    if user_signed_in?
     redirect_to   mypage_index_path
    end

  end
end
