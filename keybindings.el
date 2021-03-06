; custom keybindings, including those to custom functions from emacs.d/functions.el

(global-set-key "\C-ce" 'eshell)
(global-set-key "\C-cc" 'view-in-columns)
(global-set-key "\C-x\M-e" 'eval-buffer) ; in the same vain as C-x C-e is bound to eval-last-sexp

; coding-specific
(global-set-key "\C-c\C-o\C-s\C-c" 'open-repo-sentry-cocoa) ; hold CTRL and press c-o-s-c (custom-open-sentry-cocoa)
(global-set-key "\C-c\C-p\C-o" 'open-github-pr) ; hold CTRL and press c-p-o (custom-pr-open)

; working with the emacs customization files
(global-set-key "\C-c\C-ii" 'edit-init-file)
(global-set-key "\C-c\C-if" 'edit-functions)
(global-set-key "\C-c\C-ik" 'edit-keybindings)
(global-set-key "\C-c\C-ip" 'edit-packages)
(global-set-key "\C-c\C-ia" 'edit-appearance)
(global-set-key "\C-c\C-ie" 'edit-file-editing)

; ace-window and windmove keybindings
(global-set-key "\M-o" 'ace-window)
(global-set-key (kbd "\C-c <up>") 'windmove-up)
(global-set-key (kbd "\C-c <down>") 'windmove-down)
(global-set-key (kbd "\C-c <left>") 'windmove-left)
(global-set-key (kbd "\C-c <right>") 'windmove-right)

; git operations
(global-set-key "\C-c\C-gp" 'open-github-pr-web)

; overrides
(global-set-key (kbd "C-x C-b") 'ibuffer) ; previously buffer-menu
