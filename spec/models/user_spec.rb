require 'rails_helper'

RSpec.describe User, type: :model do

  private

  describe 'Validations' do

    it "should have an email, first name, last name, password and password confirmation" do
      @fake_user = User.create(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: "password")
    
      expect(@fake_user).to be_valid
    
    end

    it "should have a first name, return an error if name is nil" do

      @fake_user = User.create(first_name: nil, last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: "password")

      expect(@fake_user.first_name).to be_nil
      expect(@fake_user.errors.full_messages).to include "First name can't be blank"

    end

    it "should have a last name, and return an error if name is nil" do

      @fake_user = User.create(first_name: "Aragorn", last_name: nil, email: "chosenguy@place.com", password: "password", password_confirmation: "password")

      expect(@fake_user.last_name).to be_nil
      expect(@fake_user.errors.full_messages).to include "Last name can't be blank"

    end

    it "should have an email, and return an error if email is nil" do

      @fake_user = User.create(first_name: "Aragorn", last_name: "Sonofarathorn", email: nil, password: "password", password_confirmation: "password")

      expect(@fake_user.email).to be_nil
      expect(@fake_user.errors.full_messages).to include "Email can't be blank"

    end

    it "should have a password, and return an error if password is nil" do

      @fake_user = User.create(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: nil, password_confirmation: "password")

      expect(@fake_user.password).to be_nil
      expect(@fake_user.errors.full_messages).to include "Password can't be blank"

    end

    it "should have a password confirmation, and return an error if password confirmation is nil" do

      @fake_user = User.create(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: nil)

      expect(@fake_user.password_confirmation).to be_nil
      expect(@fake_user.errors.full_messages).to include "Password confirmation can't be blank"

    end

    it "should have a matching password and password_confirmation, and return an error if password/confirmation do not match" do

      @fake_user = User.create(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: "asdsflkj")

      expect(@fake_user.errors.full_messages).to include "Password confirmation doesn't match Password"

    end
  

    it "should have a unique email that does not yet exist on user creation, regardless of case sensitivity" do

      @fake_user_one = User.create(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: "password")

      @fake_user_two = User.create(first_name: "Boromir", last_name: "Ofgondor", email: "CHOSENGUY@place.com", password: "caretaker", password_confirmation: "caretaker")

      expect(@fake_user_two.errors.full_messages).to include "Email has already been taken"

    end


    it "should trim whitespace entered if an email has spaces preceding or following" do

      @fake_user = User.create(first_name: "Aragorn", last_name: "Sonofarathorn", email: "  chosenguy@place.com  ", password: "password", password_confirmation: "password")

      expect(@fake_user.email).to eq("chosenguy@place.com")

    end


    it "should produce an error message if the password is less than 8 characters" do

      @fake_user = User.create(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "passwor", password_confirmation: "passwor")

      expect(@fake_user.errors.full_messages).to include "Password is too short (minimum is 8 characters)"

    end

  end

  describe '.authenticate_with_credentials' do

    it "should return a user state if the password and email are correct" do

      @fake_user = User.create(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: "password")

      @fake_user_instance = User.authenticate_with_credentials("chosenguy@place.com", "password")

      expect(@fake_user_instance).to_not be_nil

    end

    it "should return nil if the password and email are incorrect" do

      @fake_user = User.create(first_name: "Aragorn", last_name: "Sonofarathorn", email: "chosenguy@place.com", password: "password", password_confirmation: "password")

      @fake_user_instance = User.authenticate_with_credentials("chosenguy@place.com", "pasdfasdfassword")

      expect(@fake_user_instance).to be false

    end

  end

end
