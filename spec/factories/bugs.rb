FactoryBot.define do
  factory :bug do
    b_Title { "MyString" }
    b_type { "bug" }
    status {"newly"}
    b_deadline { Date.today }
    project_id { 2 }
    user_id { 3 }

  end
end
