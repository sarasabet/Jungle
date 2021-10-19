require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    before do 
      @user = User.new(name:"sara", last_name:"Sbaet", email:"sara@yahoo", password:"0000", password_confirmation:"0000")
      @user1 = User.new(name:"Sara", last_name:"Sbaet", email:"SARA@yahoo", password:"0000", password_confirmation:"0000")
    end

    
    it 'is valid with all the fields' do
      @user.valid?
      @user.errors.full_messages
      expect(@user).to be_valid
    end
    it "is not valid if the oassword isnot mathc" do 
      @user.password_confirmation = "1111"
      @user.valid?
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid if first name is nill/empty" do 
      @user.name= nil
      @user.valid?
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid if first last_name is nill/empty" do 
      @user.last_name= nil
      @user.valid?
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid if first email is nill/empty" do 
      @user.email= nil
      @user.valid?
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid if  password is nill/empty" do 
      @user.password= nil
      @user.valid?
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end

    it "is not valid if password-confirmation is nill/empty" do 
      @user.password_confirmation= nil
      @user.valid?
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end
      
    it 'email should be unique' do
      @user.save
      @user1.valid?
      @user1.errors.full_messages
      expect(@user1).to_not be_valid
    end

    it 'should not be valid if password length is less than 3 characters' do
      @user.password = "p"
      @user.valid?
      @user.errors.full_messages
      expect(@user).to_not be_valid
    end
  end


  describe '.authenticate_with_credentials' do
    before do 
      @user = User.new(name: "sara", last_name: "sabet", email: "sara@yahoo", password: "0000", password_confirmation: "0000")
    end

    it 'should allow users to login if they have the correct email and password' do
      @user.save
      user1 = User.authenticate_with_credentials('sara@yahoo', '0000')
      expect(@user).to be ==  @user
    end

    it 'should pass even if email has spaces present in email' do
      @user.save
      user1 = User.authenticate_with_credentials('   sara@yahoo', '0000')
      expect(@user).to be == @user
    end

    it 'should pass even if email has capital letters' do
      @user.save
      user1 = User.authenticate_with_credentials('SARA@yahoo', '0000')
      expect(@user).to be == @user
    end

    it 'should fail if email does not exist in database' do
      @user.save
      user1 = User.authenticate_with_credentials('sara@yahoo00', '0000')
      expect(user1).to be == nil
    end

    it 'should fail if password does not match with email in database' do
      @user.save
      user1 = User.authenticate_with_credentials('sara@yahoo', '000000')
      expect(user1).to be == false
    end
  end

end
