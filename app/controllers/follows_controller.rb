class FollowsController < ApplicationController
    def to_follow
        @following = User.find(params[:id])
        new_follow 0 Follow.create!(follower: current_user, following: @following)
        redirect_to root_path
end
