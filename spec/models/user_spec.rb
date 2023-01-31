require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "should have an email, first name, last name, password and password confirmation" do
      @fake_user = User.new(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: "password")
    
      expect(@fake_user).to be_valid
    
    end

    it "should have a name, return an error if name is nil" do

      @fake_user = User.new(first_name: nil, last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: "password")
      @fake_user.save

      # logs the error to console if there is one
      puts @fake_user.errors.full_messages
      expect(@fake_user.first_name).to be_nil

    end

    


    # it "should have a matching password and password confirmation" do

    # end


    # it "should have a unique email that does not yet exist on user creation" do

    # end


    # it "should not matter if an email is provided as upper case or lower case" do

    # end


    # it "should not matter if an email has whitespace preceding or following" do

    # end

  end

end
