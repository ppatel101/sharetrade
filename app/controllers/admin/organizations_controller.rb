class Admin::OrganizationsController < AdminController
  before_action :find_organization, except: [:index, :new, :create]

  def index
    @organizations = Organization.all
  end

  def new
    @organization = Organization.new
  end

  def create
    @organization = Organization.new(organization_params)
    respond_to do |format|
      if @organization.save
        format.html { redirect_to admin_organizations_path, notice: 'Organization was successfully created.' }
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to admin_organizations_path, notice: 'Organization was successfully updated.' }
      else
        format.html { render 'edit'}
      end
    end
  end

  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to admin_organizations_path, notice: 'Organization was successfully destroyed.' }
    end
  end

  private
  def organization_params
    params.require(:organization).permit( :name, :domain )
  end
  def find_organization
    @organization = Organization.find(params[:id])
  end
end
