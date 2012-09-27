;;------------------------------------------------------------
;; PHP
;;------------------------------------------------------------
;; Manuel php en français
(setq php-manual-url "http://fr.php.net/manual/fr/")

;; (add-hook 'php-mode-hook
;;           (lambda ()
;;             (require 'flymake-php)
;;             (flymake-mode t)))

(eval-after-load "php-mode"
  '(progn
     (define-key php-mode-map (kbd "RET") 'reindent-then-newline-and-indent)))

;;------------------------------------------------------------
;; HTML
;;------------------------------------------------------------
;; Indenter automatiquement lorsque l'on appuie sur entrée
(defun my-html-helper-load-hook ()
  (define-key html-mode-map (kbd "RET") 'newline-and-indent))
(add-hook 'html-helper-load-hook 'my-html-helper-load-hook)

;;------------------------------------------------------------
;; Css
;;------------------------------------------------------------
(defun my-css-mode-hook ()
  (setq css-indent-offset 2)
  (define-key css-mode-map "\C-c s" 'css-insert-section)
  (autopair-mode -1)
  (rainbow-mode 1))

(add-hook 'css-mode-hook 'my-css-mode-hook)
(add-hook 'scss-mode-hook 'my-css-mode-hook)

(defun css-insert-section (section)
  "Inserts a css section."
  (interactive "sSection: ")
  (insert (concat "/*--[ " section " ]"))
  (while (< (point) (+ 70 (point-at-bol)))
    (insert "-"))
  (insert (concat "*/\n" "\n")))

;;------------------------------------------------------------
;; Js
;;------------------------------------------------------------
(defun my-js-mode-hook ()
  (setq js-indent-level 2)
  ;; fixes problem with pretty function font-lock
  (define-key js-mode-map (kbd ",") 'self-insert-command)
  (font-lock-add-keywords
   'js-mode `(("\\(function *\\)("
               (0 (progn (compose-region (match-beginning 1)
                                         (match-end 1) "\u0192")
                         nil))))))

(add-hook 'js-mode-hook 'my-js-mode-hook)

;;------------------------------------------------------------

(require 'mmm-auto)
(setq mmm-global-mode 'maybe)
(mmm-add-mode-ext-class 'html-mode "\\.php\\'" 'html-php)
(mmm-add-mode-ext-class 'css-mode "\\.html\\'" 'css-mode-html)
(mmm-add-mode-ext-class 'js2-mode "\\.html\\'" 'js2-mode-html)

;; Utiliser PSGML pour les fichiers SGML, HTML, XML
;; (autoload 'sgml-mode "psgml" "Major mode to edit SGML files." t)
;; (autoload 'xml-mode "psgml" "Major mode to edit XML files." t)
(autoload 'rainbow-mode "rainbow-mode" "Highlight color names in buffer" t)
(autoload 'css-mode "css-mode" "CSS editing mode" t)
(autoload 'javascript-mode "javascript-mode.el" nil t)
(autoload 'php-html-helper-mode "html-helper-mode" "html-helper-mode" t)
(autoload 'php-mode "php-mode" "PHP editing mode" t)
;; (add-auto-mode 'php-mode "\\.php[345]?\\'\\|\\.phtml\\." "\\.(inc|tpl)$" "\\.module$")

;; (load "~/.emacs.d/site-lisp/nxhtml/autostart.el")
;; (autoload 'html-mumamo "~/.emacs.d/site-lisp/nxhtml/autostart.el")
;; ;; (autoload 'django-html-mumamo "~/.emacs.d/site-lisp/nxhtml/autostart.el")
;; (autoload 'smarty-html-mumamo "~/.emacs.d/site-lisp/nxhtml/autostart.el")
;; ;; (autoload 'jinja-html-mumamo "jinja.el")
;; (require 'mumamo-fun)
;; (require 'jinja)

;; (setq
;;  nxhtml-global-minor-mode t
;;  mumamo-chunk-coloring 'submode-colored
;;  ;; mumamo-background-colors nil
;;  nxhtml-skip-welcome t
;;  indent-region-mode t
;;  rng-nxml-auto-validate-flag nil
;;  nxml-degraded t)

(setq auto-mode-alist
      (append '(("\\.x[ms]l\\'" . nxml-mode)
                ;; ("\\.[sx]?html?\\'" . html-mumamo)
                ;; ("\\.tpl\\'" . smarty-html-mumamo)
                ;; ("\\.php\\'" . html-mumamo)
                ;; ("\\.inc\\'" . html-mumamo)
                ("\\.sql\\'" . sql-mode)
                ("\\.css\\'" . css-mode)
                ("\\.scss\\'" . scss-mode)
                ("\\.js\\'" . javascript-mode)
                ("\\.json\\'" . javascript-mode))
              auto-mode-alist))


;; (require 'zencoding-mode)
;; (add-hook 'html-mumamo-mode-hook 'zencoding-mode)
;; (define-key html-mumamo-mode-map (kbd "C-j") 'zencoding-expand-line)
;; (define-key smarty-html-mumamo-mode-map (kbd "C-j") 'zencoding-expand-line)


(provide 'init-web)
