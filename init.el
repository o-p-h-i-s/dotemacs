;; <leaf-install-code>
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    (leaf hydra :ensure t)
    (leaf blackout :ensure t)
    :config
    (leaf-keywords-init)))
;; </leaf-install-code>

(leaf cus-edit
  :doc "tools for customizing Emacs and Lisp packages"
  :tag "builtin" "faces" "help"
  :custom `((custom-file . ,(locate-user-emacs-file "custom.el")))
  :hook
  (;; delete custom.el
   kill-emacs-hook . (lambda () (if (file-exists-p custom-file) (delete-file custom-file)))))

(leaf cus-start
  :doc "settings"
  :init
  (load-theme 'wombat t)
  :bind*
  (("C-h" . delete-backward-char)
   ("C-?" . help-for-help))
  :pre-push
  (;; font
   (default-frame-alist . '(font . "CaskaydiaCove NFM-13"))
   )
  :custom
  (;; auto focus help buffer
   (help-window-select . t)
   ;; create backup
   (make-backup-files . nil)
   ;; create auto-save-list
   (auto-save-list-file-prefix . nil)
   ;; create lock file
   (create-lockfiles . nil)
   ;; inhibit startup message
   (inhibit-startup-message . t)
   ;; initial scratch message
   (initial-scratch-message . "")
   ;; ring bell
   (ring-bell-function . 'ignore)
   ;; case insentive match
   (case-fold-search . t)
   ;; auto pair
   (electric-pair-mode . t))
  :global-minor-mode
  (;; line-number
   (global-display-line-numbers-mode)))

(leaf free-keys :ensure t)

(leaf org
  :mode "\\.org\\'"
  :bind
  (("C-c l" . org-store-link)
   ("C-c c" . org-capture)
   ("C-c a" . org-agenda)
   ("C-c b" . org-iswitchb)))

