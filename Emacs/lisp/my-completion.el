;;; my-completion.el -*- lexical-binding: t; -*-

(defun my/savehist-enable ()
  "Load history, keeping a backup if its Lisp data is malformed."
  (condition-case err
      (savehist-mode 1)
    ((end-of-file invalid-read-syntax)
     (let ((backup (make-temp-name (concat savehist-file ".corrupt-"))))
       (rename-file savehist-file backup)
       (savehist-mode 1)
       (display-warning 'savehist
                        (format "Malformed history backed up to %s: %s"
                                backup (error-message-string err))
                        :warning)))))

(use-package savehist
  :ensure nil
  :init (my/savehist-enable))

(use-package vertico
  :init
  (vertico-mode 1)
  :config
  (setq vertico-cycle t))

(use-package org-fragtog
  :hook (org-mode . org-fragtog-mode))

(use-package marginalia
  :init (marginalia-mode 1))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides
        '((file (styles basic partial-completion)))))

(use-package consult
  :bind (("C-s"   . consult-line)
         ("C-x b" . consult-buffer)
         ("M-g g" . consult-goto-line)
         ("C-c r" . consult-ripgrep)
         ("M-i"   . consult-imenu)))

(use-package corfu
  :init
  (global-corfu-mode)
  :custom
  (corfu-auto t)
  (corfu-auto-delay 0.20)
  (corfu-auto-prefix 2)
  (corfu-quit-no-match 'separator)
  (corfu-preselect 'prompt))

(use-package cape
  :after corfu
  :init
  (add-hook
   'prog-mode-hook
   (lambda ()
     (add-to-list 'completion-at-point-functions #'cape-dabbrev)
     (add-to-list 'completion-at-point-functions #'cape-file))))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :custom
  (markdown-fontify-code-blocks-natively t))
(provide 'my-completion)
