class ShortService
  attr_reader :result

  def initialize(url, provider)
    @url = url
    @result = {}
    @current_provider = nil
    handle_provider(provider)
  end

  def handle_provider(provider)
    @current_provider = Provider.find_by(name: provider, active: true)
    @current_provider = Provider.find_by(default: true) if @current_provider.blank?

    case @current_provider.name
    when 'bitly'
      bitly
    when 'tinyurl'
      tinyurl
    end
  end

  def bitly
    bitly_api_url = 'https://api-ssl.bitly.com/v4/shorten'
    params = { "long_url": @url }.to_json
    api_token = @current_provider.api_token
    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{api_token}"
    }
    response = Faraday.post(bitly_api_url, params, headers)

    if [200, 201].include?(response.status)
      short_url = JSON.parse(response.body)['link']
      @current_provider.increment!(:shortened_links_count)
      @result = { short_url: short_url }
    else
      @result = JSON.parse(response.body)
    end
  end

  def tinyurl
    response = Faraday.get("https://tinyurl.com/api-create.php?url=#{@url}")
    
    if response.body == 'Error'
      @result = { status: 'Something went wrong, maybe not valid url?' }
    else
      @current_provider.increment!(:shortened_links_count)
      @result = { short_url: response.body }
    end
  end
end