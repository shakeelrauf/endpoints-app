require 'rails_helper'

RSpec.describe Response, type: :model do
  subject {
    described_class.new(code: 200,
                        endpoint: Endpoint.new(
                          verb: "POST",
                          path: "/endpoints",
                          ))
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  
  it "is not valid with wrong code" do
    subject.code = nil
    expect(subject).to_not be_valid
  end

  context "validations" do
    it { should validate_presence_of :code }
    it { should belong_to :endpoint }
  end
end
