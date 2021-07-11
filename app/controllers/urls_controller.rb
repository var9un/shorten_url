class UrlsController < ApplicationController
  before_action :existing_url_presence, only: [:create]

  def new
    @url = Url.new
  end

  def create
    unless @existing_url
      @url = Url.new(url_params)
       if @url.valid?
         @url.save
      end
    end
  end

private
  def url_params
    params.require(:url).permit(:website_url)
  end

  def existing_url_presence
    @existing_url = Url.where(website_url: url_params[:website_url]).first
  end
end
