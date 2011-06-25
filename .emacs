``` emacslisp
;; -------------------------------------------------------------------------
;; .emacs - Nando's dot emacs
;;
;; Hernando Furlan
;; http://www.nandox.com - http://about.nandox.com
;;
;; Must create these directories first:
;;
;; ~/.emacs.semanticdb
;; ~/.emacs.backups
;;
;; -------------------------------------------------------------------------

;; Uncomment to load installed dot emacs extensions ONLY if you're Gentoo user (I was a Gentoo user that's why)
;; (load "/usr/share/emacs/site-lisp/site-gentoo")

;; My full name
(setq user-full-name "Daniel Fernandez")

;; My email
(setq user-mail-address "danielmail7 at gmail dot com")

;; My website/s
(setq user-website "http://www.espiritunomada.sytes.net - http://about.espiritunomada.sytes.net")

;; Save place
(require 'saveplace)
(setq-default save-place t)

;; Indent should not insert tabs
(setq-default indent-tabs-mode nil)

;; Prevent semantic.cache into entire hard disk
(setq semanticdb-default-save-directory "~/.emacs.semanticdb")

;; Autosave
(setq auto-save-default t) ; Yes auto save good!
(setq auto-save-interval 100) ; Number of input chars between auto-saves
(setq auto-save-timeout 300) ; Number of seconds idle time before auto-save

;; Backups (This saved my life a bunch of times!)
(setq make-backup-files t)
(setq backup-by-copying t) ; Don't clobber symlinks
(setq backup-directory-alist '(("." . "~/.emacs.backups"))) ; Don't litter my fs tree
(setq delete-old-versions t) ; Clean up a little
(setq kept-new-versions 6) ; Keep 6 new
(setq kept-old-versions 2) ; Keep only 2 old
(setq version-control t) ; Use versioned backups

;;Copy and Paste with other programs
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; Filetypes & modes
(setq auto-mode-alist
(append '(("\\.C$" . c++-mode)
("\\.cc$" . c++-mode)
("\\.cpp$" . c++-mode)
("\\.cxx$" . c++-mode)
("\\.hxx$" . c++-mode)
("\\.hpp$" . c++-mode)
("\\.h$" . c++-mode)
("\\.hh$" . c++-mode)
("\\.idl$" . c++-mode)
("\\.ipp$" . c++-mode)
("\\.c$" . c-mode)
("\\.pl$" . perl-mode)
("\\.pm$" . perl-mode)
("\\.java$" . java-mode)
("\\.inc$" . php-mode)
("\\.php$" . php-mode)
("\\.txt$" . text-mode)
("\\.wiki$" . mediawiki-mode))
;("\\.m$" . octave-mode))
auto-mode-alist))

;; I like tabs to 4 chars :P
(setq default-tab-width 4)

;; Some edition values fine-tuning
(setq c-mode-common-hook
(function (lambda ()
(setq c-basic-offset 4)
(setq c-comment-only-line-offset 0)
(setq c-indent-level 4)
(setq c-brace-imaginary-offset 0)
(setq c-brace-offset 0)
(setq c-argdecl-indent 0)
(setq c-label-offset -2)
(setq c-continued-statement-offset 0)
(setq c-continued-brace-offset -4)
(setq c-tab-always-indent t)
(setq tab-width 4)
(line-number-mode 1)
(c-set-offset 'member-init-intro 2)
(c-set-offset 'substatement-open 0)
(c-set-offset 'case-label 2)
(c-set-offset 'access-label -2)
(c-set-offset 'label 2)
(c-set-offset 'statement-case-intro 2)
(c-set-offset 'brace-list-entry 0)
(c-set-offset 'knr-argdecl-intro 0)
))
)

;; Displays name of current function in modeline
(which-function-mode)

;; Make pgup/dn remember current line
(setq scroll-preserve-screen-position t)

;; Replace "yes or no" prompt with "y or n" prompt
(defun yes-or-no-p (arg)
"Allows letters 'y' or 'n' in response to prompts asking for either 'yes' or 'no'."
(y-or-n-p arg))

;; Don't wrap long lines
;(set-default 'truncate-lines t)

;; Line numbering
(require 'linum)
(global-linum-mode 1)

;;On-the-fly syntax checker
;(require 'flymake)
;(add-hook 'find-file-hook 'flymake-find-file-hook)

(when (load "flymake" t)
 (defun flymake-pyflakes-init ()
 (let* ((temp-file (flymake-init-create-temp-buffer-copy
 'flymake-create-temp-inplace))
 (local-file (file-relative-name
 temp-file
 (file-name-directory buffer-file-name))))
 (list "pyflakes" (list local-file))))

 (add-to-list 'flymake-allowed-file-name-masks
 '("\\.py\\'" flymake-pyflakes-init)))

;; Make searches case insensitive
(setq case-fold-search t)

;;(standard-display-european +1)
(set-input-mode (car (current-input-mode))
(nth 1 (current-input-mode))
0)

;; No sounds! visual beep for me please...
(setq visible-bell t)

;; Always end a file with a newline
(setq require-final-newline t)

;; No toolbar for X (if Xemacs of course!)
;(tool-bar-mode . nil)

;; No scrollbar
 (set-scroll-bar-mode nil)

; Hide menu bar
;(menu-bar-mode -1)

;; Put column number into modeline
(column-number-mode 1)

;; Display clock on global modeline
(display-time)

;; Toggle some default configuration
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(LaTeX-indent-environment-list (quote (("verbatim" current-indentation) ("verbatim*" current-indentation) ("array") ("displaymath") ("eqnarray") ("eqnarray*") ("equation") ("equation*") ("picture") ("tabbing") ("table") ("table*") ("tabular") ("tabular*"))))
 '(LaTeX-item-indent 2)
 '(LaTeX-math-abbrev-prefix "`")
 '(TeX-brace-indent-level 2)
 '(case-fold-search t)
 '(cua-mode t nil (cua-base))
 '(current-language-environment "English")
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(latex-run-command "pdflatex -synctex=1")
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style nil nil (uniquify)))

;; Customize scheme
(set-background-color "gray9") ; Uncomment to avoid transparent background and get a *nice* solid colour
(set-foreground-color "white")
(set-cursor-color "green")
(set-face-foreground 'region "white")
(set-face-background 'region "black")
(set-face-foreground 'modeline "white")
(set-face-background 'modeline "red")
(set-face-foreground 'isearch "white")
(set-face-background 'isearch "red")
(set-face-background 'isearch-lazy-highlight-face "white")
(set-face-background 'isearch-lazy-highlight-face "red")
;; highlight current line
;(global-hl-line-mode 1)
;; To customize the background color
;(set-face-background 'hl-line "green")  ;; Emacs 22 Only


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-builtin-face ((((class color) (background light)) (:foreground "yellow"))))
 '(font-lock-comment-face ((t (:foreground "dim gray" :weight bold))))
 '(font-lock-constant-face ((t (:foreground "lime green"))))
 '(font-lock-function-name-face ((((class color)) (:foreground "brown" :weight bold))))
 '(font-lock-keyword-face ((t (:foreground "DeepSkyBlue2" :weight bold))))
 '(font-lock-preprocessor-face ((t (:foreground "yellow"))))
 '(font-lock-reference-face ((t (:foreground "yellow"))))
 '(font-lock-string-face ((t (:foreground "tomato"))))
 '(font-lock-type-face ((t (:foreground "red" :weight bold))))
 '(font-lock-variable-name-face ((t (:foreground "dark magenta"))))
 '(font-mediawiki-sedate-face ((((class color) (background dark)) (:foreground "gold" :height 2.0 :family "Tiresias PCfont"))))
 '(hl-line ((t (:inherit highlight :background "dim gray"))))
 '(region ((t (:background "red"))))
 '(show-paren-match ((((class color)) (:foreground "white" :background "red")))))

;; Code macros
(global-unset-key "\C-z") ; Turn off this key (Go emacs to background by default)
(global-unset-key "\C-t") ; Remap this key (go-top by default)

;; Replac ordinary search keys by regexp search (if you don't known regexp no problem)
(global-set-key [(control s)] 'isearch-forward-regexp)
(global-set-key [(control meta s)] 'isearch-forward)
(global-set-key [(control r)] 'isearch-backward-regexp)
(global-set-key [(control meta r)] 'isearch-backward)

;; Insert date at this point
(global-set-key "\C-t\C-d" 'insert-date-at-this-point)
(defun insert-date-at-this-point () (interactive)
(insert (format-time-string "%a %b %e, %Y %l:%M %p")))

;; Define copyright/left C style comment
(defun insert-copyleft-cstyle () (interactive)
(insert " * " projectname " - \n")
(insert " * $Id: " (file-name-nondirectory (buffer-file-name)) ",v 1.0" (format-time-string " %Y/%m/%d %H:%M:%S ") "nando Exp $\n")
(insert " *\n")
(insert " * Copyright (C)" (format-time-string " %Y ") "by Hernando Furlan \n")
(insert " * http://www.nandox.com - http://about.nandox.com\n"))

;; Define copyright/left Bash style comment
(defun insert-copyleft-bashstyle () (interactive)
(insert "# " projectname " - \n")
(insert "# $Id: " (file-name-nondirectory (buffer-file-name)) ",v 1.0" (format-time-string " %Y/%m/%d %H:%M:%S ") "nando Exp $\n")
(insert "#\n")
(insert "# Copyright (C)" (format-time-string " %Y ") "by Hernando Furlan \n")
(insert "# http://www.nandox.com - http://about.nandox.com"))

;; Define GPL license for C style comment
(defun insert-license-gpl-multifile-cstyle () (interactive)
(insert " * This file is part of " projectname ".\n")
(insert " *\n")
(insert " * " projectname " is free software; you can redistribute it and/or modify\n")
(insert " * it under the terms of the GNU General Public License as published by\n")
(insert " * the Free Software Foundation; either version 2 of the License, or\n")
(insert " * (at your option) any later version.\n")
(insert " *\n")
(insert " * " projectname " is distributed in the hope that it will be useful,\n")
(insert " * but WITHOUT ANY WARRANTY; without even the implied warranty of\n")
(insert " * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the\n")
(insert " * GNU General Public License for more details.\n")
(insert " *\n")
(insert " * You should have received a copy of the GNU General Public License\n")
(insert " * along with " projectname "; if not, write to the Free Software\n")
(insert " * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA\n"))

;; Define GPL license for Bash style comment
(defun insert-license-gpl-multifile-bashstyle () (interactive)
(insert "# This file is part of " projectname ".\n")
(insert "#\n")
(insert "# " projectname " is free software; you can redistribute it and/or modify\n")
(insert "# it under the terms of the GNU General Public License as published by\n")
(insert "# the Free Software Foundation; either version 2 of the License, or\n")
(insert "# (at your option) any later version.\n")
(insert "#\n")
(insert "# " projectname " is distributed in the hope that it will be useful,\n")
(insert "# but WITHOUT ANY WARRANTY; without even the implied warranty of\n")
(insert "# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the\n")
(insert "# GNU General Public License for more details.\n")
(insert "#\n")
(insert "# You should have received a copy of the GNU General Public License\n")
(insert "# along with " projectname "; if not, write to the Free Software\n")
(insert "# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA\n"))

;; C/C++ file header
(global-set-key "\C-t\C-c\C-h" 'insert-c-file-header)
(defun insert-c-file-header () (interactive)
(defvar projectname (read-string "Project name? "))
(insert "/*\n")
(insert-copyleft-cstyle)
(insert " *\n")
(insert-license-gpl-multifile-cstyle)
(insert " */\n")
(insert "\n")
(insert "#include \n")
(insert "#include \n")
(insert "#include \n")
(insert "\n")
(insert "int main(int argc, char *argv[]) {\n")
(insert "\n")
(insert "}\n"))

;; C/C++ function header
(global-set-key "\C-t\C-c\C-f" 'insert-c-function-header)
(defun insert-c-function-header () (interactive)
(insert "/*\n")
(insert " * short desc\n")
(insert " *\n")
(insert " * long desc\n")
(insert " */\n")
(insert "int function(void) {\n")
(insert "\n")
(insert "\n")
(insert " return(1);\n")
(insert "}\n")
(insert "\n"))

;; PHP file header
(global-set-key "\C-t\C-p\C-h" 'insert-php-file-header)
(defun insert-php-file-header () (interactive)
(defvar projectname (read-string "Project name? "))
(insert " - http://www.nandox.com\n")
(insert " * @todo none\n")
(insert " **/\n")
(insert "\n")
(insert "\n")
(insert "?>\n"))

;; PHP function header
(global-set-key "\C-t\C-p\C-f" 'insert-php-function-header)
(defun insert-php-function-header () (interactive)
(insert "/**\n")
(insert " * short desc\n")
(insert " *\n")
(insert " * long desc\n")
(insert " * @param void\n")
(insert " * @return null\n")
(insert " * @author Hernando Furlan - http://www.nandox.com\n")
(insert " * @todo none\n")
(insert " **/\n")
(insert "function () {\n")
(insert "\n")
(insert "\n")
(insert " return(1);\n")
(insert "}\n")
(insert "\n"))

;; Perl file header
(global-set-key "\C-t\C-e\C-h" 'insert-perl-file-header)
(defun insert-perl-file-header () (interactive)
(defvar projectname (read-string "Project name? "))
(insert "#!/usr/bin/perl -w\n")
(insert "#!/usr/local/bin/perl -w\n")
(insert "\n")
(insert "# -------------------------------------------------------------------------\n")
(insert-copyleft-bashstyle)
(insert "#\n")
(insert-license-gpl-multifile-bashstyle)
(insert "# -------------------------------------------------------------------------\n")
(insert "\n")
(insert "require 5.004;\n")
(insert "use POSIX;\n")
(insert "use strict;\n")
(insert "\n"))

;; Perl function header
(global-set-key "\C-t\C-e\C-f" 'insert-c-function-header)
(defun insert-c-function-header () (interactive)
(insert "# -------------------------------------------------------------------------\n")
(insert "# short desc\n")
(insert "#\n")
(insert "# long desc\n")
(insert "# -------------------------------------------------------------------------\n")
(insert "sub function {\n")
(insert " my (@argv) = @_;\n")
(insert "\n")
(insert "\n")
(insert " return(1);\n")
(insert "}\n")
(insert "\n"))

;; SQL Text comment
(global-set-key "\C-t\C-s\C-h" 'insert-sql-file-header)
(defun insert-sql-file-header () (interactive)
(defvar projectname (read-string "Project name? "))
(insert "-- " projectname " - \n")
(insert "-- $Id: " (file-name-nondirectory (buffer-file-name)) ",v 1.0" (format-time-string " %Y/%m/%d %H:%M:%S ") "nando Exp $\n")
(insert "--\n")
(insert "-- Hernando Furlan \n")
(insert "-- http://www.nandox.com - http://about.nandox.com\n")
(insert "\n"))

;; Plain Text header
(global-set-key "\C-t\C-t\C-h" 'insert-plaintext-file-header)
(defun insert-plaintext-file-header () (interactive)
(insert "# -------------------------------------------------------------------------\n")
(insert "# " (file-name-nondirectory (buffer-file-name)) " - \n")
(insert "# Hernando Furlan \n")
(insert "# http://www.nandox.com - http://about.nandox.com\n")
(insert "# -------------------------------------------------------------------------\n")
(insert "\n"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LaTeX
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; aspell checker
(setq-default ispell-program-name "aspell")
(setq-default ispell-extra-args '("--mode=tex"))
;; spellcheck in LaTex mode
(add-hook `latex-mode-hook `flyspell-mode)
(add-hook `tex-mode-hook `flyspell-mode)
(add-hook `bibtex-mode-hook `flyspell-mode)
;; Mathematics in AUCTeX automatically
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(setq TeX-PDF-mode t)



 (defun pdf-with-okular ()
  (add-to-list 'TeX-output-view-style
  (quote ("^pdf$" "." "okular %o %(outpage)"))))

 (add-hook 'LaTeX-mode-hook 'pdf-with-okular t)
 (setq TeX-view-program-list '(("Okular" "okular %o")))
 (setq TeX-view-program-selection '((output-pdf "Okular") (output-dvi "Okular")))

 (server-start)





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; XML
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; inicialización del modo nxml
(setq load-path
  (append load-path '("/usr/share/emacs/site-lisp/nxml-mode/")))

(load "/usr/share/emacs/site-lisp/nxml-mode/rng-auto.el")

;; cargar nxml para archivos xml, xsl, rng y xhtml
(setq auto-mode-alist
  (cons '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode)
    auto-mode-alist))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;Python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(add-to-list 'load-path "/home7daniel/.elisp")
;;carpeta con autocomplete-mode
(add-to-list 'load-path "~/.emacs.d/vendor")
(progn (cd "~/.emacs.d/vendor")
       (normal-top-level-add-subdirs-to-load-path))

;;configuracion de http://www.enigmacurry.com/2009/01/21/autocompleteel-python-code-completion-in-emacs/
(require 'python)
(require 'ipython)
(setq ipython-command "/usr/bin/ipython")
(require 'python-pep8)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(require 'python-pylint)
(require 'auto-complete)
(require 'yasnippet)

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; Auto-indentation
(add-hook 'python-mode-hook '(lambda () (define-key python-mode-map "\C-m" 'newline-and-indent)))

;; Initialize Pymacs
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
;; Initialize Rope
(pymacs-load "ropemacs" "rope-")
(setq ropemacs-enable-autoimport t)
;; Initialize Yasnippet
;Don't map TAB to yasnippet
;In fact, set it to something we'll never use because
;we'll only ever trigger it indirectly.
(setq yas/trigger-key (kbd "C-c <kp-multiply>"))
(yas/initialize)
(defun ac-yasnippet-candidate-1 (table)
  (let ((hashtab (yas/snippet-table-hash table))
        (parent (yas/snippet-table-parent table))
        candidates)
    (maphash (lambda (key value)
               (push key candidates))
             hashtab)
    (setq candidates (all-completions ac-prefix (nreverse candidates)))
    (if parent
        (setq candidates
              (append candidates (ac-yasnippet-candidate-1 parent))))
    candidates))

(defun ac-yasnippet-candidate ()
  (let ((table (yas/snippet-table major-mode)))
    (if table
        (ac-yasnippet-candidate-1 table))))

(defface ac-yasnippet-candidate-face
  '((t (:background "sandybrown" :foreground "black")))
  "Face for yasnippet candidate.")

(defface ac-yasnippet-selection-face
  '((t (:background "coral3" :foreground "white")))
  "Face for the yasnippet selected candidate.")

(defvar ac-source-yasnippet
  '((candidates . ac-yasnippet-candidate)
    (action . yas/expand)
    (limit . 3)
    (candidate-face . ac-yasnippet-candidate-face)
    (selection-face . ac-yasnippet-selection-face))
  "Source for Yasnippet.")

(provide 'auto-complete-yasnippet)

;;; bind RET to py-newline-and-indent
;http://jesselegg.com/archives/2010/02/25/emacs-python-programmers-part-1/
(add-hook 'python-mode-hook '(lambda ()
     (define-key python-mode-map "\C-m" 'newline-and-indent)))


(setq-default tab-width 4)
(setq-default py-indent-offset 4)

;;===================================================
;; ;;anything.el and anything-show-completion.el
 (require 'anything)
 (require 'anything-ipython)

 (when (require 'anything-show-completion nil t)
     (use-anything-show-completion 'anything-ipython-complete
                                   '(length initial-pattern)))
;; anything setup
;(require 'anything-config)
(global-set-key "\C-u" 'anything)
(global-set-key "\C-c\C-u" 'universal-argument)
;; (setq anything-sources '(anything-c-source-buffers+
;;        anything-c-source-locate
;;        anything-c-source-recentf
;;        anything-c-source-org-headline
;;  			 anything-c-source-buffer-not-found))


;;-------------------------------------------------------------------

;; ======================================================================
 ;; add pylookup to your loadpath, ex) ~/.emacs.d/pylookup
 (setq pylookup-dir "/home/daniel/.emacs.d/pylookup")
 (add-to-list 'load-path pylookup-dir)
;; ;; load pylookup when compile time
 (eval-when-compile (require 'pylookup))

;; set executable file and db file
(setq pylookup-program (concat pylookup-dir "/pylookup.py"))
(setq pylookup-db-file (concat pylookup-dir "/pylookup.db"))

;; to speedup, just load it on demand
(autoload 'pylookup-lookup "pylookup"
  "Lookup SEARCH-TERM in the Python HTML indexes." t)
(autoload 'pylookup-update "pylookup"
  "Run pylookup-update and create the database at `pylookup-db-file'." t)

(setq browse-url-browser-function 'w3m-browse-url) ;; w3m
;self.list_entry = False" in IndexProcessor.__init__


;; (autoload 'pylookup-lookup "pylookup")
;; (autoload 'pylookup-update "pylookup")
;; (setq pylookup-program "/home/daniel/.emacs.d/pylookup/pylookup.py")
;; (setq pylookup-db-file "/home/daniel/.emacs.d/pylookup/pylookup.db")
;; (global-set-key "\C-ch" 'pylookup-lookup)
;;----------------------------------------------------------------------

;;Mercuarial
(require 'mercurial)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Auto-completion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-auto-complete-mode t)
(setq ac-auto-show-menu t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; End Auto Completion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Change comint keys
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'comint)
(define-key comint-mode-map (kbd "M-") 'comint-next-input)
(define-key comint-mode-map (kbd "M-") 'comint-previous-input)

(define-key comint-mode-map [down] 'comint-next-matching-input-from-input)
(define-key comint-mode-map [up] 'comint-previous-matching-input-from-input)



;; ;;=====================================================================
;; ;; autopair.el
  (autoload 'autopair-global-mode "autopair" nil t)
  (autopair-global-mode)
  (add-hook 'lisp-mode-hook
            #'(lambda () (setq autopair-dont-activate t)))

;; ;; For python single and triple quotes
  (add-hook 'python-mode-hook
            #'(lambda ()
                (push '(?' . ?')
                      (getf autopair-extra-pairs :code))
                (setq autopair-handle-action-fns
                      (list #'autopair-default-handle-action
                            #'autopair-python-triple-quote-action))))
;; ;;----------------------------------------------------------------------
;; ;;====================================================================
;; ;; MediaWiki
;;
(require 'mediawiki)
;; ;; ----------------------------------------------------------------

;; ;;====================================================================
;; ;; Octave (and Matlab)
;;
(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
;; ;; ----------------------------------------------------------------

;;Codificacion
;(set-default-coding-systems 'utf8)
;(set-terminal-coding-system 'utf8)


;;;;;; color-theme ;;;;;;;;;;;,
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun mia-python ()
  (interactive)
  (color-theme-install
   '(mia-python
      ((background-color . "#1b1d1b")
      (background-mode . light)
      (border-color . "#000000")
      (cursor-color . "#8cfc4f")
      (foreground-color . "#fafafa")
      (mouse-color . "black"))
     (fringe ((t (:background "#000000"))))
     (mode-line ((t (:foreground "#ffffff" :background "#454545"))))
     (region ((t (:background "#5b5d5b"))))
     (font-lock-builtin-face ((t (:foreground "#dd2cce"))))
     (font-lock-comment-face ((t (:foreground "#737279"))))
     (font-lock-function-name-face ((t (:foreground "#c50216"))))
     (font-lock-keyword-face ((t (:foreground "#2e93ff"))))
     (font-lock-string-face ((t (:foreground "#e46a49"))))
     (font-lock-type-face ((t (:foreground"#86d737"))))
     (font-lock-variable-name-face ((t (:foreground "#2ffe5b"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'mia-python)
(require 'color-theme)
   (setq color-theme-is-global t)
   (mia-python)

(global-hl-line-mode 1)

;; To customize the background color
;(set-face-background 'highlight "#111")  ;; Emacs 21 Only
(set-face-background hl-line-face "black")



(message "Loading of Nando's dot emacs OK!")


(put 'narrow-to-region 'disabled nil)
