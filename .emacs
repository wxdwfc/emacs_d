;; set update sites
;;------------------------------------------------

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;;------------------------------------------------w
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete-clang");

;;------------------------------------------------w
;; set  time
(display-time) ;


;;------------------------------------------------w

;;------------------------------------------------w
;;paren match
(show-paren-mode 1)

;;------------------------------------------------w


;;------------------------------------------------
;; This line is set to display the line number
 (global-linum-mode 1) ; 
;;------------------------------------------------


;;------------------------------------------------
;; set color themes

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(setq molokai-theme-kit t)

(load-theme 'molokai t )

;;------------------------------------------------



;; set c-j to goto line
(global-set-key (kbd "C-j") 'goto-line)

;;------------------------------------------------

;; setting c environment

;;; yasnippet
;;; should be loaded before auto complete so that they can work together
(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.8.0");;

(require 'yasnippet)
(yas-global-mode 1)

(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20140824.1658");;
(add-to-list 'load-path "~/.emacs.d/elpa/popup-20140815.629");
;;; auto complete mod
;;; should be loaded after yasnippet so that they can work together

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20140824.1658/dict")

(require 'auto-complete-clang)
(setq ac-auto-start nil)
(setq ac-quick-help-delay 0.5)
(ac-set-trigger-key "TAB")
;; (define-key ac-mode-map  [(control tab)] 'auto-complete)
;;(define-key ac-mode-map  [(control return)] 'auto-complete)
(defun my-ac-config ()
  (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
  (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (setq ac-clang-flags
      (mapcar (lambda (item)(concat "-I" item))
              (split-string
               "
 /Library/Developer/CommandLineTools/usr/bin/../lib/c++/v1
 /usr/local/include
 /Library/Developer/CommandLineTools/usr/bin/../lib/clang/5.1/include
 /Library/Developer/CommandLineTools/usr/include
 /usr/include
 /Users/wxd/Documents/dev/Programming/lab/WordLadder/StanfordCPPLib"
	       
               )))
  (global-auto-complete-mode t))
(defun my-ac-cc-mode-setup ()
  (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
(add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
;; ac-source-gtags
(my-ac-config)
        


;;------------------------------------------------

;; setting auto pair
(add-to-list 'load-path "~/.emacs.d/plugins") ;; comment if autopair.el is in standard load path 
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers

;;------------------------------------------------

;;------------------------------------------------
;; add j2-mode support
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;;------------------------------------------------
;; add highlight parantheses
(add-to-list 'load-path "~/.emacs.d/elpa/highlight-parentheses-20140620.1258")
(require 'highlight-parentheses)
(highlight-parentheses-mode 1)

;;------------------------------------------------

;;------------------------------------------------

;;------------------------------------------------
