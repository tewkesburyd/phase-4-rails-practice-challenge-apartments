class TenantsController < ApplicationController
    
    def index
        render json: Tenant.all
    end

    def show
        tenant = Tenant.find(params[:id])
        render json: tenant
    end

    def update
        tenant = Tenant.find(params[:id])
        tenant.update(tenant_params)
        render json: tenant
    end

    def create
        tenant = Tenant.create!(tenant_params)
        render json: tenant, status: :accpeted
    end

    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy
        head :no_content
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: {error: 'Tenant not Found'}, status: :not_found
    end

    def render_invalid_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end
end
