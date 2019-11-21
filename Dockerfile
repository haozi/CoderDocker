FROM codercom/code-server:v2

RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash && sudo apt-get install -y \
    nodejs zsh autojump && \
    sudo apt-get clean && \
    sudo chsh -s /bin/zsh && \
    sudo wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true && \
    sudo npm install -g yarn --registry=https://registry.npm.taobao.org && \
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | sudo -E zsh

COPY ./.zshrc /home/coder
RUN mkdir -p ${HOME}/.local/share && \
    mkdir -p ${HOME}/.cache && \
    sudo chown -R coder:coder ${HOME}/.* && \
    yarn config set registry https://registry.npm.taobao.org && \
    git config --global alias.co checkout && \
    git config --global alias.br branch && \
    git config --global alias.ci commit && \
    git config --global alias.st status && \
    sudo ln -s ${HOME}/project /Workspcace && \
    sudo chmod -R 777 /Workspcace ${HOME}/.cache
CMD ["/bin/zsh"]
