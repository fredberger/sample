class Admin::UsersController < AdminController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(object_params)
    if @user.save
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(object_params)
      redirect_to [:admin, @user]
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def object_params
    params.require(:user).permit(:name, :email, :password)
  end
end
