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

; theme
(setq frame-background-mode 'dark)
