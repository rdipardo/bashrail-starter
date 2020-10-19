class ProductFeaturesController < ApplicationController
  before_action :authenticate_user!

  # cancancan
  load_and_authorize_resource
  # before_action :set_product_feature, only: [:show, :edit, :update, :destroy]

  # cancancan
  load_and_authorize_resource

  # cancancan
  load_and_authorize_resource

  # cancancan..
  # load_and_authorize_resource :product_feature

  # GET /product_features
  def index
    @q = @product_features.ransack params[:q]
    @product_features = @q.result.order(:sort_order, :name, updated_at: :desc).page(params[:page])
  end

  # GET /product_features/1
  def show; end

  # GET /product_features/new
  def new; end

  # GET /product_features/1/edit
  def edit; end

  # POST /product_features
  def create
    respond_to do |format|
      if @product_feature.save
        format.html { redirect_to @product_feature, notice: t('success_create') }
        format.json { render :show, status: :created, location: @product_feature }
      else
        format.html { render :new }
        format.json { render json: @product_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_features/1
  def update
    respond_to do |format|
      if @product_feature.update(product_feature_params)
        format.html { redirect_to @product_feature, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @product_feature }
      else
        format.html { render :edit }
        format.json { render json: @product_feature.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_features/1
  def destroy
    @product_feature.destroy
    respond_to do |format|
      format.html { redirect_to product_features_url, notice: t('success_destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def product_feature_params
    params.require(:product_feature).permit(:name, :product_id, :pfeature_id, :active_status, :sort_order)
  end
end
