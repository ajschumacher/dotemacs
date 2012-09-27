;;----------------------------------------------------------------------
;; Completion
;;----------------------------------------------------------------------

;(setq tab-always-indent 'complete)
; Completion of acronyms and initialisms
;(setq completion-styles (append completion-style '(initials)))

;; minibuffer completion
;;(icomplete-mode) ; complete as you type
(setq completion-ignored-extensions '(".o" "~" ".bin" ".aux"))

;; InteractivelyDoThings
;;(require 'ido)
(ido-mode t)
(setq
 ido-enable-flex-matching t ; enable fuzzy matching
 ido-everywhere t           ; use ido everywhere
 ido-show-dot-for-dired t   ; always show dot for current directory
 ido-use-virtual-buffers t  ; refer to past buffers as well as existing ones
 ido-ignore-buffers         ; Ignore buffers:
   '("\\` " "^\*Back" "^\*Compile-Log" ".*Completion" "^\*Ido")
 )
;(setq ido-file-extensions-order '(".org" ".txt" ".py" ".el" ".ini" ".cfg"))

;;----------------------------------------------------------------------
;; Anything
;; see http://emacs-fu.blogspot.com/2011/09/finding-just-about-anything.html
;; (require 'anything-config)
;; (defun my-anything ()
;;   (interactive)
;;   (anything-other-buffer
;;    '(anything-c-source-emacs-commands
;;      anything-c-source-buffers
;;      anything-c-source-files-in-current-dir
;;      anything-c-source-file-name-history
;;      ;; anything-c-source-info-pages
;;      ;; anything-c-source-man-pages
;;      ;; anything-c-source-file-cache
;;      anything-c-source-locate)
;;    " *my-anything*"))
;; (global-set-key (kbd "M-X") 'my-anything)

;; (global-set-key (kbd "C-x b")
;;   (lambda() (interactive)
;;     (anything
;;      :prompt "Switch to: "
;;      :candidate-number-limit 10                 ;; up to 10 of each
;;      :sources
;;      '( anything-c-source-buffers               ;; buffers
;;         anything-c-source-recentf               ;; recent files
;;         anything-c-source-bookmarks             ;; bookmarks
;;         anything-c-source-files-in-current-dir+ ;; current dir
;;         anything-c-source-locate))))            ;; use 'locate'

;; (global-set-key (kbd "C-c I")  ;; i -> info
;;   (lambda () (interactive)
;;     (anything
;;       :prompt "Info about: "
;;       :candidate-number-limit 3
;;       :sources
;;       '( anything-c-source-info-libc             ;; glibc docs
;;          anything-c-source-man-pages             ;; man pages
;;          anything-c-source-info-emacs))))        ;; emacs

;;----------------------------------------------------------------------

(require 'smart-tab)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
(ac-config-default)
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'idlwave-mode)
(add-to-list 'ac-modes 'less-css-mode)
(add-to-list 'ac-modes 'scss-mode)
(global-auto-complete-mode t)

;; C-n/C-p to select candidates
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)

;; enable autopair in all buffers
(require 'autopair)
(autopair-global-mode)
(setq autopair-autowrap t)

;;----------------------------------------------------------------------
;; Templates
;;----------------------------------------------------------------------

(require 'yasnippet)
(yas/load-directory "~/.emacs.d/snippets")
(yas/global-mode 1)

;; ;; (require 'autoinsert)
;; ;; (auto-insert-mode)                                   ; Adds hook to find-files-hook
;; (add-hook 'find-file-hooks 'auto-insert)
;; (setq auto-insert-directory "~/lib/dotfiles/templates/") ; *NOTE* Trailing slash important
;; ;; (setq auto-insert-directory (concat (getenv "HOME") "/.dossier/"))
;; (setq auto-insert-query nil)                         ; don't prompt before insertion
;; (define-auto-insert "\.py" "module.py")
;; ;; (define-auto-insert "\.php" "my-php-template.php")

;; (setq auto-insert-alist
;;       '(
;;         ;; C++ Header
;;         (("\\.\\([H]\\|hh\\|hpp\\)\\'" . "C++ Header")
;;          nil
;;          "#if !defined(" (upcase (file-name-nondirectory buffer-file-name)) ")\n"
;;          "#define " (upcase (file-name-nondirectory buffer-file-name)) "\n\n"
;;          "#endif\n"
;;          )
;;         ;; Perl
;;         ((cperl-mode . "Perl Program")
;;           nil
;;           "#!/usr/bin/env perl\n#\n")
;;         ;; Shell
;;         ((sh-mode . "Shell script")
;;           nil
;;           "#!/bin/sh\n"
;;           "# -*- coding: UTF8 -*-\n\n")
;;         ("\\.py$" . ["module.py" auto-update-header-file])
;;         ))
;; (setq auto-insert 'other)

;; ;; Function replaces the string '%xxx%' by the relevant information.
;; (defun auto-update-header-file ()
;;   (save-excursion
;;     (while (search-forward "%file%" nil t)
;;       (save-restriction
;;         (narrow-to-region (match-beginning 0) (match-end 0))
;;         (replace-match (file-name-nondirectory buffer-file-name))
;;         ))
;;     (while (search-forward "%date%" nil t)
;;       (save-restriction
;;         (narrow-to-region (match-beginning 0) (match-end 0))
;;         (replace-match (format-time-string "%e %B %Y" (current-time)))
;;         ))
;;     (while (search-forward "%year%" nil t)
;;       (save-restriction
;;         (narrow-to-region (match-beginning 0) (match-end 0))
;;         (replace-match (format-time-string "%Y" (current-time)))
;;         ))
;;     )
;;   )

(provide 'init-completion)
