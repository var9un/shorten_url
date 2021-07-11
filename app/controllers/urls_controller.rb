class UrlsController < ApplicationController
  before_action :existing_url_presence, only: [:create]
  before_action :get_original_url, only: [:show]

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

  def show
    if @url.present? && @url.expire_url_time > Time.now
      @url.save_analytics_record(request)
      redirect_to @url.website_url and return
    else
      redirect_to :root, alert: 'Invalid slug' and return
    end
  end

  def stats
    @urls = Url.all.includes(:analytics_records)
  end

private
  def url_params
    params.require(:url).permit(:website_url)
  end

  def existing_url_presence
    @existing_url = Url.where(website_url: url_params[:website_url]).first
  end

  def get_original_url
    @url = Url.find_by(slug: params[:slug])
  end

end
