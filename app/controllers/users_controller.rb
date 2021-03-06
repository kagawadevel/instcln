class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in, only: [:show, :edit, :update, :destroy]
  before_action :require_current_user, only: [:show, :edit, :update, :destroy]
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    if params[:back]
     @user = User.new(user_params)
    else
     @user = User.new
    end
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html{ redirect_to @user, flash: {success: 'アカウント作成しました'}}
        format.json{render :show, status: :created, location: @user }
      else
        flash.now[:warning] = 'アカウント作成に失敗しました'
        format.html{ render :new }
        format.json{ render json:@user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'ユーザー情報を変更しました' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    session.delete(@user.id)
    @user.destroy
    respond_to do |format|
      format.html { redirect_to new_user_path, flash: { success: 'ユーザーを削除しました' } }
      format.json { head :no_content }
    end
  end

  def confirm
    @user = User.new(user_params)

    if @user.invalid?
      flash.now[:warning] = 'アカウント作成できませんでした'
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
    end

    def require_current_user
      redirect_to new_session_path, flash: { warning: 'ユーザーが違います' } unless logged_in? && (current_user.id == @user.id)
    end
end
