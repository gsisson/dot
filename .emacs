
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(global-set-key [(f9)] 'set-fill-column) ; F4: call-last-kbd-macro (built-in)
(global-set-key [(f8)] 'set-parm) ; F4: call-last-kbd-macro (built-in)
(defun set-parm ()
  (interactive)
; (insert "<%=parm(:)%>")
  (insert "<p><\%=i(,d,'')%>")
  (backward-char '3)
)

;Mac .emacs
(when (eq system-type 'darwin)
 (add-to-list 'load-path
;     ln "$HOME/Dropbox/_Settings/lisp/dot.emacs" "dot.emacs.LINK"
             "~/Dropbox/_Settings/lisp/")
 (add-to-list 'load-path
             "~/../gsisson/Dropbox/_Settings/lisp/")
   (load "dot.emacs")
)

;PC .emacs
(when (eq system-type 'windows-nt)
   (add-to-list 'load-path
;     ln "$HOME/My Documents/Cloud/Dropbox/_Settings/lisp/dot.s_pc" "dot.emacs_pc.LINK"
             "~/My Documents/Cloud/Dropbox/_Settings/lisp/")
   (load "dot.emacs_pc")
)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "grey50" :foreground "Black" :box 1 :weight extra-bold :height 1.0))))
 '(mode-line-buffer-id ((t (:background "LightBlue" :foreground "Black" :weight bold :height 1.1))))
 '(mode-line-emphasis ((t (:background "Magenta" :foreground "Black" :slant italic)))))
