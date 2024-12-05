; navigation to frequently used repos, under repo structure created by armcknight/forgery

(defun goto-personal-website ()
  "Open dired to personal website repo root."
  (interactive)
  (dired "~/Code/user/armcknight/repos/public/armcknight.com")
)

(defun goto-forgery ()
  "Open dired to forgery repo root."
  (interactive)
  (dired "~/Code/user/armcknight/repos/public/forgery")
)

(defun goto-mtg ()
  "Open dired to mtg repo root."
  (interactive)
  (dired "~/Code/user/armcknight/repos/public/mtg")
)

