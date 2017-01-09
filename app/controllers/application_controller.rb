class ApplicationController < ActionController::Base
  require 'ostruct'
  protect_from_forgery with: :exception
end
