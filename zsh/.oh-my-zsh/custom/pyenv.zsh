# Only load pyenv-specific config when it's installed
if command -v pyenv &> /dev/null
then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
