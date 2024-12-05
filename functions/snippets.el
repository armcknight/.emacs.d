;
; Elisp snippets
;

(defun scaffold-new-elisp-function(name)
  "Insert a stub for a new function with TODOs."
  (interactive "SName:")
  (insert (format "(defun %s()
  \"TODO: Write documentation string.\"
  (interactive)
  ; TODO: implement
)" name))
)

(defun scaffold-new-region-header-comment(region-name)
  "Insert a comment suitable to demarcate a new region in an elisp file."
  (interactive "SRegion name:")
  (insert (format ";\n; %s\n;" region-name))
)
