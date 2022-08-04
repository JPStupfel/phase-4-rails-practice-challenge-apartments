class ApartmentsController < ApplicationController

    def index
        render json: Apartment.all
    end

    def show
        apartment = Apartment.find_by! id: params['id']
        render json: apartment
    end

    def create
        apartment = Apartment.create! apartment_params
        render json: apartment
    end

    def update
        apartment = Apartment.find_by! id: params['id']
        apartment.update apartment_params
        render json: apartment
    end

    def destroy
        apartment = Apartment.find_by! id: params['id']
        apartment.destroy
        render json: apartment
    end

    private

    def apartment_params
        params.permit :number
    end


end
