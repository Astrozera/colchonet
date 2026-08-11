class UsersController < ApplicationController
  before_action :set_users, only: %i[show edit update]
  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user,
                  notice: "Cadastro realizado com sucesso"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user,
                  notice: "Cadastro atualizado com sucesso"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_users
    @user = User.find(params[:id])
  end

  def user_params
    params.expect(
      user: [:full_name, :email, :password , :location, :bio]
    )
  end
end