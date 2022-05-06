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
 '(dired-subtree ; dired minor mode to expand directory contents inline
   treemacs ; project navigators as left sidebars
   ace-window ; window-chooser that assigns each window a numerical index

   ; git modes
   magit ; git major-mode
   git-gutter ; git minor mode for buffers

   ; autocompletion modes
   jedi
   lsp-mode
   lsp-ui
   company
   lsp-sourcekit

   ; programming language modes
   terraform-mode
   markdown-mode
   swift-mode
   toml-mode))
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
          "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp")))
(add-hook 'swift-mode-hook (lambda () (lsp)))

; configure dired-subtree
(eval-after-load "dired" '(progn
  (define-key dired-mode-map "i" 'dired-subtree-insert)
  (define-key dired-mode-map ";" 'dired-subtree-remove) ))

; configure jedi
(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'jedi:install-server)

; configure git-gutter
(add-hook 'prog-mode-hook 'git-gutter-mode)
