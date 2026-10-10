;;; my-core-settings.el -*- lexical-binding: t; -*-

;; Simple prompts
(defalias 'yes-or-no-p #'y-or-n-p)

;; Column numbers
(column-number-mode 1)

;; Auto-revert files
(setq auto-revert-verbose nil)
(global-auto-revert-mode 1)

;; Remember cursor position
(save-place-mode 1)

(provide 'my-core-settings)
