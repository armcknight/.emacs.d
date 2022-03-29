; configure look and feel

(show-paren-mode 1)
(menu-bar-mode -1)
(display-time-mode 1)

; show full path in buffer name
(setq-default frame-title-format "%b (%f)")

; show full file path in mode-line
(defun add-mode-line-dirtrack ()
  (add-to-list 'mode-line-buffer-identification
               '(:propertize (" " default-directory) mode-line dired-directory)))
(add-hook 'find-file-hook 'add-mode-line-dirtrack)

; tabs to 4 spaces
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

; theme
(setq frame-background-mode 'dark)

; show line numbers for source code files of various types
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
