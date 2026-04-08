; Emacs 29 removed linum-mode; shim the variable so old packages don't error.
; Needed by: git-gutter-20220423.1704
; Can remove once git-gutter is upgraded to a version that uses bound-and-true-p.
(defvar global-linum-mode nil)

; The `compat` package backports functions from newer Emacs versions for
; packages that need to support older Emacs. On Emacs 30+, all of those
; functions are already built in, but package activation doesn't add the
; compat directory to load-path (since it's redundant). Older package
; bytecode still does (require 'compat-26) etc. explicitly, so we provide
; those features as no-ops to prevent load errors.
; Needed by: magit-20260408.646, git-commit-20220506.1936, git-gutter-20220423.1704
; Can remove once all packages are upgraded to versions that don't require compat-2x separately.
(provide 'compat-26)
(provide 'compat-27)
(provide 'compat-28)
(provide 'compat-29)

(load-file "~/.emacs.d/appearance.el")
(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/keybindings.el")
(load-file "~/.emacs.d/file_editing.el")

(load-file "~/.emacs.d/functions/config.el")
(load-file "~/.emacs.d/functions/display.el")
(load-file "~/.emacs.d/functions/emacs.el")
(load-file "~/.emacs.d/functions/git.el")
(load-file "~/.emacs.d/functions/makefile.el")
(load-file "~/.emacs.d/functions/sentry_repos.el")
(load-file "~/.emacs.d/functions/personal_repos.el")
(load-file "~/.emacs.d/functions/snippets.el")
(load-file "~/.emacs.d/functions/text_transformation.el")

; use different file for Custom injections instead of this one
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
