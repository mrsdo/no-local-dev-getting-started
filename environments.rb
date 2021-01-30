

configure :development, :production do
 set :show_exceptions, true
 set :public_folder, 'public'
 set :views, 'app/views'
end

configure :production, :development do
 db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

 ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end
