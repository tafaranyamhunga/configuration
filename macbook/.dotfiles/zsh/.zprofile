# >>>>>> Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# >>>>>> Setup NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# >>>>>> Ruby
if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# >>>>>> Pass
PASSWORD_STORE_ENABLE_EXTENSIONS=true
PASSWORD_STORE_EXTENSIONS_DIR=/opt/homebrew/lib/password-store/extensions

# >>>>>> Flutter
export PATH="$HOME/develop/flutter/bin:$PATH"
