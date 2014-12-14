require 'sinatra'
require 'barby'
require 'barby/barcode/bookland'
require 'barby/outputter/png_outputter'

class App < Sinatra::Base
  get '/bookland/:code' do |code|
    image = StringIO.new Barby::Bookland.new(code).to_png(xdim: 3, height: 100)
    content_type 'image/png'
    image
  end
end
