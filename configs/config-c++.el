(use-package cquery
  :init
  (progn
    (spacemacs|add-company-backends :backends company-lsp :modes c-mode-common)
    (spacemacs/add-to-hooks #'lsp-cquery-enable '(c-mode-hook c++-mode-hook))
    (dolist (mode '(c-mode c++-mode))
      (spacemacs/declare-prefix-for-mode mode
        "ml" "lsp")
      (spacemacs/declare-prefix-for-mode mode
        "mh" "hierarchy")
      (evil-leader/set-key-for-mode mode
        ;; ","  #'xref-find-references
        ;; "."  #'xref-find-definitions
        ;; "'"  #'xref-find-definitions-other-window
        ;; "/"  #'xref-pop-marker-stack
        ;;"a"  #'xref-find-apropos
        "hm" #'cquery-member-hierarchy
        "hi" #'cquery-inheritance-hierarchy
        "hc" #'cquery-call-hierarchy
        "ll" #'lsp-ui-imenu
        "lr" #'lsp-rename
        "." #'lsp-ui-peek-find-definitions
        "," #'lsp-ui-peek-find-references
        "[" #'lsp-ui-peek-jump-backward
        "]" #'lsp-ui-peek-jump-forward
        )))
  :config
  (setq cquery-executable "/usr/local/bin/cquery")
  )


(use-package gdb-mi
  :init
    (progn
      (setq
       ;; use gdb-many-windows by default when `M-x gdb'
       gdb-many-windows t
       ;; Non-nil means display source file containing the main routine at startup
       gdb-show-main t)
      (require 'compile)
      (dolist (mode '(c-mode c++-mode))
        (spacemacs/set-leader-keys-for-major-mode mode
          "dd" 'gdb
          "dc" 'gud-cont
          "dn" 'gud-next
          "ds" 'gud-step
          "db" 'gud-break
          "dB" 'gud-remove
          "dr" 'gud-go
          "da" 'gdb-io-eof
          "dk" 'gud-up
          "dj" 'gud-down
          "du" 'gud-until
          ))))



(provide 'config-c++)
