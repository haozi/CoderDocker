FROM codercom/code-server:v2

ENV NODE_VERSION=12
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash && \
    sudo apt-get install zsh -y && \
    sudo chsh -s /bin/zsh && \
    sudo wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true \

    git config --global alias.co checkout && \
    git config --global alias.br branch && \
    git config --global alias.ci commit && \
    git config --global alias.st status

COPY ./.zshrc /home/coder
RUN sudo ln -s /home/coder/project /Workspcace
RUN sudo chmod -R 777 /Workspcace
