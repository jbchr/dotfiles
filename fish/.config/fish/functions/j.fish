function j --description 'fuzzy jump'

  set -g include  "^$HOME/(\.config|[[:alpha:]])"

  switch (count $argv)
    case 0
      if pwd | grep -q $HOME
        find $HOME -type d ^/dev/null | egrep "$include" | filter | fzf | read dir
      else
        find -type d ^/dev/null | filter | fzf | read dir
      end
    case 1
      if test -d $argv[1]
        find $argv[1] -type d ^/dev/null | filter | fzf | read dir
      else
        find $HOME -type d ^/dev/null | egrep "$include" | filter | fzf -q $argv[1] | read dir
      end
    case 2
      if test -d $argv[1]
        find $argv[1] -type d ^/dev/null | filter | fzf -q $argv[2] | read dir
      else
        find $HOME -type d ^/dev/null | egrep "$include" | filter | egrep "$argv[1]" | fzf -q $argv[2] | read dir
      end
  end
  cd $dir
end