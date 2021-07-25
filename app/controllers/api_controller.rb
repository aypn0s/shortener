class ApiController < ApplicationController
  protect_from_forgery except: [:shorten]

  def shorten
    url = params[:url] || ''
    provider = params[:provider] || ''
    
    if url.blank?
      response = { status: 'Invalid request, url is required' }
    else
      response = ShortService.new(url, provider).result
    end

    render json: response
  end
end
