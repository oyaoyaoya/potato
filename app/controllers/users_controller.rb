class UsersController < ApplicationController
  before_action :set_user, only: %w( edit update)

  def show

    # カラム内でかつ検索が有る恥ず
    @contracts = Contract.where(seller_id: 99).or(Contract.where(purchaser_id: 99))
    # a = Contract.where(purchaser_id: current_user)
    # b = Contract.where(seller_id: current_user)
    # c.messages.last.user.id
    #
    # c = a + b
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

  private
  def set_user
    @user = User.find(params[:id])
  end
  def user_params
    params.require(:user).permit(:name, :school_id, :department_id, :faculty_id)
  end
end
