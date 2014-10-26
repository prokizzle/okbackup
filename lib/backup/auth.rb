require 'watir-webdriver'

module OKBackup

  class Authentication
    attr_reader :browser

    def initialize(args)
      @username = args[:username]
      @password = args[:password]
      driver    = args[:driver].to_sym
      @browser = Watir::Browser.new driver

    end

    def login
      print "AutoRater logging in with PhantomJS... " if $verbose
      @browser.goto("http://www.okcupid.com")

      @browser.link(:text => "Sign in").click
      sleep (1..3).to_a.sample.to_i
      @browser.text_field(:id => 'login_username').set(@username)
      sleep (1..3).to_a.sample.to_i
      @browser.text_field(:id => 'login_password').set(@password)
      sleep (1..3).to_a.sample.to_i
      @browser.button(:id => 'sign_in_button').click
      sleep (1..3).to_a.sample.to_i
      # @browser.goto("http://www.okcupid.com/quickmatch"
      if $verbose
        puts logged in? ? "OK" : "failed"
      end
      return logged_in?
    end

    def logged_in?
      return @browser.h1(:id => 'home_heading').exists?
    end



    def logout
      @browser.close
    end



  end

end
