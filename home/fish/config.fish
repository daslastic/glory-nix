set fish_greeting
set -x fish_prompt_pwd_dir_length 50

history merge

fish_vi_key_bindings

set -x FZF_DEFAULT_OPTS '--layout=reverse' '--preview-window=hidden' '--height=100%'
set -x fzf_directory_opts '--bind=ctrl-o:become($EDITOR {} &> /dev/tty)' '--layout=reverse-list' '--preview-window=hidden'
set -x fish_clear 'clear; commandline -f repaint'

bind -M default \cf fzf_cmd
bind -M insert \cf fzf_cmd
bind -M visual \cf fzf_cmd

bind -M insert \cs $fish_clear
bind -M visual \cs $fish_clear
bind -M default \cs $fish_clear

function fzf_cmd
  set -x fzfn (fd . ~ --hidden | fzf $FZF_DEFAULT_OPTS $fzf_directory_opts)
  if test -z $fzfn
    return
  else if test -d $fzfn
    cd $fzfn
  else
    cd $(dirname $fzfn)
    nvim $(basename $fzfn)
  end

  echo -e ""
  fish_prompt
end
