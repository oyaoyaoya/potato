class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @user = User.find_for_google_oauth2(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in(@user)
      if @user.completed == false
        flash[:notice] = "認証に成功しました。プロフィールを入力してください。"
        redirect_to edit_user_path(@user)
      else
        flash[:notice] = "認証に成功しました。"
        sign_in_and_redirect @user, event: :authentication
      end
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      flash[:alert] = "認証に失敗しました。お手数ですがリロードし直して再度お試しください。"
      redirect_to session[:previous_url]
    end
  end
end
