class UsersController < ApplicationController
  before_action :authenticate_user!, only: %w( edit update destroy )
  before_action :set_user, only: %w( edit update show)
  before_action :check_user, only: %w( edit update)

  def show
    if @user == current_user
      render "my_show"
    else
      render "user_show"
    end
  end

  def edit
    @schools = School.all
    @faculties = Faculty.where.not(id: 1)
  end

  def update
    if @user.completed == false
      if @user.update(user_params)
         @user.completed = true
         @user.save
         flash[:notice] = "プロフィール入力完了。お手数ですが、再度フォームを記入してください。"
         redirect_to session[:previous_url]
      else
        render :edit
      end
    else
      if @user.update(user_params)
        redirect_to user_path(@user)
      else
        render :edit
      end
    end

  end

  def faculty_select
    if request.xhr?
      render partial: 'faculties', locals: { school_id: params[:school_id]}
    end
  end

  def department_select
    if request.xhr?
      render partial: 'departments', locals: {faculty_id: params[:faculty_id]}
    end
  end

  def sold_list
    items = Item.unscoped.all
    @items = items.where(seller_id: current_user.id, item_type: 0)
  end

  def bought_list
    @items = Item.includes(:contract).where(contracts: {purchaser_id: current_user.id }, item_type: 0)
  end

  def contract_list
    @contracts = Contract.where(seller_id: current_user.id).or(Contract.where(purchaser_id: current_user.id))
  end

  def hope_list
    @items = Item.where(seller_id: current_user.id, item_type: 1)
  end

  private

  def set_user_params
    params.permit(:id)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :school_id, :department_id, :faculty_id, :grade, :image)
  end

  def check_user
    unless user_signed_in? && current_user.id == params[:id].to_i
      redirect_to :root, alert: "不当なアクセスです"
    end
  end

end
