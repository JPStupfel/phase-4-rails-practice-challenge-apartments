class TenantsController < ApplicationController
    def index
        render json: Tenant.all
    end

    def show
        tenant = Tenant.find_by! id: params['id']
        render json: tenant
    end

    def create
        tenant = Tenant.create! tenant_params
        render json: tenant
    end

    def update
        tenant = Tenant.find_by! id: params['id']
        tenant.update tenant_params
        render json: tenant
    end

    def destroy
        tenant = Tenant.find_by! id: params['id']
        tenant.destroy
        render json: tenant
    end

    private

    def tenant_params
        params.permit :name, :age
    end
end
