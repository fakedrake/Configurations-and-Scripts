(add-to-list 'load-path "~/.emacs.d/")

(defun indent-buffer ()
  "Indents an entire buffer using the default intenting scheme."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

(global-set-key "\C-x\\" 'indent-buffer)
(tool-bar-mode -1)
(menu-bar-mode -1)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(require 'auto-complete)


(show-paren-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((((class color) (min-colors 88) (background dark)) (:foreground "blue4"))))
 '(font-lock-function-name-face ((((class color) (min-colors 88) (background dark)) (:foreground "spring green"))))
 '(font-lock-keyword-face ((((class color) (min-colors 88) (background dark)) (:foreground "purple2"))))
 '(font-lock-string-face ((((class color) (min-colors 88) (background dark)) (:foreground "red3")))))


;; PYTHON IDE
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default py-indent-offset 4)

(require 'python-mode)
(add-hook 'python-mode-hook 'linum-mode t)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("ipython" . python-mode))


(setq ipython-command "/usr/bin/ipython")
(setq py-python-command-args '("-pylab" "-colors" "LightBG"))
(require 'ipython)

(require 'anything)
(require 'anything-ipython)
(when (require 'anything-show-completion nil t) (use-anything-show-completion 'anything-ipython-complete '(length initial-pattern)))

(require 'comint)
(define-key comint-mode-map (kbd "M-") 'comint-next-input)
(define-key comint-mode-map (kbd "M-") 'comint-previous-input)
(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)

(require 'python-pep8)
(require 'python-pylint)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(defun annotate-pdb ()
  (interactive)
  (highlight-lines-matching-regexp "import pdb")
  (highlight-lines-matching-regexp "pdb.set_trace()"))
(add-hook 'python-mode-hook 'annotate-pdb)

(defun python-add-breakpoint ()
  (interactive)
  (py-newline-and-indent)
  (insert "import ipdb; ipdb.set_trace()")
  (highlight-lines-matching-regexp "^[ ]*import ipdb; ipdb.set_trace()"))
(define-key py-mode-map (kbd "C-c C-t") 'python-add-breakpoint)

;; GENERAL (again)

(delete-selection-mode)

(require 'aris)

(require 'multi-term)
(setq multi-term-program "bin/bash")

(set-background-color "black")
(set-foreground-color "white")

;;;PHP
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;;;JAVASCRIPT
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "javascript" nil t)

(add-to-list 'ac-css-value-classes
             '(border-width "thin" "medium" "thick" "inherit"))
(set-cursor-color "white")