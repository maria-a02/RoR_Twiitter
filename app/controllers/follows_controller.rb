class FollowsController < ApplicationController
    def to_follow
        @following = User.find(params[:id])
        new_follow = Follow.create!(following: current_user, follower: @following)
        redirect_to root_path
    end
end
