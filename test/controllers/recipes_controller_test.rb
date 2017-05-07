require "test_helper"

describe RecipesController do
  describe "index" do
    it "responds successfully with a page load" do
      get root_path
      must_respond_with :success
    end
  end

  describe "search" do
    it "responds successfully with bogus data" do
      Work.where(category: "album").count.must_be :>, 0
      get albums_path
      must_respond_with :success
    end

    # it "still responds successfully when there are no albums" do
    #   Work.where(category: "album").destroy_all
    #   get albums_path
    #   must_respond_with :success
    # end
  end

  #   describe "album_show" do
  #     it "shows an album that exists" do
  #       work = works(:album)
  #       get work_path(work.id)
  #       must_respond_with :success
  #     end
  #
  #     it "returns a 404 not found status when asked for an album that doesn't exist" do
  #       work_id = Work.where(category: "album").last.id
  #       work_id += 1
  #       get work_path(work_id)
  #       must_respond_with :not_found
  #     end
  #   end

  #   describe "update" do
  #     it "should change the work details" do
  #       work = works(:book)
  #       updated_title = "UpdatedTitle"
  #       updated_creator = "UpdatedCreator"
  #
  #       patch work_path(work.id), work: {id: work.id, title: updated_title, creator: updated_creator, category: work.category, description: work.description, pub_date: work.pub_date}
  #       work = Work.find(work.id)
  #
  #       assert_equal updated_title, work.title
  #       assert_equal updated_creator, work.creator
  #
  #       must_respond_with :redirect
  #       must_redirect_to work_path(work.id)
  #     end
  #
  #     it "responds with bad_request for bogus data" do
  #       work = Work.first
  #       work_data = {
  #         work: {
  #           title: ""
  #         }
  #       }
  #       patch work_path(work), params: work_data
  #       must_respond_with :bad_request
  #       Work.first.title.must_equal work.title
  #     end
#   end
  end
