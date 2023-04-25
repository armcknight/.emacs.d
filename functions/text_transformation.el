;
; text manipulation
;

(defun shell-command-on-region-to-string (start end command)
  "shell-command-on-region-to-string = shell-command-on-region + shell-command-to-string"
  (save-window-excursion
    (with-output-to-string
      (shell-command-on-region start end command standard-output))))

(defun insert-shell-command-result(result)
  "Remove the agent PID line from the shell command STDOUT and insert the remaining string into the buffer."
  (insert (string-join (cl-subseq (split-string result "\n") 1) "\n"))
)

(defun columnize()
  "Convert a list of lines in a highlighted region into a columnar format."
  (interactive)
  (setq result (shell-command-on-region-to-string (region-beginning) (region-end) (format "column -c %d" (window-total-width))))
  (delete-region (region-beginning) (region-end))
  (insert-shell-command-result result)
)

(defun treeify (&optional start end)
  "Take the highlighted region, provide it to `tree` and return the result."
  (interactive "r")
  (setq shell-result (shell-command-on-region-to-string start end "tree --fromfile --noreport"))
  (delete-region start end)
  (insert-shell-command-result shell-result)
)

;
; Log munging
;

(defun clean-xcode-logs(&optional start end)
  "Remove some noisy data from Xcode logs, like timestamp and process IDs. Operates on a highlighted region of text in an emacs buffer."
  (interactive "r")
  (setq cleaned-logs (shell-command-on-region-to-string start end "sed -re s/\"[0-9]{4}\-[0-9]{2}\-[0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2}\.[0-9]{6}-[0-9]{4} xctest\[[0-9]*:[0-9]*\]\"//g"))
  (delete-region start end)
  (insert-shell-command-result cleaned-logs)
)
