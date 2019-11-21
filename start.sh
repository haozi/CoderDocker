open http://127.0.0.1:8080/?folder=/Workspace

docker run -it -p 127.0.0.1:8080:8080 -v "$PWD:/home/coder/project" haozhi/vscode --auth none
