#### rbenv global
- if using an M1 chip: https://github.com/rbenv/ruby-build/issues/1691)
- more M1: https://stackoverflow.com/questions/65487249/getting-a-warning-when-installing-homebrew-on-macos-big-sur-m1-chip
- check your path: https://stackoverflow.com/questions/10940736/rbenv-not-changing-ruby-version

#### cannot read/write
`ls -alrth /Users/myusername/`
`ls -alrth /Users/myusername/.config` check if user has permission, or just root
`sudo chown -R username /path-to-folder`
-R here means recursively.
