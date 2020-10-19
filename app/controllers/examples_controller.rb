class ExamplesController < ApplicationController
  before_action :authenticate_user!

  # cancancan
  load_and_authorize_resource
  # before_action :set_example, only: [:show, :edit, :update, :destroy]

  # cancancan
  load_and_authorize_resource

  # cancancan
  load_and_authorize_resource

  # cancancan..
  # load_and_authorize_resource :example

  # GET /examples
  def index
    @q = @examples.ransack params[:q]
    @examples = @q.result.page(params[:page])
  end

  # GET /examples/1
  def show; end

  # GET /examples/new
  def new; end

  # GET /examples/1/edit
  def edit; end

  # POST /examples
  def create
    respond_to do |format|
      if @example.save
        format.html { redirect_to @example, notice: t('success_create') }
        format.json { render :show, status: :created, location: @example }
      else
        format.html { render :new }
        format.json { render json: @example.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /examples/1
  def update
    respond_to do |format|
      if @example.update(example_params)
        format.html { redirect_to @example, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @example }
      else
        format.html { render :edit }
        format.json { render json: @example.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /examples/1
  def destroy
    @example.destroy
    respond_to do |format|
      format.html { redirect_to examples_url, notice: t('success_destroy') }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a trusted parameter "white list" through.
  def example_params
    params.require(:example).permit(:name, :color)
  end
end
