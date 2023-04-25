; navigation to frequently used repos, under repo structure created by armcknight/forgery
; all keybindings follow the pattern C-c C-g X ("custom goto"), where X is the first letter of the
; repo name that can distinguish it. for sentry-cocoa, X is c, for sentry-docs, X is d, etc

(defun goto-sentry-cocoa ()
  "Open dired to getsentry/sentry-cocoa repo root."
  (interactive)
  (dired "~/Code/organization/getsentry/repos/public/sentry-cocoa")
)

(global-set-key "\C-c\C-gc" 'goto-sentry-cocoa)

(defun goto-sentry-docs ()
  "Open dired to getsentry/sentry-docs repo root."
  (interactive)
  (dired "~/Code/organization/getsentry/repos/public/sentry-docs")
)

(global-set-key "\C-c\C-gd" 'goto-sentry-docs)
