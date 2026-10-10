;;; early-init.el -*- lexical-binding: t; -*-

;; Don’t let Emacs auto-init packages before init.el
(setq package-enable-at-startup nil)

;; Boost GC only while loading the configuration.
(setq gc-cons-threshold (* 256 1024 1024)
      gc-cons-percentage 0.6)

(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold (* 64 1024 1024)
                  gc-cons-percentage 0.1))
          100)

;; Silence native-comp spam
(when (boundp 'native-comp-async-report-warnings-errors)
  (setq native-comp-async-report-warnings-errors nil))

;; Kill UI chrome ASAP
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq inhibit-startup-screen t
      inhibit-startup-message t
      use-dialog-box nil
      frame-resize-pixelwise t)

