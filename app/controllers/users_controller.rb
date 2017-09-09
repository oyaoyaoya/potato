class UsersController < ApplicationController
  before_action :set_user, only: %w( edit update show)
  # before_action :check_user, only: %w( edit show)

  def show
  end

  def edit
    @schools = School.all
    @faculties = Faculty.where.not(id: 1)
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
    @user = User.find_by(set_user_params)
  end

  def user_params
    params.require(:user).permit(:name, :school_id, :department_id, :faculty_id, :grade)
  end

  def check_user
    unless user_signed_in? && current_user.id == params[:id].to_i
      redirect_to :root, alert: "不当なアクセスです"
    end
  end

end
