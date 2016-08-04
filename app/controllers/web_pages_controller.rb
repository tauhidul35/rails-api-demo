class WebPagesController < ApplicationController
  before_action :set_web_page, only: [:show, :update, :destroy]

  # GET /web_pages
  def index
    @web_pages = WebPage.all

    render json: @web_pages
  end

  # GET /web_pages/1
  def show
    render json: @web_page
  end

  # POST /web_pages
  def create
    @web_page = WebPage.new(web_page_params)

    if @web_page.save
      render json: @web_page, status: :created, location: @web_page
    else
      render json: @web_page.errors, status: :unprocessable_entity
    end
  rescue
    render json: @web_page.errors, status: :unprocessable_entity
  end

  # PATCH/PUT /web_pages/1
  def update
    if @web_page.update(web_page_params)
      render json: @web_page
    else
      render json: @web_page.errors, status: :unprocessable_entity
    end
  rescue
    render json: @web_page.errors, status: :unprocessable_entity
  end

  # DELETE /web_pages/1
  def destroy
    if @web_page.destroy
      render json: { status: :deleted }
    else
      render json: @web_page.errors
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_web_page
    @web_page = WebPage.find_by(id: params[:id])
    render json: not_found unless @web_page
  end

  # Only allow a trusted parameter "white list" through.
  def web_page_params
    params.require(:web_page).permit(:url)
  end
end
