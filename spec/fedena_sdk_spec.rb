require 'spec_helper'

describe FedenaSdk do
  it 'has a version number' do
    expect(FedenaSdk::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(true).to eq(true)
  end

  it '.authenticate' do
    client = FedenaSdk.authenticate do |config| 
     config.client_id = ENV['FEDENA_SDK_CLIENT_ID'] 
     config.client_secret =  ENV['FEDENA_SDK_CLIENT_SECRET']
     config.uri = ENV['FEDENA_SDK_URI']
     config.redirect_uri =  ENV['FEDENA_SDK_REDIRECT_URI']
    end 

    expect(client).to be_truthy
    authorize_url = client.auth_code.authorize_url(:redirect_uri => ENV['FEDENA_SDK_URI'])
    expect(authorize_url).to be_present
  end

  it '.access_token_from_password' do
    VCR.use_cassette 'access_token', :record => :new_episodes do
      token = FedenaSdk.access_token_from_password(ENV['FEDENA_SDK_USERNAME'],ENV['FEDENA_SDK_PASSWORD'],ENV['FEDENA_SDK_URI'])
      expect(token).to be_a OAuth2::AccessToken
    end
  end

  it 'token from auth auth_code' do
    client = FedenaSdk.authenticate do |config| 
     config.client_id = ENV['FEDENA_SDK_CLIENT_ID'] 
     config.client_secret =  ENV['FEDENA_SDK_CLIENT_SECRET']
     config.uri = ENV['FEDENA_SDK_URI']
     config.redirect_uri =  ENV['FEDENA_SDK_REDIRECT_URI']
    end 
    auth_code = "test"
    VCR.use_cassette 'access_token_from_auth_code', :record => :new_episodes do
      token = client.auth_code.get_token(auth_code,{:redirect_uri => ENV['FEDENA_SDK_URI']},:header_format=>"Token token=\"%s\"")
      expect(token).to be_a OAuth2::AccessToken
    end
  end
end
