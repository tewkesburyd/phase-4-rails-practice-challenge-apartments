class ApartmentsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :render_invalid_response
    def index
        render json: Apartment.all
    end

    def show
        apartment = Apartment.find(params[:id])
        render json: apartment
    end

    def create
        apartment = Apartment.create!(apartment_params)
        render json: apartment, status: :created
    end

    def update
        apartment = Apartment.find(params[:id])
        apartment.update(apartment_params)
        render json: apartment, status: :accepted
    end

    def destroy
        apartment = Apartment.find(params[:id])
        apartment.destroy
        head :no_content
    end

    private

    def apartment_params
        params.permit(:number)
    end

    def render_not_found_response
        render json: {error: 'Apartment not Found'}, status: :not_found
    end

    def render_invalid_response(exception)
        render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end
end
