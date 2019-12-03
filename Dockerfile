FROM codercom/code-server:v2
ARG HOME='/home/coder'

RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash && \
    sudo apt-get install -y nodejs zsh autojump && \
    sudo DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata && \
    sudo ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    sudo apt-get clean && \
    sudo chsh -s /bin/zsh && \
    curl -sL  https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sudo -E bash || true && \
    sudo npm install -g yarn --registry=https://registry.npm.taobao.org && \
    curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash

COPY ./.zshrc $HOME/.zshrc
COPY ./code-server/User/settings.json $HOME/.local/share/code-server/User/settings.json
COPY ./code-server/User/keybindings.json $HOME/.local/share/code-server/User/keybindings.json
COPY ./code-server/languagepacks.json $HOME/.local/share/code-server/languagepacks.json

RUN mkdir -p $HOME/.local/share && \
    mkdir -p $HOME/.cache && \
    sudo chown -R coder:coder $HOME/.* && \
    yarn config set registry https://registry.npm.taobao.org && \
    git config --global alias.co checkout && \
    git config --global alias.br branch && \
    git config --global alias.ci commit && \
    git config --global alias.st status && \
    sudo ln -s $HOME/project /Workspace && \
    sudo chmod -R 777 /Workspace $HOME/.cache

CMD ['/bin/zsh']
