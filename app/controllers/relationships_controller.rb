# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def index; end

  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user
    @relationship = Relationship.find_by(follower_id: current_user.id, followed_id: user.id)
    @relationship.create_activity(user_id: current_user.id)
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    @relationship = Relationship.find_by(follower_id: current_user.id, followed_id: user.id)
    @relationship.destroy
    current_user.unfollow(user)
    redirect_to user
  end
end
