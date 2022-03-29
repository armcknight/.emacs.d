; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(load-file "~/.emacs.d/appearance.el")
(load-file "~/.emacs.d/packages.el")
(load-file "~/.emacs.d/functions.el")
(load-file "~/.emacs.d/keybindings.el")

; use different file for Custom injections instead of this one
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
