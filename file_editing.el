; tabs to 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

; show line numbers for source code files of various types
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

; delete trailing whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
