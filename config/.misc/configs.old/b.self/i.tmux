#!/bin/sh
#############
install -d -o "${USER}" -m 0700 "${HOME}/irc" && cd "${HOME}/irc" || exit 1
#############
# cant |grep -i(v) -e '#channel' -e '#channel' filter
# cant |grep -i(v)f filter (impossible to reload the file)
#############
# tail -F NOTICE PRIVMSG SELF | grep -vf ignore && ctrl-c
# tail -F NOTICE PRIVMSG SELF | grep -vf ignore | grep '#channel'
#############
# | fold -w 67
#############

 tmux -S "irc" new-session -ds "irc" "ash /etc/self/d.misc/i.server"

  tmux -S "irc" split-window -hl80% "tail -Fn5 ${HOME}/irc/SENT ${HOME}/irc/NOTICE ${HOME}/irc/PRIVMSG ${HOME}/irc/SELF"
  tmux -S "irc" split-window -vl1
  tmux -S "irc" send-keys "export PS1='> '" C-m

 tmux -S "irc" attach-session

#############

