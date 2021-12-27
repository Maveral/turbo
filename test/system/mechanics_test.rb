require "application_system_test_case"

class MechanicsTest < ApplicationSystemTestCase
  setup do
    @mechanic = mechanics(:one)
  end

  test "visiting the index" do
    visit mechanics_url
    assert_selector "h1", text: "Mechanics"
  end

  test "creating a Mechanic" do
    visit mechanics_url
    click_on "New Mechanic"

    fill_in "Age", with: @mechanic.age
    fill_in "Experience", with: @mechanic.experience
    fill_in "Name", with: @mechanic.name
    fill_in "Surname", with: @mechanic.surname
    click_on "Create Mechanic"

    assert_text "Mechanic was successfully created"
    click_on "Back"
  end

  test "updating a Mechanic" do
    visit mechanics_url
    click_on "Edit", match: :first

    fill_in "Age", with: @mechanic.age
    fill_in "Experience", with: @mechanic.experience
    fill_in "Name", with: @mechanic.name
    fill_in "Surname", with: @mechanic.surname
    click_on "Update Mechanic"

    assert_text "Mechanic was successfully updated"
    click_on "Back"
  end

  test "destroying a Mechanic" do
    visit mechanics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mechanic was successfully destroyed"
  end
end
