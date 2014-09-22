require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if Twilio gives an error" do
    message = Message.new(:body => 'hi', :to => '1111', :from => '6502488826')
   expect(message.save).to be_falsey
  end

  it "adds an error if the number is invalid" do
    message = Message.new(:body => 'hi', :to => '1111', :from => '6502488826')
    message.save
    expect(message.errors[:base]).to eq ["The 'From' number 6502488826 is not a valid phone number or shortcode."]
  end
end

