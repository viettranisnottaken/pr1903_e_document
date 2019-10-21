# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper

  before_action :check_if_logged_in

  private

  def check_if_logged_in
    unless logged_in?
      redirect_to root_path
      flash[:danger] = "You need to log in first"
    end
  end
end
