class SessionsController < ActionController::Base
  
  def new

  end

  def create
    @user = User.find_by(user_params)

    if @user.present? && @user.authenticate(user_params[:password_digest])
    # @user = current_user
      #cookies.permanent.signed[:account_id] = @account.id
      redirect_to 
    else
      render :signup
    end
  end

  def destroy
    cookies.delete(:account_id)
    redirect_to :signin
  end

  private

  def account_params
    params.require(:user).permit(:email, :password_digest)
  end

end