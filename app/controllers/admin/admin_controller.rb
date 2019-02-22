class Admin::AdminController < ApplicationController

http_basic_authenticate_with name: ENV['username'], password: ENV['password']

end

