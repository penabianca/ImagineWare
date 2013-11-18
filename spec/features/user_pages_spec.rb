require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.first_name) }
    it { should have_title(user.first_name + user.last_name) }
  end
  describe"signup page" do
    before { visit signup_students_path }

    it { should have_content('Sign up') }
    #it { should have_title(full_title('Sign up')) }
  end
  describe "signup" do
    before { visit signup_students_path }
    let(:submit) { "Create my account" }

    describe "with invalid information" do
      before do
        fill_in "user_first_name",    with: "Aime"
        fill_in "user_last_name",     with: "Ngongang"
        fill_in "user_email",         with: "aime@@b@@ngongang.com"
        fill_in "user_password",      with: "penabianca"
        fill_in "user_password_confirmation", with: "penabianca"
      end
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end
    describe "with valid information" do
      before do
        fill_in "user_first_name",    with: "Aime"
        fill_in "user_last_name",     with: "Ngongang"
        fill_in "user_email",         with: "aime@ngongang.com"
        fill_in "user_password",      with: "penabianca"
        fill_in "user_password_confirmation", with: "penabianca"
      end
      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
=begin
  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) }

  it { should be_valid }
  it { should_not be_admin }

  describe "with admin attribute set to 'true'" do
    before do
      @user.save!
      @user.toggle!(:admin)
    end

    it { should be_admin }
  end
  describe "delete links" do

    it { should_not have_link('delete') }

    describe "as an admin user" do
      let(:admin) { FactoryGirl.create(:admin) }
       before do
        sign_in admin
        visit students1_path
       end

       it { should have_link('delete', href: students1_path(User.first)) }
       it "should be able to delete another student" do
         expect do
           click_link('delete', match: :first)
         end.to change(User, :count).by(-1)
       end
       it { should_not have_link('delete', href: user_path(admin)) }
    end
  end
=end
end
