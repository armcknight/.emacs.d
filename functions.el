;
; quick editing of config files
;

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

;
; text manipulation
;

(defun shell-command-on-region-to-string (start end command)
  "shell-command-on-region-to-string = shell-command-on-region + shell-command-to-string"
  (save-window-excursion
    (with-output-to-string
      (shell-command-on-region start end command standard-output))))

(defun treeify (&optional start end)
  "Take the highlighted region, provide it to `tree` and return the result."
  (interactive "r")
  (setq shell-result (shell-command-on-region-to-string start end "tree --fromfile --noreport"))
  (car (last (split-string shell-result "\\.\n")))
)

;
; Viewport manipulation
;

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

;
; Git operations
;

(defun gwip()
  (interactive)
  (shell-command-to-string "git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)\t%(committerdate:short)\t%(refname:short)' | column -t -s '\t'")
)

(defun gwip-tree()
  (interactive)
  (shell-command (format "echo '%s' | tree --fromfile --noreport --filesfirst" (gwip)))
)

(defun get-last-commit-hash-modifying-file(path)
  (interactive)
  (insert (string-trim (shell-command-to-string (format "git log --max-count=1 --format=%%H %s" path))))
)

;
; GitHub operations
;

(defun get-this-pr-number()
  "Get the number of the current PR for the current branch."
  (interactive)
  (setq command-result (string-trim (shell-command-to-string "gh pr status --json number --jq '.currentBranch.number'")))
  (setq next_pr_number (number-to-string (+ 1 (string-to-number (car (last (split-string command-result "\n")))))))
  (insert (format " (#%s)" next_pr_number))
)

(defun get-next-pr-number()
  "Get the number of the next PR that would be opened."
  (interactive)
  (setq command-result (string-trim (shell-command-to-string "gh pr list --json number --limit 1 --jq '.[] | .number'")))
  (setq next_pr_number (number-to-string (+ 1 (string-to-number (car (last (split-string command-result "\n")))))))
  (insert (format " (#%s)" next_pr_number))
)

;
; GitHub web operations
;

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

;
; .gitignore generation
;

(defun get-gitignore(args)
  "Get the .gitignore contents for the platform arguments."
  (interactive)
  (setq result (string-trim (shell-command-to-string (format "curl --silent https://www.toptal.com/developers/gitignore/api/%s" args))))
  (insert (string-join (cdr (split-string result "\n")) "\n"))
)

(defun gitignore-apple()
  "Get the .gitignore contents helpful for development on Apple platforms."
  (interactive)
  (get-gitignore "objective-c,swiftpm,swift,swiftpackagemanager,xcode")
)

(defun gitignore-emacs()
  "Get the .gitignore contents helpful for development with emacs."
  (interactive)
  (get-gitignore "emacs")
)
