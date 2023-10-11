if status is-interactive
  # Commands to run in interactive sessions can go here
  set fish_greeting
  neofetch 
  starship init fish | source

  # Kitty
  # set -gx PATH $PATH $HOME/.local/kitty.app/bin/

  # Walk
  set -gx WALK_EDITOR /usr/local/bin/nvim

  #Rust
  set -gx PATH $PATH $HOME/.cargo/bin/

  # GO
  set -gx PATH $PATH /usr/local/go/bin/
  set -gx PATH $PATH $HOME/go/bin/
  set -gx GOPATH $HOME/go/
  set -gx GOROOT /usr/local/go/

  # Java
  set -gx JAVA_HOME /usr/lib/jvm/java-17-openjdk-amd64
  set -gx M2_HOME /opt/maven
  set -gx PATH $PATH $JAVA_HOME/bin/
  set -gx PATH $PATH $M2_HOME/bin

  # K8s
  # set -gx PATH $PATH $HOME/.krew/bin

  # Aliases
  # alias k=kubectl
  # alias kd=kind
  alias lg=lazygit
  # alias mk=minikube
  alias v=vagrant
  alias tb='nc termbin.com 9999'
  alias tf=terraform
end

# Kitty Shell Integration
if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end

# Walk function
function lk
  set loc (walk --icons $argv); and cd $loc;
end
