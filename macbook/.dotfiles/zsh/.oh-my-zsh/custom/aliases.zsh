# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Environmental Variables

export MySQL=root
export MySQL_PORT=
export MySQL_USER=
export MySQL_PASSWORD=
export MySQL_HOST=
export MySQL_LOCAL_HOST=

export PGSQL=postgres
export PGSQL_PORT=
export PGSQL_USER=
export PGSQL_PASSWORD=
export PGSQL_HOST=
export PGSQL_LOCAL_HOST=
export PGSQL_DB=

export REDIS=
export REDIS_PORT=
export REDIS_PASSWORD=
export REDIS_USER_PASSWORD=
export REDIS_ENDPOINT=

export MongoDB_USER=
export MongoDB_APP=
export MongoDB_PASSWORD=
export MongoDB_HOST=
export MongoDB_PORT=
export MongoDB_CONNECTION_STRING=

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Navigation
alias back="cd -"
alias .="cd"
alias ...="cd ../.."
alias ....="cd ../../.."

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> List files, directories and hidden files
alias ls="colorls"
alias hidden="ls -dA .*"  # Show hidden files

alias md="mkdir -p"
alias rmv="rm -fr"

alias cpfile="copyfile"
alias cppath="copypath"
alias zshrc="code ~/.zshrc"
alias bashrc="code ~/.bashrc"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Permissions        #  usr | group | others
alias x="chmod 764"      # rwx  | rw- | r--
alias x-="chmod 644"     # rw-  | r-- | r--
alias link-soft="sudo ln -s"  # sudo ln -s /path/to/file /path/to/symlink
alias link-hard="sudo ln"  # sudo ln /path/to/file /path/to/hardlink

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Compress, decompress files and directories
alias compress-tar="tar -cvf"
alias compress-gz="tar -cvzf"
alias compress-bz="tar -cvjf"
alias compress-xz="tar -cvJf"

alias decompress-tar="tar -xvf"
alias decompress-gz="tar -xvzf"
alias decompress-bz="tar -xvjf"
alias decompress-xz="tar -xvJf"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Change ownership
alias ch-tafara="sudo chown tafara"
alias ch-root="sudo chown root"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Add user
alias add-user="sudo adduser" # or sudo useradd new_username

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Remove/delete a user, first you can use:
alias rmv-user="sudo userdel"  # username

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Modify the username of a user
alias change-username="usermod -l new_username old_username"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Change the password for a user
alias change-passwd="sudo passwd"   # username

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> To add a user to the sudo group
alias add-sudo="usermod -aG sudo"  # or adduser username sudo

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Convert file to Unix or DOS format
alias dos-unix="dos2unix"
alias unix-dos="unix2dos"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Restart the terminal
alias refresh="source ~/.zshrc"
alias restart="exec \"$SHELL\""

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Virtual Environments

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Python
alias debug="python3 -m pudb.run"
alias create-venv="python3 -m venv .venv"
alias activate-venv="source .venv/bin/activate"

alias requirements="pip3 freeze > requirements.txt"
alias conda-requirements="pip list --format=freeze > requirements.txt"
alias i-requirements="pip3 install -r requirements.txt"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Upgrading pip modules
alias pip-upgrade="uv pip install --upgrade pip"
alias pip-uninstall="uv pip freeze | xargs pip uninstall -y"
alias pip-up-old="uv pip list --outdated | cut -d ' ' -f 1 | xargs -n1 uv pip install -U"
alias pip-up-all="uv pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 uv pip install -U"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Django Project
alias django-project="django-admin startproject"  # name of the project
alias django-server="python3 manage.py runserver"
alias django-app="python3 manage.py startapp"  # name of the app
alias django-migrations="python3 manage.py makemigrations"  # creates a migration file
alias django-migrate="python3 manage.py migrate"  # migrates data into a database
alias django-shell="ptpython manage.py shell"  # Django shell
alias django-superuser="python3 manage.py createsuperuser"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Unit Testing
alias unittest="python3 -m unittest"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Packages list: VS Code
alias code-extensions="code --list-extensions > vscode-extensions.list"
alias i-code-extensions="cat vscode-extensions.list | xargs -L 1 code --install-extension"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Clear Thumbnail Cache
alias clear-history="echo -n > ~/.zsh_history"
alias show-thumbnail="du -sh ~/.cache/thumbnails"
alias clean-thumbnail="rm -rf ~/.cache/thumbnails/*"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PROCESSES | PID
alias process-status="ps auxf | grep"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Ports
alias ports="netstat -tuln"
alias on-port="sudo lsof -i"      # Show which process is listening on port, :port_number

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Using nmap
alias nmap="sudo nmap" # Scan localhost, we can change localhost to any IP address

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> MANAGING SERVICES

# MySQL
alias mysql-restart="brew services restart mysql"
alias mysql-start="brew services start mysql"
alias mysql-stop="brew services stop mysql"
alias mysql-info="brew services info mysql"
alias mysql-kill="brew services kill mysql"

# PostgreSQL
alias pgsql-restart="brew services restart postgresql@18"
alias pgsql-start="brew services start postgresql@18"
alias pgsql-stop="brew services stop postgresql@18"
alias pgsql-info="brew services info postgresql@18"
alias pgsql-kill="brew services kill postgresql@18"

# MongoDB
alias mongodb-restart="brew services restart mongodb-community"
alias mongodb-start="brew services start mongodb-community"
alias mongodb-stop="brew services stop mongodb-community"
alias mongodb-info="brew services info mongodb-community"
alias mongodb-kill="brew services kill mongodb-community"

# Redis
alias redis-restart="brew services restart redis"
alias redis-start="brew services start redis"
alias redis-stop="brew services stop redis"
alias redis-info="brew services info redis"
alias redis-kill="brew services kill redis"

# CouchDB
alias couchdb-restart="brew services restart couchdb"
alias couchdb-start="brew services start couchdb"
alias couchdb-stop="brew services stop couchdb"
alias couchdb-info="brew services info couchdb"
alias couchdb-kill="brew services kill couchdb"

# RabbitMQ
alias rabbitmq-restart="brew services restart rabbitmq"
alias rabbitmq-start="brew services start rabbitmq"
alias rabbitmq-stop="brew services stop rabbitmq"
alias rabbitmq-info="brew services info rabbitmq"
alias rabbitmq-kill="brew services kill rabbitmq"

# Nginx: Stop Apache if it's running to be able to start Nginx
alias nginx-restart="sudo brew services restart nginx"
alias nginx-start="sudo brew services start nginx"
alias nginx-stop="sudo brew services stop nginx"
alias nginx-info="sudo brew services info nginx"
alias nginx-kill="sudo brew services kill nginx"

# Apache / httpd: Stop Nginx if it's running to be able to start Apache
alias apache-restart="brew services restart httpd"
alias apache-start="brew services start httpd"
alias apache-stop="brew services stop httpd"
alias apache-info="brew services info httpd"
alias apache-kill="brew services kill httpd"

alias php-restart="brew services restart php"
alias php-start="brew services start php"
alias php-stop="brew services stop php"
alias php-info="brew services info php"
alias php-kill="brew services kill php"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Vagrant Commands
alias vagrant-remove="vagrant box remove"  # Pass the box name

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Database Shortcuts

# MySQL/MariaDB
alias mysql-root="mycli -u$MySQL -h$MySQL_LOCAL_HOST"
alias mysql-tafara="mycli -u$MySQL_USER -p$MySQL_PASSWORD -h$MySQL_LOCAL_HOST"
alias mysql-backup="mysqldump -u$MySQL_USER -p$MySQL_PASSWORD"  # Pass database name

# Connect and execute a query
alias mysql-query="sudo mysql -h$MySQL_LOCAL_HOST -u$MySQL -p$MySQL_PASSWORD"  # Pass the query in quotes

# PostgreSQL
alias pgsql-tafara="pgcli -U $PGSQL_USER -h $PGSQL_LOCAL_HOST -d $PGSQL_DB -W"
alias pg-backup="pg_dump -U $PGSQL_USER -h $PGSQL_LOCAL_HOST -p $PGSQL_PORT"  # Pass database name

# MongoDB
alias mongo-atlas="mongosh "mongodb+srv://mongodb-01.ntw59k5.mongodb.net/" --apiVersion 1 --username $MongoDB_USER --password $MongoDB_PASSWORD"

# Redis
alias redis="iredis -a $REDIS_PASSWORD"
alias redis-tafara="redis-cli -u redis://$REDIS:$REDIS_USER_PASSWORD@$REDIS_ENDPOINT"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GIT
alias add="git add"
alias all="git add ."
alias log="git log"
alias init="git init"
alias clone="git clone"
alias status="git status"
alias rename="git mv"

	# Commit
alias commit="git commit -m"
alias fix-commit="git commit --amend"

# Logs
alias reflog="git --no-pager reflog"
alias no-pager="git --no-pager log"
alias line-logs="git --no-pager log --oneline"
alias graph-log="git --no-pager log --oneline --graph --all"
alias graph-log-parent="git --no-pager log --oneline --decorate --graph --parents --all"
alias git-cat="git cat-file -p"

# Reset
alias reset="git reset"
alias reset-soft="git reset --soft"
alias reset-hard="git reset --hard"

	# Branches
alias rename-branch="git branch -m"
alias branch="git --no-pager branch"
alias branch-merged="git branch --merged"
alias switch="git switch"
alias mk-branch="git switch -c"

	# Pull conflicts
alias pull-norebase="git pull --no-rebase"
alias push-origin="git push origin main"

	# Merge conflicts
alias merge="git merge"
alias merge-abort="git merge --abort"
alias merge-oneline="git log --merge --oneline"

alias rebase="git rebase"
alias rebase-continue="git rebase --continue"

alias squash="git rebase -i"  # HEAD~n

alias mergetool="git mergetool"
alias checkout-ours="git checkout --ours"
alias checkout-theirs="git checkout --theirs"

	# Revert
alias revert="git revert"

	# Cherry-pick
alias cherry-pick="git cherry-pick"

	# Bisect
alias bisect="git bisect"
alias bisect-start="git bisect start"
alias bisect-good="git bisect good"
alias bisect-bad="git bisect bad"
alias bisect-reset="git bisect reset"

	# Stash
alias stash="git stash"

	# Stash with untracked files
alias stash-u="git stash -u"
alias stash-untracked="git stash --include-untracked"

	# Stash list
alias stash-list="git --no-pager stash list"
alias stash-clear="git stash clear"
alias stash-pop="git stash pop"
alias stash-apply="git stash apply"
alias stash-push="git stash push -m"
alias stash-drop="git stash drop"

	# Obtain Stash Commit Hash
# alias stash-obtain="gitk --all $( git fsck --no-reflog | awk '/dangling commit/ {print $3}' )"

	# Show the tracked files in the stash: n = index
alias show-tracked="git show -p stash@{n}"

	# Show the untracked files in the stash
alias show-untracked="git show stash@{n}^3"

	# Push
alias push="git push"
alias push-branch="git push -u origin"
alias push-force="git push origin main --force"
alias push-ready="git --no-pager diff --stat --staged"

# Pull
alias pull="git pull"
alias pull-main="git pull origin main"  # Pull from main branch
alias pull-branch="git pull origin"  # Pass the branch name

# Fetch
alias fetch="git fetch origin"

# Delete
alias del-branch="git branch -D"
alias del-branch-remote="git push origin --delete"

# Delete committed and pushed: After deleting, commit and force-push
alias unstage="git restore --staged"  # Remove file from remote repo, but keeps it locally
alias del-file="git rm"
alias del-dir="git rm -r"
alias force-push="git push --force -u origin main"

# Set username and email address
alias name="git config --global user.name"
alias email="git config --global user.email"
alias git-list="git --no-pager config --list"

# Track large files
alias large-files="git lfs track"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> LAZYGIT
alias lazy="lazygit"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Ansible
alias playbook="ansible-playbook"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> VS Code Shortcuts
alias showkeys="code ~/Library/Application\ Support/Code/User/keybindings.json"
alias settings="code ~/Library/Application\ Support/Code/User/settings.json"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Snippets Config
alias snippets-c="code ~/Library/Application\ Support/Code/User/snippets/c.json"
alias snippets-fsharp="code ~/Library/Application\ Support/Code/User/snippets/fsharp.json"
alias snippets-groovy="code ~/Library/Application\ Support/Code/User/snippets/groovy.json"
alias snippets-html="code ~/Library/Application\ Support/Code/User/snippets/html.json"
alias snippets-js="code ~/Library/Application\ Support/Code/User/snippets/javascript.json"
alias snippets-lua="code ~/Library/Application\ Support/Code/User/snippets/lua.json"
alias snippets-perl="code ~/Library/Application\ Support/Code/User/snippets/perl.json"
alias snippets-php="code ~/Library/Application\ Support/Code/User/snippets/php.json"
alias snippets-text="code ~/Library/Application\ Support/Code/User/snippets/plaintext.json"
alias snippets-ts="code ~/Library/Application\ Support/Code/User/snippets/typescript.json"
alias snippets-pwsh="code ~/Library/Application\ Support/Code/User/snippets/powershell.json"
alias snippets-py="code ~/Library/Application\ Support/Code/User/snippets/python.json"
alias snippets-rb="code ~/Library/Application\ Support/Code/User/snippets/ruby.json"
alias snippets-sh="code ~/Library/Application\ Support/Code/User/snippets/shellscript.json"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> GNU stow
alias stow-test="stow -nvt ~"  # Pass the directory name
alias stow-run="stow -vt ~"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Adopts/copies existing files
alias stow-adopt="stow --adopt -nvt ~"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Unstow, remove symlinks
alias unstow="stow -Dvt ~"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Redis
alias redis="iredis"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> SQLite
alias sqlite="litecli"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> C
alias compile="gcc -Wall -Wextra -pedantic -ggdb3"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> PYTHON
alias list="pip3 list"
alias py-package="pip3 show"
alias repl="bpython"
alias pyshell="ptpython"
alias pycode="pycodestyle"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> JavaScript
alias js-style="semistandard"
alias js-fix="semistandard --fix"
alias npx-style="npx eslint"
alias npx-fix="npx eslint --fix"
alias prettier="npx prettier --check"
alias prettier-fix="npx prettier --write"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> JSON tools
alias jsonify="jq ."
alias json="rich --json"
alias valid-json="jq empty"  # Check if JSON is valid
alias py-json="python3 -m json.tool"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> CSV tools: Print CSV files in a table format
alias csv="rich --csv"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Convert chm, epub to pdf
alias to-pdf="ebook-convert"

# >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Text tools
alias get-txt="pandoc -t plain -o"  # Download webpage as text and save it to a file name
