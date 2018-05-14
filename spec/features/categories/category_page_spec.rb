require 'rails_helper'

RSpec.describe 'Categories Page' do

  before(:each) do
    @category_1 = Category.create!(title: 'Web Development')
    @category_2 = Category.create!(title: 'Education')
  end

  context 'they visit /categories' do
      it 'should display all categories' do
        visit categories_path

        expect(page).to have_content(@category_1.title)
        expect(page).to have_content(@category_2.title)
      end

      xit 'should have a link to create a new category' do
        visit categories_path

        new_category_link_text = 'add new category'

        expect(page).to have_link(new_category_link_text)
      end
    end
  end

  context '/categories/new' do
    describe 'user creates a new category' do
      describe 'they link from the category index' do
        describe 'they fill in a category title' do
          it 'creates a new category' do
            visit categories_path

            click_on "add new category"

            expect(current_path).to eq(new_category_path)

            new_title = "Health"

            fill_in "category[title]", with: new_title

            click_on "save"

            expect(page).to have_content(new_title)
            expect(page).to have_content(new_body)
          end

          xit 'should have a cancel button' do
            visit new_category_path

            cancel_text = 'cancel'

            expect(page).to have_link(cancel_text)
          end

  #         it 'should only allow user to create a unique category' do
  #           visit new_categorys_path
  #
  #           fill_in 'Name:' with: 'Education'
  #
  #           expect
  #         end
  #       end
  #     end
  #   end
  # end
  #
  #
  # context '/categories/show page' do
  #   describe 'user clicks on an amount of jobs link on categories page' do
  #     it 'they see all jobs for a specific company' do
  #       visit categories_path
  #
  #       click_link(@category_1.title)
  #
  #       expect(current_path).to eq("/categories/#{@category_1.id}")
  #     end
  #
  #     it 'they should see the information for that category' do
  #       visit categories_path
  #
  #       click_link(@category_1.title)
  #
  #       expect(page).to have_content(@category_1.title)
  #       expect(page).to have_content(@category_1.body)
  #       expect(page).to_not have_content(@category_2.body)
  #       expect(page).to_not have_content(@category_2.body)
  #     end
  #     it 'should allow user to create a unique category title' do
  #       visit categories_path
  #
  #       click_link(@category_1.title)
  #
  #       expect(page).to have_content(@category_1.title)
  #     end
  #   end
  # end
  #
  #
  # context '/categories/:id/edit' do
  #   describe 'user edits a specific category' do
  #     describe 'they link the edit link on the show page' do
  #       it 'displays the edit page to allow user to make and view changes' do
  #
  #         visit category_path(@category_1)
  #
  #         click_on 'Edit'
  #
  #         expect(current_path).to eq(edit_category_path(@category_1))
  #
  #         current_title = 'New Title 1'
  #         current_body = 'New Body 1'
  #
  #         fill_in 'category[title]', with: current_title
  #         fill_in 'category[body]', with: current_body
  #
  #         # save_and_open_page
  #         click_on 'Update Category'
  #
  #         expect(current_path).to eq(category_path(@category_1))
  #         expect(page).to have_content("Category #{current_title} Updated!")
  #         expect(page).to have_content(current_title)
  #         expect(page).to have_content(current_body)
  #       end
  #     end
  #   end
  # end
