class LeasesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response

    def create
        lease = Lease.create!(lease_params)
        render json: lease
    end

    def destroy
        lease = Lease.find(params[:id])
        lease.destroy
        head :no_content
    end

    private

    def lease_params
        params.permit(:apartment_id, :tenant_id, :rent)
    end

    def render_not_found_response
        render json: {error: 'Lease not Found'}, status: :not_found
    end

    def render_invalid_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

end
