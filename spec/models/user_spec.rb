require 'spec_helper'

describe User do

  before { @user = User.new(first_name: "aime",last_name: "ngongang", email: "aime@ngongang.com",password: "yoo", password_confirmation: "man")}

  subject { @user }

  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) } 
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  #it { should be_valid }

  describe "when firstname is not present" do
    before { @user.first_name = " " }
    it { should_not be_valid }
  end
  describe "when lastname is not present" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  describe "when firstname is too long" do
    before { @user.first_name = "a" * 51 }
    it { should_not be_valid }
  end
  describe "when lastname is too long" do
    before { @user.last_name = "a" * 51 }
    it { should_not be_valid }
  end
=begin
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com aime@pena..com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[A_US-ER@fb.org]
      #user@foo.COM A_US-ER@fb.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end
=end
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
  end
    it { should_not be_valid }
  describe "when password is not present" do
    before do
      @user = User.new(first_name: "aime",last_name: "ngongang", email: "aime@ngongang.com",password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end
  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "donotmatch" }
      it { should_not be_valid }
  end
end

