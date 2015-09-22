module Api
  module V1

    class UsersController < ApiController
       before_filter :restrict_access

      def index
        render json: User.all , only:[:name,:email]
      end

      def show
         render json: User.find_by_id(params[:id]) , only:[:name,:email]
      end

      def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: @user , only:[:name,:email]
      end

      def create
        @user = User.new(user_params)
        respond_to do |format|
          if @user.save
            format.json { render json: @user, status: :created }
            format.xml { render xml: @user, status: :created }
          else
            format.json { render json: @user.errors, status: :unprocessable_entity }
            format.xml { render xml: @user.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        @user = User.find(params[:id])
        respond_to do |format|
          if @user.update_attributes(user_params)
            format.json { head :no_content, status: :ok }
            format.xml { head :no_content, status: :ok }
          else
            format.json { render json: @user.errors, status: :unprocessable_entity }
            format.xml { render xml: @user.errors, status: :unprocessable_entity }
          end
        end
      end

      private
       def user_params
         params.require(:user).permit(:name, :email, :isAdmin, :superAdmin, :password, :password_confirmation, :row_order, :avatar)
      end

    end

  end
end
