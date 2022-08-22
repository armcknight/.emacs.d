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

(defun get-next-pr-number()
  "Get the number of the next PR that would be opened."
  (interactive)
  (setq command-result (string-trim (shell-command-to-string "gh pr list --json number --limit 1 --jq '.[] | .number'")))
  (setq next_pr_number (number-to-string (+ 1 (string-to-number (car (last (split-string command-result "\n")))))))
  (kill-new next_pr_number)
)

(defun create-github-pr-web ()
  "Open the GitHub PR creation webpage"
  (interactive)
  (shell-command "gh pr create --web")
)

(defun browse-github-repo()
  "Open the current repo on GitHub in the browser."
  (interactive)
  (shell-command "gh browse")
)
