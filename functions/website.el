;
; Website automation
;

(defun create-new-blog-draft(title)
  "Create a new blog draft in the _drafts directory."
  (interactive "sTitle: ")
  (setq formatted-date (format-time-string "%Y-%m-%d"))
  (setq filename (format "%s/blog/_drafts/%s-%s.md" (magit-toplevel) formatted-date (replace-regexp-in-string " " "-" (downcase title))))
    (find-file filename)
    (insert (format "---
title: %s
date: %s
categories: []
tags: []
---
" title formatted-date))
)

(defun list-all-tags ()
  "List all tags apppearing in the _posts directory in a temporary special mode buffer."
  (interactive)
  (setq posts-dir (format "%s/blog/_posts/*" (magit-toplevel)))
  ;(setq tags (shell-command (format "grep -oh 'tags: .*' %s | sed s/'tags: '//g | sed 's/[[:space:]]*$//' | tr ' ' '\n' | sort -f | uniq | tr '\n' ' '" posts-dir)))
  ;(get-buffer-create "*Website Tags*")
  ;(with-current-buffer "*Website Tags*"
  ;  (insert tags)
  ;  (special-mode))
  ;(switch-to-buffer-other-window "*Website Tags*")

  (let ((temp-buf-name "*Website Tags*")
        (tags-buffer-string (with-temp-buffer
                       (shell-command (format "grep -oh 'tags: .*' %s | sed s/'tags: '//g | sed 's/[[:space:]]*$//' | tr ' ' '\n' | sort -f | uniq | tr '\n' ' '" posts-dir))
                       (buffer-string))))
    ;; Create a buffer `temp-buf-name' and insert the keybindings
    (get-buffer-create temp-buf-name)
    (with-current-buffer temp-buf-name
      (insert tags-buffer-string)
      (special-mode)) ; Set its major mode to `special-mode'
    ;; Switch to the `temp-buf-name' buffer
    (switch-to-buffer-other-window temp-buf-name)
    (message "All tags displayed in %s" temp-buf-name))

)
