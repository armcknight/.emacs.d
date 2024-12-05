;
; Emacs automation
;

(defun new-scratch-buffer ()
  "Create a new scratch buffer named scratchX, where X is a monotonically increasing integer starting at 0."
  (interactive)
  (let ((scratch-buffers (cl-remove-if-not
                          (lambda (buf)
                            (string-prefix-p "scratch" (buffer-name buf)))
                          (buffer-list)))
        (scratch-buffer-name))
    (setq scratch-buffer-name (format "scratch%d" (length scratch-buffers)))
    (switch-to-buffer (get-buffer-create scratch-buffer-name))
    (setq buffer-offer-save nil)
    (lisp-interaction-mode)
    (message "New scratch buffer created: %s" scratch-buffer-name)))


(defun switch-to-scratch-buffer(scratch-buffer-number)
  (interactive "NScratch buffer number:")
  (switch-to-buffer (format "scratch%d" scratch-buffer-number)))

(defun show-all-custom-keybindings()
  "Show a list of all custom keybindings in a special buffer."
  (interactive)
  (let ((temp-buf-name "*Custom Keybindings*")
        (keybindings (with-temp-buffer
                       (insert-file-contents "~/.emacs.d/keybindings.el")
                       (buffer-string))))
    ;; Create a buffer `temp-buf-name' and insert the keybindings
    (get-buffer-create temp-buf-name)
    (with-current-buffer temp-buf-name
      (insert keybindings)
      (special-mode)) ; Set its major mode to `special-mode'
    ;; Switch to the `temp-buf-name' buffer
    (switch-to-buffer-other-window temp-buf-name)
    (message "All custom keybindings displayed in %s" temp-buf-name)))
