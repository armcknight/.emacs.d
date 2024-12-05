;
; Website automation
;

(defun create-new-blog-draft(title)
  "Create a new blog draft in the _drafts directory."
  (interactive "sTitle: ")
  (setq formatted-date (format-time-string "%Y-%m-%d"))
  (setq filename (format "%s/_drafts/%s-%s.md" (magit-toplevel) formatted-date (replace-regexp-in-string " " "-" (downcase title))))
    (find-file filename)
    (insert (format "---
title: %s
date: %s
categories: []
tags: []
---
" title formatted-date))
)
