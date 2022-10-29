; custom keybindings, including those to custom functions from emacs.d/functions.el

(global-set-key "\C-ce" 'eshell)
(global-set-key "\C-cc" 'view-in-columns)
(global-set-key "\C-x\M-e" 'eval-buffer) ; in the same vain as C-x C-e is bound to eval-last-sexp

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

; neotree
(global-set-key "\C-c\C-z\C-f" 'neotree-find)
(global-set-key "\C-c\C-z\C-r" 'neotree-refresh)

; git[hub] operations
(global-set-key "\C-c\C-gp" 'find-github-pr-web)
(global-set-key "\C-c\C-p\C-o" 'create-github-pr-web) ; hold CTRL and press c-p-o (custom-pr-open)
(global-set-key "\C-c\C-c\C-p" 'get-next-pr-number) ; hold CTRL and press c-p-r (custom-custom-pr)
(global-set-key "\C-c\C-g\C-b" 'browse-github-repo); hold CTRL and press c-g-b (custom-github-browse)

; automation
(global-set-key "\C-c\M-mi" 'make-init)
(global-set-key "\C-c\M-mb" 'make-build)
(global-set-key "\C-c\M-mt" 'make-test)
(global-set-key "\C-c\M-md" 'make-deploy)
(global-set-key "\C-c\M-ms" 'make-serve)
(global-set-key "\C-c\M-me" 'make-endserve)
(global-set-key "\C-c\M-mm" 'open-makefile)


; overrides
(global-set-key (kbd "C-x C-b") 'ibuffer) ; previously buffer-menu
