
; load path section
(add-to-list 'load-path "~/.elisp")
(add-to-list 'load-path "~/.elisp/haskell-mode-2.8.0/")
(add-to-list 'load-path "~/opt/clojure-mode")
(add-to-list 'load-path "~/opt/slime")

; require section
(require 'slime)
(require 'ido)
(require 'haskell-mode)
(require 'inf-haskell)
(require 'clojure-mode)
(require 'custom)

;; slime
(eval-after-load "slime" 
  '(progn (slime-setup '(slime-repl))
          (defun paredit-mode-enable () 
            (paredit-mode 1)
            (local-set-key (kbd "M-[ c") 'paredit-forward-slurp-sexp)
            (local-set-key (kbd "M-[ d") 'paredit-backward-slurp-sexp))
          (add-hook 'slime-mode-hook 'paredit-mode-enable)
          (add-hook 'slime-repl-mode-hook 'paredit-mode-enable)
          (setq slime-protocol-version 'ignore)))

;; Stop SLIME's REPL from grabbing DEL,
;; which is annoying when backspacing over a '('
(defun override-slime-repl-bindings-with-paredit ()
  (define-key slime-repl-mode-map
    (read-kbd-macro paredit-backward-delete-key) nil))
(add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

(slime-setup)

; haskell
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook (lambda ()
			       (setq tab-width 2)
			       (setq indent-tabs-mode nil)))

; tab stuff
(setq default-tab-width 2)
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

; always have word wrap on
(toggle-truncate-lines)

; use chrome to browse urls
(setq browse-url-generic-program (executable-find "google-chrome") browse-url-browser-function 'browse-url-generic)

; ido settings
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

; don't pollute directories with backup files...instead, but them
; into .emacs-backup
(defvar user-temporary-file-directory
  "~/.emacs-backup/")
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        (tramp-file-name-regexp nil)))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))

; indent whole buffer
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))