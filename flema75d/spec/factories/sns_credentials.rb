FactoryBot.define do
  factory :sns_credential do
    provider { "facebook, google_oauth2" }
    uid      { "MyString" }
    user     { nil }
  end
end
