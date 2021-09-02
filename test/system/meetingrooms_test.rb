require "application_system_test_case"

class MeetingroomsTest < ApplicationSystemTestCase
  setup do
    @meetingroom = meetingrooms(:one)
  end

  test "visiting the index" do
    visit meetingrooms_url
    assert_selector "h1", text: "Meetingrooms"
  end

  test "creating a Meetingroom" do
    visit meetingrooms_url
    click_on "Add New Meeting Room"

    fill_in "Capacity", with: @meetingroom.capacity
    fill_in "Name", with: @meetingroom.name
    click_on "Create Meeting Room"

    assert_text "Meeting Room was successfully created"
    click_on "Back"
  end

  test "updating a Meetingroom" do
    visit meetingrooms_url
    click_on "Edit", match: :first

    fill_in "Capacity", with: @meetingroom.capacity
    fill_in "Name", with: @meetingroom.name
    click_on "Update Meetingroom"

    assert_text "Meeting Room was successfully updated"
    click_on "Back"
  end

  test "destroying a Meetingroom" do
    visit meetingrooms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meeting Room was successfully destroyed"
  end
end
