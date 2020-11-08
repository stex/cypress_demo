RSpec.describe "Likes" do
  let(:current_user) { create(:user) }

  context "when I already liked a post" do
    let!(:post) { create(:post, liking_users: [current_user]) }

    before(:each) do
      login(current_user)
      visit(posts_path)
    end

    it "shows a heart icon on the post" do
      expect(find("#post_#{post.id}")).to have_selector("a[title='Remove Like']")
    end

    it "lets me remove the like" do
      find("a[title='Remove Like']").click
      expect(find("#post_#{post.id}")).to have_selector("a[title='Like Post']")
    end
  end
end
