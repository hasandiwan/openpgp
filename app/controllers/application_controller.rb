require 'gpgme'
require 'json/ext' # to use the C based extension instead of json/pure
class ApplicationController < ActionController::API
  def sign
    crypto = GPGME::Crypto.new(:passphrase_callback_value => :pass_function)
    text = crypto.clearsign(params[:text].to_s).read 
    render json: { :signed => text }
  end
  def pass_function(obj, uid_hint, passphrase_info, prev_was_bad, fd)
    io = IO.for_fd(fd, 'w')
    io.puts "wo de nu peng you shi alice lee"
    io.flush
  end
end
