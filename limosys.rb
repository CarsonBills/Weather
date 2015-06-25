require "bundler"
Bundler.require

get "/" do
  erb :root
end

post "/" do
  city = params["city"].gsub(" ","+").downcase
  @current_data = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast?q=#{city}&APPID=74ff560ad00112e661ced02f92456921")
  if @current_data["cod"] == "200"
    erb :result
  else
    redirect "error"
  end
end

post "/forecast" do
  city = params["city"]
  forecast_data = HTTParty.get("http://api.openweathermap.org/data/2.5/forecast/daily?q=#{city}&cnt=5&APPID=74ff560ad00112e661ced02f92456921")

  f = forecast_data["list"].map { |report| "<p>Temp:#{(report["temp"]["day"]- 273.15).round}</p>" }


end

get "/error" do
  erb :error
end

#http://api.openweathermap.org/data/2.5/forecast/daily?q=new+york&cnt=5&APPID=74ff560ad00112e661ced02f92456921
