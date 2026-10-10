;;; my-editing.el -*- lexical-binding: t; -*-

;; Tabs: 4 spaces
(setq-default indent-tabs-mode nil
              tab-width 4)

;; Window movement
(windmove-default-keybindings 'meta)
(setq windmove-wrap-around t)

;; CUA keys
(cua-mode 1)
(setq cua-keep-region-after-copy nil)

;; no-littering is initialized in my-core-packages.
(setq make-backup-files t
      backup-by-copying t
      version-control t
      delete-old-versions t
      kept-new-versions 10
      kept-old-versions 2
      backup-directory-alist
      `(("." . ,(no-littering-expand-var-file-name "backup/")))
      auto-save-default t
      auto-save-file-name-transforms
      `((".*" ,(no-littering-expand-var-file-name "auto-save/") t)))

(use-package json-mode
  :mode ("\\.json\\'" . json-mode))

(use-package dockerfile-mode
  :mode (("Dockerfile\\'" . dockerfile-mode)
         ("\\.dockerfile\\'" . dockerfile-mode)))

;; Use the existing C++ mode for CUDA sources and headers.
(add-to-list 'auto-mode-alist '("\\.cuh?\\'" . c++-mode))

(provide 'my-editing)

