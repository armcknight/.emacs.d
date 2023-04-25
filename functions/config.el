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
