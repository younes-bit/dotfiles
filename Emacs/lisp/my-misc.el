;;; my-misc.el -*- lexical-binding: t; -*-

(use-package which-key
  :ensure nil
  :init
  (which-key-mode 1)
  :config
  (setq which-key-idle-delay 0.5))

(provide 'my-misc)
