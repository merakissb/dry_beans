# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::RoutesController, type: :controller do
  let(:formatted_date) { Time.zone.now.strftime('%Y-%m-%d') }

  let!(:route) do
    Route.create(
      id: 1,
      name: 'Sample Route',
      date: formatted_date
    )
  end

  let!(:trip) do
    Trip.create(
      id: 1,
      route_id: route.id,
      date: formatted_date,
      name: 'Sample Trip'
    )
  end

  let!(:delivery) do
    Delivery.create(
      id: 1,
      trip_id: trip.id,
      delivery_type: 'pickup'
    )
  end

  describe 'GET #show' do
    context 'when route exists' do
      it 'returns the route with trips and deliveries' do
        get :show, params: { id: route.id }, format: :json
        expect(response).to have_http_status(:ok)

        # check route
        json_response = JSON.parse(response.body)
        expect(json_response['id']).to eq(route.id)
        expect(json_response['name']).to eq(route.name)
        json_date = json_response['date'].to_date.strftime('%Y-%m-%d')
        expect(json_date).to eq(formatted_date)

        # Check trips
        expect(json_response['trips'].size).to eq(1)

        # Check deliveries
        expect(json_response['trips'][0]['deliveries'].size).to eq(1)
      end
    end

    context 'when route does not exist' do
      it 'handles not found route' do
        get :show, params: { id: 'nonexistent' }, format: :json
        expect(response).to have_http_status(:not_found)

        json_response = JSON.parse(response.body)
        expect(json_response['errors']).to eq('Route not found')
      end
    end
  end
end