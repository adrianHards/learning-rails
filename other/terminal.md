#### Navigation

- `cd ..` change the current working directory to the parent directory
- `cd /` change the current working directory to the root directory of the file system
- `cd -` switch back to the previous working directory that was used before the current one
- `/user/folder/file.py` absolute path, can be used from anywhere
- `user/folder/file.py` relative path
- `more hello.txt | grep 'hello'` displays the contents of the "hello.txt" file, and filters the output to display only the lines that contain the word "hello"
- `find . -name 'example.txt'` there are several things you can do with `find`; here, we're looking for a specific file within the current directory.

#### [Brew](https://mac.install.guide/homebrew/4.html)

- `brew update` (update brew)
- `brew upgrade` (upgrade packages)
- `brew list` (list of packages installed)
- `brew deps --tree --installed` (list packages and dependencies)

#### Previous Commands

- `fn arrow keys` move the cursor to the beginning or end of a line in the terminal
- `history` display a list of commands that have been executed previously in the terminal session
- `!1041` to select one of these commands by its index
- `ctrl r` and start typing a previously used command; type `ctrl r` again to move on to the next suggestion
- `echo $PATH` displays the value of PATH, a list of directories that the operating system searches when you enter a command in the terminal
- `/user/folder/file.py` the absolute path (complete path that specifies the exact location of a file or directory in the file system, starting from the root directory)
- `user/folder/file.py` the relative path (location of a file or directory relative to the current working directory)
- `which pipenv` display the location of an executable file in the system

#### General

absolute path, can be used from anywhere
`user/folder/file.py` relative path
`history`
`!1000` index of command
`ctrl r` keep using it to go backward in history
`echo $PATH`
`which pipenv` where folder of something is
`cd /tmp` good place to play
`vi text.txt`

#### Directory

- `pwd` print current directory
- `open <directory>` to open folder from terminal of target directory
- `ls Desktop` list all contents of `Desktop`
- `ls -a` list with -A flag to see all hidden dotfiles i.e. `.` files
- `ls -l` the -l flag shows us the `long format` of files, that is, their extra information, which we can combine with others flags e.g. `ls -lA`
- `man ls` man is the `manual` command to get help with another command; type `q` when done
- `pipenv --help` sometimes instead of manual we can use the `--help` command

#### Creation

- `touch <filename>` to create a file
- `echo "Git is Awesome" > gitText` to create a file and add text to it in one line
- `rm <filename>` to remove the file
- `cp someFile newFile` to copy a particular file
- `mkdir <directoryname>` to create a directory
- `rmdir <directoryname>` to remove the directory, but if the directory contains files ...
- `rm -r <directoryname>` the switch, `-r` and tells `rm` to recursively remove all files within the directory as well as the directory itself
- `mv newFile ../newFile` move a file to one directory above
- `mv newFile ../someFile` as above, but rename said file to `someFile`
- `mv newFile newerFile` simply rename the file without moving it

#### Node

- `nvm install --lts` (install the latest Long-Term Support (LTS) version of Node.js available through nvm)
- `nvm install 16.15.1` (install a particular version of Node; nvm allows us install and switch between multiple versions of Node.js)
- `nvm alias default 16.15.1` (set default version when you open a new terminal window)
- `nvm use default` (switches to the default version of Node.js that you set with the previous command)

#### Gem

- `gem -v` (version of RubyGems that is currently installed)
- `gem update --system` (updates RubyGems itself to the latest version available)
- `gem list` (lists all of the gems that are currently installed on your system)
- `gem outdated` (lists all of the gems that are currently installed on your system, but have a newer version available)
- `gem update` (updates all of the gems that are currently installed on your system to their latest version)
- `gem update <gemname>` (update a specific gem)

#### Python

- `python3` load a Python REPL
- `exit()` to exit

#### PID

- `lsof -i :3000` list all open connections on port 3000
- `lsof -i | grep ruby` list all open connections with string ruby
- `kill -9 <pid>` send the SIGKILL signal, which forces the process to terminate immediately (last resort)

#### Ruby

- `which ruby` where the Ruby executable is located on your system
- `which -a ruby` where all Ruby executables are located on your system
- `ruby -v` version number of the Ruby interpreter that is currently installed on your system
- `irb` "interactive Ruby" and starts a console session where you can enter Ruby code
- `rbenv install -l` list available versions of Ruby
- `rbenv install <version no.>` install the specified version of Ruby
- `rbenv global <version no.>` set the installed version as the global version
- `gem env home` see location of installed gems
