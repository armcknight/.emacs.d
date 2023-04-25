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
  ; TODO: implement
)

(defun show-all-custom-keybindings()
  "Show a child frame, temporary buffer or momentary-string-display in the bottom right of the current frame that lists all the custom keybindings from ~/.emacs.d/keybindings.el"
  (interactive)
  ; TODO: implement
)
