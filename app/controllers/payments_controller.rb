class PaymentsController < ApplicationController
  before_action only: [:check_balance, :request_topay]


  def index
    @res = request_topay
  end

  def request_topay
    require 'json'
    require 'net/http'
    uri = URI('https://sandbox.momodeveloper.mtn.com/collection/v1_0/requesttopay')
    request = Net::HTTP::Post.new(uri.request_uri)
    pay = {
      amount: "5.0",
      currency: "EUR",
      externalId: "6547864",
      payer: {
        partyIdType: "MSISDN",
        partyId: "0977948551"
      },
      payerMessage: "Pay for ticket a",
      payeeNote: "payer note"
    }
    # Request headers
    request['Authorization'] = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSMjU2In0.eyJjbGllbnRJZCI6IjU2OTdmN2JiLWUxNjYtNDdjZi1hMWQwLWRkMjFlN2IxN2ZmMSIsImV4cGlyZXMiOiIyMDIwLTA3LTEwVDAwOjIzOjA5LjA4NSIsInNlc3Npb25JZCI6IjU3MWE1ZDg2LTg1ZGMtNDE4MS1hOGQyLWU1MTVlMGMxYjkxOCJ9.T2nWwcoUqZrkJUvpSXTTRCY99nRzkH6RGLHygeIBg6I2mLGSkk-7kHfoi9QTXEwVroj1buZogtBvEgY8U3Hy7J1FFBmOlUxyRxrDsXWdLKbCXokLvAyM8O-oE-KZZe3skcCRNQFqt1OnaoihqDMHE62X0PEpHKT-LnVjFozfZGuevdFUwWm7nxWmPHXTURnhk_u0CrpTrYyB2M0K55wnkb0zJxmsnzBGOlMX88wLpi1jdTmuAdwcGEf5afOl5s5LrkpUn1hM1KjdGK1jTPxNclY9p02UT3q_2vWzDZ-rkuto_S9sB2pZA4xWXxhBPuLbah8rlR6W2NxtPd5MRYlSJw'
    request['X-Reference-Id'] = 'fc8177d4-b522-434b-a5e3-404e76b7d73b'
    request['X-Target-Environment'] = 'sandbox'
    request['Content-Type'] = 'application/json'
    request['Ocp-Apim-Subscription-Key'] = 'SUBSCRIPTION_KEY'
    # Request body
    request.body = pay.to_json
    #sending request
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
      http.request(request)
    end
    puts response.body
    return response
  end  

  def check_balance
    require 'net/http'
    uri = URI('https://sandbox.momodeveloper.mtn.com/collection/v1_0/account/balance')
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(uri.path)
    request['X-Target-Environment'] = 'sandbox'
    request['Authorization'] = 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSMjU2In0.eyJjbGllbnRJZCI6IjU2OTdmN2JiLWUxNjYtNDdjZi1hMWQwLWRkMjFlN2IxN2ZmMSIsImV4cGlyZXMiOiIyMDIwLTA3LTA5VDIzOjE2OjE4Ljk5OSIsInNlc3Npb25JZCI6ImY5YTIyN2M0LTY2Y2ItNGE4MS1hZTZkLWJlMTBiNTVkOTJlMCJ9.FjrSwDPSoB9ACGzD7qya81vWMu5g7D1jBZqViZ6BSvHStGvnJan5npNtTE8Kpc6b1FTXWw-a7hoMpWBJDqhUtjboA45cMU4T-5-dPOTKCm_sfkEnAzYE8lztksGuNAgppi_sYALkAQM_xaQaDxkDuuNIeQiwumz3R9k1KqP9Er_uRjOmDjCBHAT3wdLoh_k7C6LETdkIMsaS74OO10kcpN5NeATTBqhqOTGImUeMDvuBzvYWym7tYjgnPZ-eVvl-Mzh99NJUpHnEONbYwX9EVCYkZNvMkKrmnDd8PDMDCBgnASudfbeAT7Ax2KAR8xWYMc_ZulfpFY1jNOrivhiTfw'
    request['Ocp-Apim-Subscription-Key'] = 'SUBSCRIPTION_KEY'
    response = https.request(request)
    puts response.code
    puts response.body 
    return response
  end

end






