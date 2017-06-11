module JsonHelper
  def json(symbolize_names: true)
    JSON.parse(response.body, symbolize_names: symbolize_names)
  end
end
