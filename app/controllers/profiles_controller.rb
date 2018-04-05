class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_rol

  def show
    @profile = current_user.profile
  end
  def edit
    @profile = current_user.profile
  end
  def update
    @profile = current_user.profile
    if @profile.update(profile_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  def new
    @profile = Profile.new
  end
  def create
    @profile = Profile.new(profile_params)
    if @profile.save
      redirect_to @profile
      #redirect_to profile_path(@profile.id)
    else
      render :new
    end
  end

  private
    def check_rol

    end
    def profile_params
      params.require(:profile).permit(:name, :last_name, :rol, :salary).merge(user: current_user)
    end
end
