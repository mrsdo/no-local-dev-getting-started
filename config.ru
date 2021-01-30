# config.ru

require './app'
$stdout.sync = true
run Sinatra::Base
use ApplicationController