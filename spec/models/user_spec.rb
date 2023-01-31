require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "should have an email, first name, last name, password and password confirmation" do
      @fake_user = User.new(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: "password")
    
      expect(@fake_user).to be_valid
    
    end

    it "should have a first name, return an error if name is nil" do

      @fake_user = User.new(first_name: nil, last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: "password")
      @fake_user.save

      # logs the error to console if there is one
      puts @fake_user.errors.full_messages
      expect(@fake_user.first_name).to be_nil
      expect(@fake_user.errors.full_messages).to include "First name can't be blank"

    end

    it "should have a last name, and return an error if name is nil" do

      @fake_user = User.new(first_name: "Aragorn", last_name: nil, email: "chosenguy@place.com", password: "password", password_confirmation: "password")
      @fake_user.save

      # logs the error to console if there is one
      puts @fake_user.errors.full_messages
      expect(@fake_user.last_name).to be_nil
      expect(@fake_user.errors.full_messages).to include "Last name can't be blank"

    end

    it "should have an email, and return an error if email is nil" do

      @fake_user = User.new(first_name: "Aragorn", last_name: "Sonofarathorn", email: nil, password: "password", password_confirmation: "password")
      @fake_user.save

      # logs the error to console if there is one
      puts @fake_user.errors.full_messages
      expect(@fake_user.email).to be_nil
      expect(@fake_user.errors.full_messages).to include "Email can't be blank"

    end

    it "should have a password, and return an error if password is nil" do

      @fake_user = User.new(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: nil, password_confirmation: "password")
      @fake_user.save

      # logs the error to console if there is one
      puts @fake_user.errors.full_messages
      expect(@fake_user.password).to be_nil
      expect(@fake_user.errors.full_messages).to include "Password can't be blank"

    end

    it "should have a password confirmation, and return an error if password confirmation is nil" do

      @fake_user = User.new(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: nil)
      @fake_user.save

      # logs the error to console if there is one
      puts @fake_user.errors.full_messages
      expect(@fake_user.password_confirmation).to be_nil
      expect(@fake_user.errors.full_messages).to include "Password confirmation can't be blank"

    end

    it "should have a matching password and password_confirmation, and return an error if password/confirmation do not match" do

      @fake_user = User.new(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: "asdsflkj")
      @fake_user.save

      # logs the error to console if there is one
      puts @fake_user.errors.full_messages

      expect(@fake_user.errors.full_messages).to include "Password confirmation doesn't match Password"

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
