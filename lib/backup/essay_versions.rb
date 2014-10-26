require_relative 'auth'

module OKBackup

  class EssayVersions
    attr_accessor :auth

    def initialize(username, password)
      @auth = OKProfile::Authentication.new(username: username, password: password, driver: "chrome")
      @auth.login
      @browser = @auth.browser
    end

    def backup_profile(path)
      essays = []
      b = @auth.browser
      b.goto "http://okcupid.com/profile"
      begin
        b.window(:url => 'https://www.okcupid.com/profile').use
      rescue
        b.window(:url => 'http://www.okcupid.com/profile').use
      end
      b.links(class: "essay_title").each{|m| m.click}
      b.textareas.each{|c| essays.push c.value}
      essays.uniq.each_with_index do |essay, index|
        unless essay.empty?
        File.open("#{path}/essay_#{index}.txt", 'w') { |file| file.write(essay) }
      end
      end
      @auth.browser.close
    end





  end
end
