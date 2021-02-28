# frozen_string_literal: true

class ActivitiesController < ApplicationController
  before_action :require_login

  def index
    @activity = Activity.find(params[:id])
  end
end
