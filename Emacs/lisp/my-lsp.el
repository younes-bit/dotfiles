;;; my-lsp.el -*- lexical-binding: t; -*-

;; C/C++ diagnostics use clangd through Eglot and Flymake.
(use-package eglot
  :ensure nil
  :if (executable-find "clangd")
  :commands (eglot eglot-ensure)
  :hook ((c-mode c++-mode c-ts-mode c++-ts-mode) . eglot-ensure))

;; R diagnostics use only the parser, without running the edited script.
(defun my/r-syntax-check ()
  "Enable Flycheck's R syntax checker in the current buffer."
  (setq-local flycheck-checker 'r)
  (flycheck-mode 1))

(use-package flycheck
  :commands flycheck-mode
  :hook (ess-r-mode . my/r-syntax-check))

(provide 'my-lsp)
