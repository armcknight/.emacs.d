; custom keybindings, including those to custom functions from emacs.d/functions.el

(global-set-key "\C-ce" 'eshell)
(global-set-key "\C-cc" 'view-in-columns)
(global-set-key "\C-x\M-e" 'eval-buffer) ; in the same vain as C-x C-e is bound to eval-last-sexp
; for going to scratch buffers
(global-set-key "\C-c\C-s\C-n" 'new-scratch-buffer)
(global-set-key "\C-c\C-s\C-s" 'switch-to-scratch-buffer)

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
(global-set-key "\C-c\C-z\C-f" 'neotree-find) ; hold CTRL and press c-z-f (custom-neotree find)
(global-set-key "\C-c\C-z\C-r" 'neotree-refresh) ; hold CTRL and press c-z-r (custom-neotree refresh)

; git[hub] operations
(global-set-key "\C-c\C-p\C-b" 'find-github-pr-web) ; hold CTRL and press c-p-b (custom-pr-browse)
(global-set-key "\C-c\C-p\C-c" 'create-github-pr-web) ; hold CTRL and press c-p-o (custom-pr-create)
(global-set-key "\C-c\C-p\C-nn" 'get-next-pr-number) ; hold CTRL and press c-p-n, then let go of CTRL and press n (custom-pr-number next)
(global-set-key "\C-c\C-r\C-bgh" 'browse-github-repo) ; hold CTRL and press c-r-b, then let go of CTRL and press gh (custom-repo-browse github)

; personal repos
; all keybindings follow the pattern C-c C-r C-p X ("custom repo personal ..."), where X is the first letter of the
; repo name that can distinguish it. for personal website, X is w, for forgery, X is f, etc
(global-set-key "\C-c\C-r\C-pw" 'goto-personal-website) ; hold CTRL and press c-r-p, then let go of CTRL and press w (custom-repo-personal website)
(global-set-key "\C-c\C-r\C-pf" 'goto-forgery) ; hold CTRL and press c-r-p, then let go of CTRL and press f (custom-repo-personal forgery)
(global-set-key "\C-c\C-r\C-pm" 'goto-mtg) ; hold CTRL and press c-r-p, then let go of CTRL and press m (custom-repo-personal mtg)

; sentry repos
; all keybindings follow the pattern C-c C-r C-s X ("custom repo sentry ..."), where X is the first letter of the
; repo name that can distinguish it. for sentry-cocoa, X is c, for sentry-docs, X is d, etc
(global-set-key "\C-c\C-r\C-sd" 'goto-sentry-docs) ; hold CTRL and press c-r-s, then let go of CTRL and press d (custom-repo-sentry docs)
(global-set-key "\C-c\C-r\C-sf" 'goto-sentry-frontend) ; hold CTRL and press c-r-s, then let go of CTRL and press f (custom-repo-sentry frontend)
(global-set-key "\C-c\C-r\C-sc" 'goto-sentry-cocoa) ; hold CTRL and press c-r-s, then let go of CTRL and press c (custom-repo-sentry cocoa)

; makefile automation
(global-set-key "\C-c\M-mi" 'make-init) ; hold CTRL and press c-m-i (custom-make init)
(global-set-key "\C-c\M-mb" 'make-build) ; hold CTRL and press c-m-b (custom-make build)
(global-set-key "\C-c\M-mt" 'make-test) ; hold CTRL and press c-m-t (custom-make test)
(global-set-key "\C-c\M-md" 'make-deploy) ; hold CTRL and press c-m-d (custom-make deploy)
(global-set-key "\C-c\M-ms" 'make-serve) ; hold CTRL and press c-m-s (custom-make serve)
(global-set-key "\C-c\M-me" 'make-endserve) ; hold CTRL and press c-m-e (custom-make endserve)
(global-set-key "\C-c\M-mm" 'open-makefile) ; hold CTRL and press c-m-m (custom-make open)

; website automation
(global-set-key "\C-c\C-n" 'create-new-blog-draft) ; hold CTRL and press c-n (custom-website new blog draft)

; overrides
(global-set-key (kbd "C-x C-b") 'ibuffer) ; previously buffer-menu
