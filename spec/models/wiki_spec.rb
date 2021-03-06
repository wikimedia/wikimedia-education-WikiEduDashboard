require 'rails_helper'

describe Wiki do

  describe "API requests" do
    it "should return the content of a page" do
      VCR.use_cassette "wiki/course_list" do
        response = Wiki.get_page_content('User:RagesossBot/course_ids')
        expect(response).to_not be_empty
      end
    end

    it "should return course info for a certain course" do
      VCR.use_cassette "wiki/course_data" do
        response = Wiki.get_course_info 366
        expect(response["name"]).to eq("Brock University/NUSC 1P10 Professional and Therapeutic Communications (Fall 2014)")
        expect(response["start"]).to eq("2014-08-01")
        expect(response["end"]).to eq("2014-12-31")
      end
    end
  end


  describe "API response parsing" do
    it "should return the list of courses" do
      VCR.use_cassette "wiki/course_list" do
        response = Wiki.get_course_list
        expect(response.count).to eq(38)
      end
    end
  end


  describe "Public methods" do

  end

end