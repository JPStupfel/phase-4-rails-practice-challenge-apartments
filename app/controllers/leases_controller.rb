class LeasesController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :lost

    def create
        lease = Lease.create! lease_params
        render json: lease
    end

    def destroy
        lease = Lease.find_by! id: params['id']
        lease.destroy
        render json: lease
    end

    private
    def lease_params
        params.permit :rent, :tenant_id, :apartment_id
    end

    def lost
        render json: {Message: 'No Record'}
    end
end
