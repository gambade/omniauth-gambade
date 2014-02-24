#require 'omniauth/core'
module OmniAuth
  module Strategies
    class Gambade
      include OmniAuth::Strategy

      #option :secret
      option :auth_redirect
      option :name, :gambade # Required property by OmniAuth::Strategy

      option :host, nil
      option :port, nil
      option :path, nil
      option :ssl,  false
      option :service_validate_url, '/serviceValidate'
      option :login_url,            '/login'
      option :logout_url,           '/logout'
      # Make all the keys configurable with some defaults set here
      option :uid_field,            'user'
      option :name_key,             'name'
      option :email_key,            'email'
      option :first_name_key,       'first_name'
      option :last_name_key,        'last_name'
      option :location_key,         'location'
      option :image_key,            'image'
      option :phone_key,            'phone'
      # receive parameters from the strategy declaration and save them
      #def initialize(app, secret, auth_redirect, options = {})
      #  #gambade_accounts={}
      #  #gambade_accounts[:secret] = secret
      #  #gambade_accounts[:auth_redirect] = auth_redirect
      #  @secret = secret
      #  @auth_redirect = auth_redirect
      #  super(app, :gambade_accounts, options)
      #end

      # redirect to the GambadeAccounts website
      def request_phase
        r = Rack::Response.new
        r.redirect "http://localhost:3000/login"
        r.finish
      end

      def callback_phase
        uid, username, token = request.params["uid"], request.params["username"], request.params["token"]
        sha1 = Digest::SHA1.hexdigest("a mix of  #{@secret}, #{uid}, #{username}, #{avatar}")

        # check if the request comes from GambadeAccounts or not
        if sha1 == token
          @uid, @username = uid, username
          # OmniAuth takes care of the rest
          super
        else
          # OmniAuth takes care of the rest
          fail!(:invalid_credentials)
        end
      end

      # normalize user's data according to http://github.com/intridea/omniauth/wiki/Auth-Hash-Schema
      def auth_hash
        OmniAuth::Utils.deep_merge(super(), {
            'uid' => @uid,
            'user_info' => {
                'name'     => @username
            }
        })
      end
    end
  end
end