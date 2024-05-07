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
 '(
   ; emacs stuff
   dired-subtree ; dired minor mode to expand directory contents inline
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
   toml-mode
   yaml-mode
   go-mode

   ; elisp libraries
   s ; string manipulation
   f ; file/directory manipulation
))
(package-refresh-contents)
(package-install-selected-packages)

; configure magit
; the following settings were found at https://github.com/philc/emacs-config/blob/master/.emacs.d/elisp/magit-config.el
;; Have Magit open buffers in the current window, rather than a new split.
;; https://github.com/magit/magit/issues/2541
(setq magit-display-buffer-function (lambda (buffer)
                                      (display-buffer buffer '(display-buffer-same-window))))
;; When committing, don't have Magit show the diff of what's changed. This feature is annoying because it
;; creates two buffers. I've already reviewed the staged changes prior to activating commit mode and don't
;; need to see the changes again.
(setq magit-commit-show-diff nil)
; done with settings found at https://github.com/philc/emacs-config/blob/master/.emacs.d/elisp/magit-config.el
(setq magit-diff-refine-hunk 'all)

; configure yaml-mode
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook
          (lambda () (run-hooks 'prog-mode-hook)))

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
