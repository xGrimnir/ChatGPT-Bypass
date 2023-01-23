# ChatGPT-Bypass

Simple Scripts that allows you to bypass content filtering. This calls the OpenAI autocompletion API for DaVinci-003. Click bait-y for CHATGPT, but we won't get into CHATGPT vs DaVinci here. 

<b> Youtube Video </b>

[![IMAGE ALT TEXT](http://img.youtube.com/vi/4caOdVqs0tU/0.jpg)](http://www.youtube.com/watch?v=4caOdVqs0tU "Secret Bypass for ChatGPT Filters")

<!-- Requirements -->

## Requirements

<b>Export API Key </b>

Head over to 'beta.openai.com' to retrieve your personal API key and set it the variable CHATGPT_TOKEN...or hard code the key. idc

Windows:

````
$env:CHATGPT_TOKEN='<api key>'
````

Nix/MAC:

````
export CHATGPT_TOKEN=<api key>
````
<b>Install jq </b>

Mac:

````
brew install jq
````

Debian:

````
apt install jq
````
