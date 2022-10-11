FactoryBot.define do
  factory :endpoint do
    verb { ["GET", "PUT", "POST", "PATCH", "DELETE", "HEAD", "CONNECT", "OPTIONS", "TRACE"][Kernel.rand(4)] }
    path { "/hello"  }
    association :response, factory: :response, strategy: :build
  end
  factory :response do
    code { 200 }
    headers {{}}
    body {"\"{ \"message\": \"Hello, world\" }\""}
  end
end