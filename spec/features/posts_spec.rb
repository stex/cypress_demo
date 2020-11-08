RSpec.describe "Post Creation" do
  let(:current_user) { create(:user) }

  before(:each) do
    login(current_user)
    visit(posts_path)
  end

  it "works" do
    find("h1 a[title='Add Post']").click
    find("#post_title").fill_in(with: "The Happy Beaver Society")
    # find("#post_body").fill_in(with: "Happy Beavers everywhere - ")
    find("button[title=Bold]").click

    # find("#post_body").fill_in(with: "Look Out")

    page.drop_file("#post_body", Rails.root.join("spec", "cypress", "fixtures", "images", "beaver_happy.png"))
    sleep(2)

    find("input[type=submit]").click

    expect(find(".card-header")).to have_text("The Happy Beaver Society")
  end
end
