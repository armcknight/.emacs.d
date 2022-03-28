; custom keybindings, including those to custom functions from emacs.d/functions.el

(global-set-key "\C-ce" 'eshell)
(global-set-key "\C-cc" 'view-in-columns)

; working with the emacs customization files
(global-set-key "\C-ci" 'edit-init-file)
(global-set-key "\C-cs" 'sync-current-configuration)
(global-set-key "\C-cu" 'update-configuration)

; ace-window and windmove keybindings
(global-set-key "\M-o" 'ace-window)
(global-set-key (kbd "\C-c <up>") 'windmove-up)
(global-set-key (kbd "\C-c <down>") 'windmove-down)
(global-set-key (kbd "\C-c <left>") 'windmove-left)
(global-set-key (kbd "\C-c <right>") 'windmove-right)
