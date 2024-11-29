function qemacs {
  emacs -Q -l "$HOME\.emacs.d\elisp\basic-conf.el" $args    
}

function runqemacs {
  runemacs -Q -l "$HOME\.emacs.d\elisp\basic-conf.el" $args
}