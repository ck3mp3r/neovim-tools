FROM ckemper/neovim-core:snapshot

ARG TARGETPLATFORM=linux/arm64

ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en

# ensure we are doing the following steps as root user
USER root

RUN apk add --update --no-cache \
  curl \
  git \
  go \
  gcc \
  g++ \
  libgcc \
  python3-dev \
  nodejs \
  npm \
  yarn

# ensure we are doing the following as neo user
USER neo

# installing various language servers
RUN yarn global add pyright dockerfile-language-server-nodejs
RUN GO111MODULE=on go get golang.org/x/tools/gopls@latest
RUN ARCH=$( echo $TARGETPLATFORM | cut -d '/' -f 2 ) &&\
  DOWNLOAD_URL=$(curl -s https://api.github.com/repos/hashicorp/terraform-ls/releases/latest | grep 'browser_' | cut -d'"' -f4 | grep 'linux' | grep $ARCH ) &&\
  curl -L -o /tmp/terraform.zip $DOWNLOAD_URL
RUN unzip /tmp/terraform.zip -d $HOME/.local/bin

# adding package manager
RUN git clone --depth=1 https://github.com/wbthomason/packer.nvim $HOME/.config/nvim/pack/packer/start/packer.nvim

# copying configuration in place
COPY neovim/init.vim $XDG_CONFIG_HOME/nvim
COPY neovim/lua $XDG_CONFIG_HOME/nvim/lua

# installing plugin packages
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall' &&\
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# installing various tree-sitter languages
RUN for n in "bash" \
  "dockerfile" \
  "go" \
  "hcl" \
  "java" \
  "javascript" \
  "json" \
  "kotlin" \
  "lua" \
  "python" \
  "yaml"; \
  do nvim --headless -c "TSInstallSync ${n}" -c 'q'; done

# cleaning up after ourselves as root user
USER root
RUN rm -fr /tmp/*

# ensure that we never run as root in the container
USER neo

WORKDIR /work

ENTRYPOINT nvim
