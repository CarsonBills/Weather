require "bundler"
Bundler.require

get "/" do
  erb :root
end
