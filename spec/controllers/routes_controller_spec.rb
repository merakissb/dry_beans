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
      date: formatted_date,
      delivery_type: 'pickup'
    )
  end

  describe 'GET #index' do
    context 'when routes exist' do
      it 'returns 200 and all routes' do
        get :index, format: :json
        routes = Route.all
        expect(response).to have_http_status(:ok)

        json_response = JSON.parse(response.body)
        expect(json_response.size).to eq(routes.size)
      end
    end

    context 'when routes do not exist' do
      it 'returns 200 and empty array' do
        Route.destroy_all
        get :index, format: :json
        expect(response).to have_http_status(:ok)

        json_response = JSON.parse(response.body)
        expect(json_response).to eq([])
      end
    end
  end

  describe 'GET #show' do
    context 'when route exists' do
      it 'returns the route with trips and deliveries' do
        get :show, params: { id: route.id }, format: :json
        expect(response).to have_http_status(:ok)

        json_response = JSON.parse(response.body)

        # check route
        expect(json_response['id']).to eq(route.id)

        # Check trip id
        expect(json_response['trips'][0]['id']).to eq(trip.id)

        # Check delivery id
        expect(json_response['trips'][0]['deliveries'][0]['id']).to eq(delivery.id)
      end
    end

    context 'when route does not exist' do
      it 'returns 404 and error message' do
        get :show, params: { id: 999 }, format: :json
        expect(response).to have_http_status(:not_found)

        json_response = JSON.parse(response.body)
        expect(json_response['resource_not_found']) == 'true'
      end
    end
  end

  describe 'POST #create' do
    context 'when route is valid' do
      it 'returns 201 and the route' do
        post :create, params: { route: { name: 'New Route', date: formatted_date } }, format: :json
        expect(response).to have_http_status(:created)

        json_response = JSON.parse(response.body)
        expect(json_response['name']).to eq('New Route')
      end
    end

    context 'when route is invalid' do
      it 'returns 422 and error message' do
        post :create, params: { route: { name: 'New Route' } }, format: :json
        expect(response).to have_http_status(:unprocessable_entity)

        json_response = JSON.parse(response.body)
        expect(json_response['errors']).to eq(['Date can\'t be blank'])
      end
    end
  end
end
