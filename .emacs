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
