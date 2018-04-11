class CustomerProfilesController < ApplicationController
  def new
    @user_id = current_user.id
    @customer_profile = CustomerProfile.new
    UserRole.create(role_id: 1, user: current_user)
  end

  def create
    @customer_profile = CustomerProfile.create(customer_params)
    redirect_to customer_profile_path(current_user)
  end

  def show

  end

  private

      def customer_params
        params.require(:customer_profile).permit(:company, :delivery_address, :phone, :name, :title)
      end
end
