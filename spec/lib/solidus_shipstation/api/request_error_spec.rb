RSpec.describe SolidusShipstation::Api::RequestError do
  describe '.from_response' do
    it 'extracts the status code, body and headers from the response' do
      response = instance_double(
        'HTTParty::Response',
        code: 500,
        headers: { 'Key' => 'Value' },
        body: '{ "Message": "An error has occured.", "ExceptionMessage": "orders are required", "ExceptionType": "System.ArgumentException" }',
      )

      error = described_class.from_response(response)

      expect(error).to have_attributes(
        response_code: 500,
        response_headers: { 'Key' => 'Value' },
        response_body: '{ "Message": "An error has occured.", "ExceptionMessage": "orders are required", "ExceptionType": "System.ArgumentException" }',
      )
    end
  end
end
