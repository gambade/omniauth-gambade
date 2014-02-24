require 'omniauth/gambade/version'
require 'omniauth/strategies/gambade'
require 'omniauth'
module OmniAuth
  module Strategies
    autoload :Identity, 'omniauth/strategies/gambade'
  end
end