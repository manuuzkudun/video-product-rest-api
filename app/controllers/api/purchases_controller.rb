module Api
  class PurchasesController < ApplicationController
    # POST /purchases
    def create
      if previous_purchases.any? and any_active?(previous_purchases)
        render status: :conflict
      else
        @purchase = Purchase.new(purchase_params)
        if @purchase.save!
          render json: @purchase, status: :created
        else
          render json: @purchase.errors, status: :unprocessable_entity
        end
      end
    end

    private

    def previous_purchases
      previous_purchase = Purchase.where(
        user_id: purchase_params[:user_id],
        video_product_id: purchase_params[:video_product_id]
        )
    end

    def any_active?(purchases_list)
      purchases_list.inject(false) { |acc, purchase| purchase.active? or acc }
    end

    def purchase_params
      params.permit(:user_id, :purchase_option_id, :video_product_id)
    end

  end
end
