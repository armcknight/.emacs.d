; custom function definitions

(defun edit-init-file-named (name)
  (interactive)
  (find-file (format "~/.emacs.d/%s" name))
)

(defun edit-init-file ()
  "Open the init file in the current buffer for editing."
  (interactive)
  (edit-init-file-named "init.el")
)

(defun edit-packages ()
  "Open the packages.el init file in the current buffer for editing."
  (interactive)
  (edit-init-file-named "packages.el")
)

(defun edit-functions ()
  "Open the functions.el file, defining custom functions, in the current buffer for editing."
  (interactive)
  (edit-init-file-named "functions.el")
)

(defun edit-appearance ()
  "Open the appearance.el init file in the current buffer for editing."
  (interactive)
  (edit-init-file-named "appearance.el")
)

(defun edit-keybindings ()
  "Open the keybindings.el init file in the current buffer for editing."
  (interactive)
  (edit-init-file-named "keybindings.el")
)

(defun edit-file-editing ()
  "Open the file-editing.el file, defining file editing behaviors, in the current buffer for editing."
  (interactive)
  (edit-init-file-named "file_editing.el")
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

(defun open-github-pr (title body base_branch)
  "Open a PR on GitHub in the current repo for the current branch."
  (setq default_base_branch (string-trim (shell-command-to-string "git remote show origin | sed -n '/HEAD branch/s/.*: //p'")))
;  (interactive (format-message "STitle: \nSBody: \nSBase branch (default %s): " default_base_branch))

;(interactive (list
;                (read-string (format "word (%s): " (thing-at-point 'word))
;                             nil nil (thing-at-point 'word))))

(interactive (list
                (read-string "Title: " nil nil (thing-at-point 'title))
                (read-string "Body: " nil nil (thing-at-point 'body))
                (read-string (format "Base branch (default %s): " default_base_branch)
                             nil nil (thing-at-point 'base_branch))))
  (if base_branch
      (setq base_branch default_base_branch))
  (shell-command (format "gh pr create --title \"%s\" --body \"%s\" --base %s" title body base_branch))
)
