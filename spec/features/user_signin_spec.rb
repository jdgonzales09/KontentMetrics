require 'rails_helper'

feature "signing in" do
    let(:user) {FactoryGirl.create(:user)}

    def fill_in_signin_fields
        fill_in "user[email]", with: user.email
        fill_in "user[password]", with: user.password
        click_button "Log in"
    end

    scenario "a user sign in from site" do
        visit 'users/sign_in'
        fill_in_signin_fields
        expect(page).to have_content("Signed in successfully")
    end

    scenario "a user cannot sign in with invalid information" do
        visit 'users/sign_in'
        click_button "Log in"
        expect(page).to have_content("Invalid Email or password")
    end
end
