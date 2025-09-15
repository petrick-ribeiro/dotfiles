if status is-interactive
  # Commands to run in interactive sessions can go here
  set fish_greeting
  # set fish_cursor_default underscore
  # fastfetch 
  nvm use lts
  neofetch
  starship init fish --print-full-init | sed 's/"$(commandline)"/(commandline | string collect)/' | source 

  #######################################
	# $PATH
  #######################################
  # Kitty
  # set -gx PATH $PATH $HOME/.local/kitty.app/bin/
  # alias kdev='kitty --session dev_session.conf'

  alias pamcan pacman
  alias ls 'eza --icons'
  alias clear "printf '\033[2J\033[3J\033[1;1H'"
  alias q 'qs -c ii'

  # Walk
  set -gx WALK_EDITOR /usr/local/bin/nvim

  # Rust
  set -gx PATH $PATH $HOME/.cargo/bin/

  # JS
  # set -gx NPM_CONFIG_PREFIX $HOME/.npm-global
  set -gx NVM_DIR $HOME/.nvm
  set -gx PNPM_HOME $HOME/.local/share/pnpm

  # GO
  set -gx PATH $PATH /usr/local/go/bin/
  set -gx PATH $PATH $HOME/go/bin/
  set -gx GOPATH $HOME/go/
  set -gx GOROOT /usr/local/go/

  # Java
  set -gx JAVA_HOME /usr/lib/jvm/java-24-openjdk/
  set -gx PATH $PATH $JAVA_HOME/bin/
  # set -gx M2_HOME /opt/maven
  # set -gx PATH $PATH $M2_HOME/bin

  # K8s
  # set -gx PATH $PATH $HOME/.krew/bin

  #######################################
	# ALIASES
  #######################################
  # Aliases
  alias lg=lazygit
  alias v=vagrant
  alias tb='nc termbin.com 9999'
  alias tf=terraform
  alias pn=pnpm
  alias upgrade='sudo apt-get update && sudo apt-get upgrade'
  # alias k=kubectl
  # alias kd=kind
  # alias mk=minikube
end


#######################################
# FUNCTIONS
#######################################
# Kitty Shell Integration
if set -q KITTY_INSTALLATION_DIR
    set --global KITTY_SHELL_INTEGRATION enabled
    source "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_conf.d/kitty-shell-integration.fish"
    set --prepend fish_complete_path "$KITTY_INSTALLATION_DIR/shell-integration/fish/vendor_completions.d"
end

# Walk function
# function lk
#   set loc (walk --icons $argv); and cd $loc;
# end

# PNPM $PATH function
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# Kitty Sessions
function kdev
    # Verify shell args
    if test (count $argv) -ne 1
        echo "USAGE: kdev <project_path>"
        return 1
    end

    # Check if kitty is installed
    if not type -q kitty
      echo "Kitty are not on PATH."
      return 1
    end

    # Set project path and execute Kitty
    set -x PROJECT_PATH $argv[1]
    # nohup kitty --session $HOME/.dotfiles/kitty/dev_session.conf & disown
    kitty --detach --session $HOME/.dotfiles/kitty/dev_session.conf
    kitten notify --icon kitty "[DEV]" Extreme Go Horse mode activated!
    exit
end

fish_add_path /home/bedrigue/.spicetify
