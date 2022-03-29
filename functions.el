; custom function definitions

(defun edit-init-file ()
  "Open the init file in the current buffer for editing."
  (interactive)
  (find-file user-init-file)
)

(defun view-in-columns (columns)
  "View the current buffer in the provided number of columns."
  (interactive "NNumber of columns: ")
  (delete-other-windows)
  (setq num 1)
  (while (< num columns)
    (split-window-horizontally)
    (setq num (1+ num))
  )
  (balance-windows)
  (follow-mode t)
 )
