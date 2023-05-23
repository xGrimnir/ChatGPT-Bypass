#!/bin/bash

# Explanation:
# 1. Prints the input parameter.
# 2. Sets the API token for OpenAI.
# 3. Calls the OpenAI API with the input parameter as a prompt using curl.
# 4. Extracts the response from the API call and stores it in the response variable.
# 5. Checks if there was an error with the API request and exits if so.
# 6. Extracts the choices from the JSON response using jq and stores them in the choices variable.
# 7. Checks if the JSON response contains any choices and exits if not.
# 8. Extracts the text of each choice from the choices variable and stores it in the output variable.
# 9. Checks if the output variable is empty and exits if so.
# 10. Prints the output variable to stdout.

# Print the input parameter
echo "[+] Input: ${1}"
# Print that we are going to output something
echo "[+] Output:"

# Set the API token for OpenAI
CHATGPT_TOKEN="<YOUR_CHATGPT_TOKEN_FROM_OPENAI.COM>"

# Call the OpenAI API and store the response as a variable
response=$(curl -s https://api.openai.com/v1/completions \
           -H 'Content-Type: application/json' \
           -H "Authorization: Bearer ${CHATGPT_TOKEN}" \
           -d "{\"model\": \"text-davinci-003\", \"prompt\": \"$(echo "${1}" | sed 's/"/\\"/g;s/\\/\\\\/g')\", \"max_tokens\": 4000, \"temperature\": 1.0 }")

# Check if there was an error with the API request and exit if so
if [[ $? -ne 0 ]]; then
  echo "Error: Failed to call OpenAI API."
  exit 1
fi

# Extract the response's choices using `jq` and store them as a variable
choices=$(echo "${response}" | jq -r '.choices')

# Check if the JSON response contains any choices and exit if not
if [[ "$choices" == "null" ]]; then
  echo "Error: Response did not contain any choices."
  exit 1
fi

# Extract the text of each choice, remove leading and trailing white spaces, and store it as a variable
output=$(echo "${choices}" | jq -r '.[].text' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | tr -d '\n')

# Check if the extracted output variable is empty and exit if so
if [[ -z "$output" ]]; then
  echo "Error: OpenAI API call succeeded, but received empty output."
  exit 1
fi

# Print the output to stdout
echo -e " \xE2\x80\xA2  ${output}"
