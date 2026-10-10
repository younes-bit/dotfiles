;;; my-ui.el -*- lexical-binding: t; -*-

;; Modus Vivendi
(setq modus-themes-bold-constructs t
      modus-themes-italic-constructs t)

(when (display-graphic-p)
  (load-theme 'modus-vivendi t))

;; Make GUI side areas match the main buffer background
(set-face-attribute 'fringe nil
                    :background (face-background 'default))

(set-face-attribute 'vertical-border nil
                    :background (face-background 'default)
                    :foreground (face-background 'default))

(set-face-attribute 'window-divider nil
                    :background (face-background 'default)
                    :foreground (face-background 'default))

(set-face-attribute 'window-divider-first-pixel nil
                    :background (face-background 'default)
                    :foreground (face-background 'default))

(set-face-attribute 'window-divider-last-pixel nil
                    :background (face-background 'default)
                    :foreground (face-background 'default))

;; Line-number area, even if numbers are disabled/invisible
(set-face-attribute 'line-number nil
                    :background (face-background 'default))

(set-face-attribute 'line-number-current-line nil
                    :background (face-background 'default)
                    :weight 'bold)

;; Tooltips/popups
(set-face-attribute 'tooltip nil
                    :background (face-background 'default)
                    :foreground (face-foreground 'default))

;; GUI frame defaults
(add-to-list 'default-frame-alist
             `(background-color . ,(face-background 'default)))

(add-to-list 'default-frame-alist
             `(foreground-color . ,(face-foreground 'default)))

;; Parens, highlight, etc.
(setq show-paren-delay 0)
(show-paren-mode 1)

(electric-pair-mode 1)
(setq font-lock-maximum-decoration t)

;; Line numbers in code
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(provide 'my-ui)
