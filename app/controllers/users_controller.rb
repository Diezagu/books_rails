# frozen_string_literal: true

require 'csv'

class UsersController < ApplicationController
  FILE_HEADERS = %w[Name Age].freeze
  before_action :setup_user, only: %i[show destroy]

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.csv do
        file = generate_csv
        send_data file, filename: "users #{Date.strptime(Date.today.to_s, '%Y-%m-%d')}.csv"
      end
    end
  end

  def show; end

  def destroy
    if @user.destroy
      flash[:notice] = 'user deleted!'
    else
      flash[:alert] = 'error while deleting a user'
    end
    redirect_to users_path
  end

  private

  def permitted_params
    params.require(:user).permit(:name, :age, :email, :password)
  end

  def setup_user
    @user = User.find(params[:id])
  end

  def generate_csv
    CSV.generate(headers: true) do |csv|
      csv << FILE_HEADERS
      @users.each do |user|
        csv << [user.name, user.age]
      end
    end
  end
end
