class GptService
  include HTTParty
  base_uri 'https://api.openai.com/v1'

  def initialize(api_key)
    @api_key = api_key
  end

  def get_analysis(prompt)
    self.class.post('/completions',
                    headers: { 'Authorization' => "Bearer #{@api_key}", 'Content-Type' => 'application/json' },
                    body: { model: 'gpt-3.5-turbo', prompt: prompt, max_tokens: 100 }.to_json)
  end
end
