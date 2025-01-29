# AI

Openwebui

docker run -d --network=host -v open-webui:/app/backend/data -e OLLAMA_BASE_URL=http://127.0.0.1:11434 --name open-webui --restart always ghcr.io/open-webui/open-webui:main


## Automatic1111

`Wget -q https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh`

## Ollama

`curl -fsSL https://ollama.com/install.sh | sh`

`Setenv OLLAMA_HOST=0.0.0.0:11434`

ollama pull deepseek-r1:8b


## Torch
pip3 install torch torchvision

##Jupyter Notebook 
pip install notebook

jupyter notebook

##Jupyter Lab
pip install jupyterlab
jupyter lab
