class OrganizationsController < ApplicationController
  def index
    @title = "Organizations"
    @organizations = Organization.paginate(:page => params[:page])
  end

  def show
    @organization = Organization.find(params[:id])
    @title = @organization.name
  end

end
