;
; Makefile Automation
;

(defun make-init()
  (interactive)
  "Run `make init` in the current directory."
  (shell-command (format "cd %s && make init" (magit-toplevel)))
)

(defun make-build()
  (interactive)
  "Run `make build` in the current directory."
  (shell-command (format "cd %s && make build" (magit-toplevel)))
)

(defun make-test()
  (interactive)
  "Run `make test` in the current directory."
  (shell-command (format "cd %s && make test" (magit-toplevel)))
)

(defun make-deploy()
  (interactive)
  "Run `make deploy` in the current directory."
  (shell-command (format "cd %s && make deploy" (magit-toplevel)))
)

(defun make-serve()
  (interactive)
  "Run `make serve` in the current directory."
  (async-shell-command (format "cd %s && make serve" (magit-toplevel)))
)

(defun make-endserve()
  (interactive)
  "Run `make endserve` in the current directory."
  (shell-command (format "cd %s && make endserve" (magit-toplevel)))
)

(defun open-makefile()
  (interactive)
  "Open the Makefile in the current directory for editing."
  (find-file (format "%s/Makefile" (magit-toplevel)))
)
