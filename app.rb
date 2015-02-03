require("sinatra")
require("sinatra/reloader")
require("./lib/stylist")
require("./lib/client")
require("pg")
require("pry")
DB = PG.connect({:dbname => "salon_database_test" })

get('/') do
  @stylists = Stylist.all()
  erb(:index)
end

post('/index') do
  stylist_name = params.fetch("stylist_name")
  stylist = Stylist.new({:stylist_name => stylist_name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i())
  erb(:show)
end

post("/clients") do
  @stylist = Stylist.find(params.fetch('stylist_id').to_i())
  client = Client.new({:client_name => params.fetch('client_name'), :id => nil, :stylist_id => params.fetch('stylist_id').to_i()})
  client.save()
  erb(:show)
end
