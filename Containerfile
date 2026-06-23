FROM registry.fedoraproject.org/fedora-toolbox:44


# Add the required label so Toolbx identifies it properly
LABEL com.github.containers.toolbox="true"

# core packages
RUN dnf update -y && \
    \
    dnf install -y \
    curl \
    git \
    git-lfs \
    gcc \
    gnupg \
    podman \
    cmake \
    coreutils \
    stow \
    isync \
    openconnect \
    zip \
    clingo \
    texlive \
    latexmk \
    go \
    nodejs \
    pipx \
    # EMACS
    emacs-pgtk \
    direnv \
    maildir-utils \
    aspell \
    aspell-en \
    aspell-de \
    fira-code-fonts \
    # C
    clang \
    && \
    dnf clean all

RUN go install github.com/x-motemen/ghq@latest

# install rust tooling
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Add .cargo/bin to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

RUN cargo install --git https://github.com/latex-lsp/texlab --locked