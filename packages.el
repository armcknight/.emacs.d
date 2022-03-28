; configure custom package installation

; configure packages
(require 'package)

; configure package archives
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

; install packages
(setq
 package-selected-packages
 '(magit
   jedi
   git-gutter
   dired-subtree
   switch-window
   terraform-mode
   markdown-mode
   swift-mode
   lsp-mode
   lsp-ui
   company
   lsp-sourcekit
   toml-mode
   ace-window))
(package-refresh-contents)
(package-install-selected-packages)

; configure company-mode
(add-hook 'swift-mode-hook 'company-mode)

; configure lsp-mode
(require 'lsp-mode)
(add-hook 'swift-mode-hook #'lsp-deferred)

; configure lsp-sourcekit
(eval-after-load 'lsp-mode
  (progn
    (require 'lsp-sourcekit)
    (setq lsp-sourcekit-executable
          "/Applications/Xcode12.4/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp")))
(add-hook 'swift-mode-hook (lambda () (lsp)))

; configure dired-subtree
(eval-after-load "dired" '(progn
  (define-key dired-mode-map "i" 'dired-subtree-insert)
  (define-key dired-mode-map ";" 'dired-subtree-remove) ))

; configure jedi
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:install-server)

; configure git-gutter
(add-hook 'python-mode-hook 'git-gutter-mode)
