require 'csv'

class UsersController < ApplicationController
    COLUMNS = ['Name', 'Age'].freeze
    before_action :setup_user, only: %i[ edit show update destroy ]

    def index
        @users = User.all
        respond_to do |format|
            format.html
            format.csv { 
                file = CSV.generate(headers: true) do |csv|
                    csv << COLUMNS
                    @users.each do |user|
                        csv << [user.name, user.age]
                    end
                  end
                send_data file, filename: "users.csv" 
            }
        end
    end

    def create
        user = User.new(permitted_params)
        
        if user.save
            flash[:notice] = 'user created!'
            redirect_to users_path
        else
            flash.now[:alert] = 'error while creating user'
            render 'new'
        end

    end

    def new
        @user = User.new
    end

    def edit
    end

    def show
    end

    def update
        if @user.update(permitted_params)
            flash[:notice] = 'user updated!'
            redirect_to users_path
        else
            flash.now[:alert] = 'error while updating a user'
            render :edit
        end

    end

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
        params.require(:user).permit(:name, :age)
    end

    def setup_user
        @user =  User.find(params[:id])
    end
end
