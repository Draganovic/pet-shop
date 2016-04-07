class UsersController<ApplicationController

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path(@user)
    else
      render :new
    end
  end

private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
