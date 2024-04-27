set fish_greeting
set -x fish_prompt_pwd_dir_length 50

history merge

fish_vi_key_bindings

set -x FZF_DEFAULT_OPTS '--layout=reverse' '--preview-window=hidden' '--height=100%'
set -x fzf_directory_opts '--bind=ctrl-o:become($EDITOR {} &> /dev/tty)' '--layout=reverse-list' '--preview-window=hidden'

bind -M insert \cf fzf_cmd
bind -M visual \cf fzf_cmd
bind -M default \cf fzf_cmd

function fzf_cmd
  set -x fzfn (fd . ~ --hidden | fzf $FZF_DEFAULT_OPTS $fzf_directory_opts)
  if test -d $fzfn
    cd $fzfn
    echo -e ""
    fish_prompt
  else
    cd $(dirname $fzfn)
    nvim $(basename $fzfn)
    echo -e ""
    fish_prompt
  end
end
