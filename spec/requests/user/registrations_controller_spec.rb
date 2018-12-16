require 'rails_helper'

describe 'Registration pages', type: :request do
  describe '/users/edit' do
    let(:user) { create(:user) }

    context 'Edit fields' do
      before do
        login_as(user, :scope => :user)
        # visit edit_user_registration_path
        visit '/users/edit'
      end

      it 'should update successfully' do
        # expect(page).to have_text("Unhappy?")
        attach_file 'Avatar', 'spec/support/images/squirrel.jpg'
        fill_in 'user_email', with: 'email@example.com'
        fill_in 'Password', with: 'password1234'
        fill_in 'Password confirmation', with: 'password1234'
        fill_in 'Current password', with: 'password123'
        click 'Update'
        expect(page).to have_content 'Your account has been updated successfully.'
      end
    end
  end
end
