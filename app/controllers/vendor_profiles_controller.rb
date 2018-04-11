class VendorProfilesController < ApplicationController
  def new
    @user_id = current_user.id
    @vendor_profile = VendorProfile.new
    UserRole.create(role_id: 2, user: current_user)
  end

  def create
    @vendor_profile = VendorProfile.create(vendor_params)
    redirect_to vendor_profile_path(current_user)
  end

  def show

  end

  private

      def vendor_params
        params.require(:vendor_profile).permit(:company, :category, :phone, :name, :title)
      end
end
