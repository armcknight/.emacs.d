; custom function definitions

(defun edit-init-file ()
  "Open the init file in the current buffer for editing."
  (interactive)
  (find-file user-init-file)
)

(defun ensure-latest-dotfiles-revision ()
  "Ensure we have the dotfiles repo cloned at a known location and on the latest commit."
  (if (file-directory-p "~/Code/.files/")
        (let ((default-directory "~/Code/.files/")) (shell-command "git pull --ff-only"))
    (shell-command "git clone git@github.com:armcknight/.files ~/Code/.files")
  )
)

(defun for-each-config-filename (func)
  "Call a function for each configuration filename."
  (dolist (next (list "appearance" "init" "functions" "keybindings" "custom"))
    (funcall func next)
  )
)

(defun sync-current-configuration (commit-message)
  "Copy the current configuration files into the dotfiles repo, commit and push to remote."
  (interactive "sWhat commit message should be written with the current changes? ")
  (ensure-latest-dotfiles-revision)
  (for-each-config-filename (lambda (next)
    (delete-file (format "~/Code/.files/configuration/.emacs.d/%s.el" next))
    (copy-file (format "~/.emacs.d/%s.el" next) (format "~/Code/.files/configuration/.emacs.d/%s.el" next))
  ))
  (Let ((default-directory "~/Code/.files/")) (shell-command (format "git commit --all --message '%s'" commit-message)))
  (let ((default-directory "~/Code/.files/")) (shell-command "git push"))
)

(defun update-configuration ()
  "Fetch the latest revision of the dotfiles repo and copy the emacs configuration files."
  (interactive)
  (ensure-latest-dotfiles-revision)
  (for-each-config-filename (lambda (next)
    (delete-file (format "~/.emacs.d/%s.el" next))
    (copy-file (format "~/Code/.files/configuration/.emacs.d/%s.el" next) (format "~/.emacs.d/%s.el" next))
  ))
  (load "~/.emacs.d/init.el" )
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
