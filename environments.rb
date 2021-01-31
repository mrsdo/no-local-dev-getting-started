

configure :development, :production do
 set :show_exceptions, true
 set :public_folder, 'public'
 set :views, 'app/views'
end

configure :production, :development do
  # db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

  db = URI.parse(ENV['DATABASE_URL'] || 'postgres://lvbsyipxlnjzvf:db94c7c5f909a597735ac3d609b0473070dee24ab111025ab7ffd4dc06100cc2@ec2-75-101-212-64.compute-1.amazonaws.com:5432/d1stml5b21fb20')

  ActiveRecord::Base.establish_connection(
   :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
   :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
 )
end

