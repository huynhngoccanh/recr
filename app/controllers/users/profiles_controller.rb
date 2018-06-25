module Users
  class ProfilesController < ApplicationController
    include UserScoped
    before_action :set_profile, except: [:new, :create]
    before_action :authorize!, only: [:edit, :update]

    def show

    end

    def new
      redirect_to edit_user_profiles_path(@user) if @user.profile
      @profile = @user.build_profile
    end

    def edit
    end

    def create
      @profile = current_user.build_profile profile_params

      if @profile.save
        redirect_to user_profiles_path(@user), notice: "Profile Updated!"
      else
        render :new, alert: "There were some errors with your submission."
      end
    end

    def update
      if @profile.update profile_params
        redirect_to user_profiles_path(@user), notice: "Profile Updated!"
      else
        render :edit, alert: "There were some errors with your submission."
      end
    end

    private
      def set_profile
        @profile = @user.profile
      end

      def profile_params
        params.require(:profile).permit(:user_id, :name, :primary_position, :jersey_number)
      end

      def authorize!
        unless current_user == @user
          redirect_to root_path, notice: "Tsk tsk! Not allowed to edit that profile."
        end
      end
  end
end
