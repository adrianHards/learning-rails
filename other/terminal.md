#### [Brew](https://mac.install.guide/homebrew/4.html)
`brew update` (update brew) <br>
`brew upgrade` (upgrade packages) <br>
`brew list` (list of packages installed) <br>
`brew deps --tree --installed` (list packages and dependencies) <br>

#### Directory
`pwd` print current directory <br>
`open <directory>` to open folder from terminal of target directory

#### Node
`nvm install --lts` (install the latest Long-Term Support (LTS) version of Node.js available through nvm) <br>
`nvm install 16.15.1` (install a particular version of Node; nvm allows us install and switch between multiple versions of Node.js) <br>
`nvm alias default 16.15.1` (set default version when you open a new terminal window) <br>
`nvm use default` (switches to the default version of Node.js that you set with the previous command) <br>

#### Gem
`gem -v` (version of RubyGems that is currently installed) <br>
`gem update --system` (updates RubyGems itself to the latest version available) <br>
`gem list` (lists all of the gems that are currently installed on your system) <br>
`gem outdated` (lists all of the gems that are currently installed on your system, but have a newer version available) <br>
`gem update` (updates all of the gems that are currently installed on your system to their latest version) <br>
`gem update <gemname>` (update a specific gem)

#### PID
`lsof -i :3000` list all open connections on port 3000
`lsof -i | grep ruby` list all open connections with string ruby
`kill -9 <pid>` send the SIGKILL signal, which forces the process to terminate immediately (last resort)
