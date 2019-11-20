FROM codercom/code-server:v2

ENV NODE_VERSION=12
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.1/install.sh | bash && \
    sudo apt-get update && sudo apt-get install -y \
      zsh autojump && \
    sudo chsh -s /bin/zsh && \
    sudo wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true \
    apt-get clean

RUN git config --global alias.co checkout && \
    git config --global alias.br branch && \
    git config --global alias.ci commit && \
    git config --global alias.st status && \
    mkdir -p ${HOME}/.local/share && \
    chmod -R 777 ${HOME}/.local/share && \
    sudo chown -R coder:coder ${HOME}/.local ${HOME}/.wget-hsts ${HOME}/.zshrc
RUN mkdir "${HOME}/.npm-packages" && /bin/zsh -c '. ~/.zshrc'
# RUN npm install -g yarn --registry=https://registry.npm.taobao.org
COPY ./.zshrc /home/coder
RUN sudo ln -s ${HOME}/project /Workspcace
RUN sudo chmod -R 777 /Workspcace
