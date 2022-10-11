require 'rails_helper'

RSpec.describe Endpoint, type: :model do
  subject {
    described_class.new(verb: "POST",
                        path: "/endpoints",
                        response: Response.new(
                          code: 200
                        ))
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a verb" do
    subject.verb = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a path" do
    subject.path = nil
    expect(subject).to_not be_valid
  end

  it "is not valid withour a valid verb" do 
    subject.verb = "post"
    expect(subject).to_not be_valid
  end

  it "is not valid withour a valid path" do
    subject.path = "endpoints"
    expect(subject).to_not be_valid
  end

  context "validations" do
    it { should validate_presence_of :verb }
    it { should validate_presence_of :path }
  end
end
