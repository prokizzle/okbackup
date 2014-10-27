require_relative 'auth'

module OKBackup

  class EssayVersions
    attr_accessor :auth

    def initialize(username, password)
      @auth = OKBackup::Authentication.new(username: username, password: password, driver: "chrome")
      @auth.login
      @browser = @auth.browser
    end

    def backup_profile(path)
      essays = []
      essay_names = {:"0" => "self_summary", :"1" => "what_im_doing_with_my_life", :"2" => "im_really_good_at", :"3" => "first_thing_people_notice_about_me", :"4" =>"favorites", :"5" => "six_things", :"6" => "think_about", :"7" => "friday_night", :"9" => "message_me_if"}
      b = @auth.browser
      b.goto "http://okcupid.com/profile"
      begin
        b.window(:url => 'https://www.okcupid.com/profile').use
      rescue
        b.window(:url => 'http://www.okcupid.com/profile').use
      end
      b.links(class: "essay_title").each{|m| m.click}

      essay_names.each do |index, name|
        begin
          essay = b.textarea(id: "edit_#{index}").value
          File.open("#{path}/#{name}.txt", 'w') { |file| file.write(essay) }
        rescue
        end
      end

      # b.textareas.each{|c| essays.push c.value}
      # essays.uniq.each_with_index do |essay, index|
      #   # unless essay.empty?
      #     File.open("#{path}/essay_#{index}.txt", 'w') { |file| file.write(essay) }
      #   # end
      # end
      @auth.browser.close
    end





  end
end
