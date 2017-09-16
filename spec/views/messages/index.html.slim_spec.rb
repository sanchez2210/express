require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  let(:message1) { build_stubbed(:message) }
  let(:message2) { build_stubbed(:message) }

  before(:each) do
    assign(:messages, [ message1, message2 ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", text: message1.conversation.title, count: 1
    assert_select "tr>td", text: message1.user.first_name, count: 1
    assert_select "tr>td", text: message1.content, count: 1
    assert_select "tr>td", text: message2.conversation.title, count: 1
    assert_select "tr>td", text: message2.user.first_name, count: 1
    assert_select "tr>td", text: message2.content, count: 1
  end
end
