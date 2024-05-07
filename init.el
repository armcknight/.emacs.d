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
(load-file "~/.emacs.d/functions/snippets.el")
(load-file "~/.emacs.d/functions/text_transformation.el")

; use different file for Custom injections instead of this one
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
