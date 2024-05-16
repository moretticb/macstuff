curl ${OPENAI_API_BASE}/openai/deployments/gpt-4-us/chat/completions?api-version=${OPENAI_API_VERSION}\
  -H "Content-Type: application/json" \
  -H "api-key: ${OPENAI_API_KEY}" \
  -d "{
  \"messages\": [
    {\"role\": \"system\", \"content\": \"You are a helpful assistant\"},
    {\"role\": \"user\", \"content\": [{\"type\":\"text\",\"text\":\"$(cat -)\"}]}
  ]
}" | jq -r ".choices[].message.content"

# Improve chat continuity using the json below and https://learn.microsoft.com/en-us/azure/ai-services/openai/reference
  #-d '{"messages":[{"role":"system","content":"You are a helpful assistant."},{"role":"user","content":[{"type":"text","text":"Describe this picture:"},{ "type": "image_url", "image_url": { "url": "https://learn.microsoft.com/azure/ai-services/computer-vision/media/quickstarts/presentation.png", "detail": "high" } }]}]}'


