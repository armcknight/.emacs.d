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
