class UsersController < ApplicationController
  before_action :set_user, only: %w( edit update)

  def show
    @contracts = Contract.where(seller_id: current_user.id).or(Contract.where(purchaser_id: current_user.id))
  end

  def edit
    @schools = School.all
    @faculties = Faculty.all
  end

  def update
    if @user.update(user_params)
       @user.completed = true
       @user.save
       redirect_to root_path
    else
      render :edit
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
    @items = Item.where(seller_id: current_user.id)
  end

  def bought_list
    # 購入アイテムの一覧が欲しい
    # Contractのpurchaser_idがcurrent_userのものの一覧を所得
    # item_idの一覧を所得する
    @items = Item.includes(:contract).where(contracts: {purchaser_id: current_user.id })
  end

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :school_id, :department_id, :faculty_id)
  end
end
