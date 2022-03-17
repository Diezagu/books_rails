class UsersController < ApplicationController
    before_action :setup_user, only: %i[ edit show update destroy ]
    def index
        @users = User.all
    end

    def create
        user = User.new(permitted_params)
        
        if user.save
            flash[:notice] = 'user created!'
            redirect_to users_path
        else
            flash[:alert] = 'error while creating user'
            redirect_to new_user_path
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
            flash[:alert] = 'error while updating a user'
            redirect_to edit_user_path
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
