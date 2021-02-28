# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include SessionsHelper
  add_flash_types :success, :warning, :danger, :info
end
