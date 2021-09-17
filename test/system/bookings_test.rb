require "application_system_test_case"

class BookingsTest < ApplicationSystemTestCase
  setup do
    @booking = bookings(:one)
  end

  test "visiting the index" do
    visit bookings_url
    assert_selector "h1", text: "Bookings"
  end

  test "creating a Booking" do
    visit bookings_url
    click_on "New Booking"

    fill_in "Meetingroom", with: @booking.meetingroom_id
    fill_in "Pax", with: @booking.pax
    fill_in "Time end", with: @booking.end_time
    fill_in "Time start", with: @booking.start_time
    fill_in "Title", with: @booking.title
    fill_in "User", with: @booking.admin_id
    click_on "Create Booking"
    click_on "Back"
    assert_text "Booking was successfully created"
  end

  test "updating a Booking" do
    visit bookings_url
    click_on "Edit", match: :first

    fill_in "Meetingroom", with: @booking.meetingroom_id
    fill_in "Pax", with: @booking.pax
    fill_in "Time end", with: @booking.end_time
    fill_in "Time start", with: @booking.start_time
    fill_in "Title", with: @booking.title
    fill_in "User", with: @booking.admin_id
    click_on "Update Booking"

    assert_text "Booking was successfully updated"
    click_on "Back"
  end

  test "destroying a Booking" do
    visit bookings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Booking was successfully destroyed"
  end
end
