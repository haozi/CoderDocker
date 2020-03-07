open http://127.0.0.1:8080/

docker run -it -p :8080:8080 -v "$PWD:/workspace" haozhi/vscode
