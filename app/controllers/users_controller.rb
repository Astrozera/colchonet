class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path,
                  notice: "Cadastro realizado com sucesso"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.expect(
      user: [:full_name, :email, :password, :location, :bio]
    )
  end
end