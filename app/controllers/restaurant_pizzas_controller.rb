class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid     

    def create
        restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        render json: restaurant_pizza.pizza, status: :created
    end

    private

    def restaurant_pizza_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end

    def record_invalid(e)         
        render json: {errors: e.record.errors.full_messages }, status: :unprocessable_entity     
      end      
    
end
