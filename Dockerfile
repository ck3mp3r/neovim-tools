FROM ckemper/neovim-core:latest

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
  htop \
  libgcc \
  python3-dev \
  nodejs \
  npm \
  yarn

# ensure we are doing the following as neo user
USER neo

# RUN uname -m
# RUN ARCH=$( uname -m ) &&\
#   DOWNLOAD_URL=$(curl -s https://api.github.com/repos/hashicorp/terraform-ls/releases/latest | grep 'browser_' | cut -d'"' -f4 | grep 'linux' | grep $ARCH ) &&\
#   curl -L -o /tmp/terraform.zip $DOWNLOAD_URL
# RUN unzip /tmp/terraform.zip -d $HOME/.local/bin

# adding package manager
# RUN git clone --depth=1 https://github.com/wbthomason/packer.nvim $HOME/.config/nvim/pack/packer/start/packer.nvim

# copying configuration in place
COPY lua $XDG_CONFIG_HOME/nvim/lua
COPY init.lua $XDG_CONFIG_HOME/nvim/
COPY config.lua.example $XDG_CONFIG_HOME/nvim/config.lua

# installing plugin packages, running it twice due to random fetching fialures... don't ask...
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'
RUN nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

# # # installing various tree-sitter languages
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

# # # installing various tree-sitter languages
RUN for n in "bashls" \
  "dockerls" \
  "gopls" \
  "jsonnet_ls" \
  "jsonls" \
  # "sumneko_lua" \ not supported on arm64 for alpine... yet
  "yamlls"; \
  do nvim --headless -c "LspInstall --sync ${n}" -c 'q'; done

# cleaning up after ourselves as root user
USER root
RUN rm -fr /tmp/*

ENV PATH=$PATH:$HOME/go:$HOME/.local/bin
# ensure that we never run as root in the container
# USER neo

WORKDIR /work

ENTRYPOINT nvim
