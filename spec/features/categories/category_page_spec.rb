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
      # save_and_open_page
    end

    it 'they should see the number of jobs for that category' do
      company = Company.new(name: 'ESPN')

      Job.create!(title: 'Rodeo Clown',
                  level_of_interest: 87,
                  city: 'Denver',
                  category: @category_1,
                  company: company)


      Job.create!(title: 'Frontend Developer',
                  level_of_interest: 2,
                  city: 'Seattle',
                  category: @category_1,
                  company: company)

      Job.create!(title: 'Backend Developer',
                  level_of_interest: 100,
                  city: 'Portland',
                  category: @category_2,
                  company: company)
                  
      visit categories_path

      expect(page).to have_content("#{@category_1.jobs.count} jobs")
      expect(page).to have_content("#{@category_2.jobs.count} jobs")
    end

    it 'should have a link to create a new category' do
      visit categories_path

      new_category_link_text = 'add new category'

      expect(page).to have_link(new_category_link_text)
    end

    it 'should link to create new category page' do

      visit categories_path

      new_category_link_text = 'add new category'

      click_on new_category_link_text

      expect(current_path).to eq(new_category_path)
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

            fill_in :category_title, with: new_title

            click_on "Create Category"
            expect(current_path).to eq(categories_path)
            expect(page).to have_content(new_title)
          end

          it 'should have a cancel button' do
            visit new_category_path

            cancel_text = 'cancel'

            expect(page).to have_link(cancel_text)

            click_on cancel_text

            expect(current_path).to eq(categories_path)
          end
        end
      end
    end
  end

  context '/categories/show page' do
    describe 'user clicks on an amount of jobs link on categories page' do
      it 'they see all jobs for a specific company' do
        visit categories_path

        click_link(@category_1.title)

        expect(current_path).to eq("/categories/#{@category_1.id}")
      end
      it 'should allow user to create a unique category title' do
        visit categories_path

        click_link(@category_1.title)

        expect(page).to have_content(@category_1.title)
      end
    end
  end
end
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
