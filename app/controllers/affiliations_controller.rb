class AffiliationsController < ApplicationController
  def create
    @organization = Organization.find(params[:affiliation][:organization_id])
    current_user.affiliate!(@organization)
    redirect_to @organization
  end

  def destroy
    @organization = Affiliation.find(params[:id]).organization
    current_user.unaffiliate!(@organization)
    redirect_to @organization
  end
end
