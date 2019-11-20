open http://127.0.0.1:8080/?folder=/Workspace

docker run -it -p 127.0.0.1:8080:8080 -v "${HOME}/.local/share/code-server:/home/coder/.local/share/code-server" -v "$PWD:/Workspace" haozhi/vscode --auth none
