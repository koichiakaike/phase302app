class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create              #新規登録アクション（POST）
    @user = User.new(user_params) #モデルの作成(newアクションに引き渡す)

    if @user.save         #モデルの登録
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
      session[:user_id] = params[:id]
      redirect_to user_path(@user.id)
      #redirect_to blogs_path, notice: "ユーザーを作成しました！"
    else
      # 入力フォームを再描画します。
      render 'new'        #新規登録画面を表示（パラメータを引き継ぐ）
    end
  end

  def show
    @user = User.find(params[:id])
    session[:user_id] = params[:id]
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
