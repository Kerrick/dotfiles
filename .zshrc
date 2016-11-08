###########
# EXPORTS #
###########

  # rbenv
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"

  # node
  export PATH="$HOME/.node/bin:$PATH"

  # Miscellaneous
  export GPGKEY=06DFCD97
  export SHELL=/usr/bin/zsh
  export PATH="/Applications/teeclc:$PATH"
  export PATH="/usr/local/share/npm/bin:$PATH"


###########
# ALIASES #
###########

  # Instead of deciding to
  # Fix tmux and vim 256 color schemes not playing nicely
  alias tmux="TERM=screen-256color-bce tmux"
  # I'm going to just always pretend I'm on a 16-color TTY.
  #alias tmux="TERM=xterm tmux"

  # Sublime Text
  alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

  # Elinks development version because 0.11.x has a bug on OS X Lion
  alias elinks="/usr/local/Cellar/elinks/0.12pre6/bin/elinks"

  # Open Google Chrome on OS X with --disable-web-security flag set.
  alias unsafe-chrome="open -a Google\ Chrome --args --disable-web-security"

  # Syntax Highlighting the Clipboard
  function highlight() { export LC_CTYPE=UTF-8; pbpaste | /usr/local/bin/pygmentize -l "$@" -f rtf -O style=monokai | pbcopy -Prefer rtf; }

  # Atlassian SourceTree
  alias stree="/Applications/SourceTree.app/Contents/Resources/stree"

  # White Noise
  alias spaceship="play -c2 -n synth whitenoise band -n 100 24 band -n 300 100 gain +20"


###########
# PROMPTS #
###########

  # Set up
  autoload -U promptinit && promptinit
  autoload -U colors && colors
  autoload -U vcs_info && zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git*' formats '(%b)'
  zstyle ':vcs_info:git*' actionformats '(%b|%a)'
  setopt prompt_subst

  # Username, hostname, etc.
  function __prompt_identity() {
    local identity
  
    if (( $UID == 0 )); then
    identity=$identity'%{$fg[red]%}%n%{$reset_color%}' # root
    else
    identity=$identity'%{$fg[green]%}%n%{$reset_color%}' # user
    fi
  
    identity=$identity'%{$fg[black]%}@%{$reset_color%}' # @
    identity=$identity'%{$fg[cyan]%}%M%{$reset_color%}' # hostname.tld
    identity=$identity'%{$fg[black]%}:%{$reset_color%}' # :
    identity=$identity'%{$fg[blue]%}%~%{$reset_color%}' # ~/path/to/pwd
  
    echo $identity
  }
  
  # Prompt character
  function __prompt_character() {
    local promptchar
    local promptcharstart='%(?.%{$fg[white]%}.%{$fg[red]%})'
    local promptcharend='%{$reset_color%}'

    promptchar='%#'
    promptchar='❯'
    #promptchar='🚁 '
    if [ $UID -eq 0 ]; then
      promptchar='#'
    fi
    # For some reason this only changes the character if you start a new shell.
    #if [ -d .git ] || git rev-parse --git-dir >/dev/null 2>&1; then
    #  promptchar='±'
    #fi
    echo $promptcharstart$promptchar$promptcharend
  }

  # Ruby via rbenv
  function __ruby_version() {
    local ruby_version
    ruby_version=$ruby_version'%{$fg[magenta]%}[ruby '
    if command -v rbenv >/dev/null; then
      ruby_version=$ruby_version'$(rbenv version | cut -d " " -f1 | cut -d "-" -f1)'
    else
      ruby_version=$ruby_version'rbenv not found'
    fi
    ruby_version=$ruby_version']%{$reset_color%}'
    echo $ruby_version
  }

  # Actually set the prompt
  precmd() {
    vcs_info
    print -P "\n$(__prompt_identity) %{$fg[yellow]%}$vcs_info_msg_0_%{$reset_color%}"
  }
  PROMPT="$(__prompt_character) "
  #RPROMPT="$(__ruby_version)"

###########
# PLUGINS #
###########

  # completions
  plugins+=(zsh-completions)
  autoload -U compinit && compinit


# recommended by brew doctor
#export PATH='/usr/local/bin:/Users/kerrick/.rbenv/shims:/Users/kerrick/.rbenv/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/kerrick/.rbenv/shims'

# DO NOT EDIT BELOW THIS LINE

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.bin:$PATH"

# added by travis gem
[ -f /Users/kerrick/.travis/travis.sh ] && source /Users/kerrick/.travis/travis.sh
