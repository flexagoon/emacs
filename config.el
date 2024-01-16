(setq default-frame-alist '((undecorated . t)))

(add-to-list 'default-frame-alist '(drag-internal-border . 1))
(add-to-list 'default-frame-alist '(internal-border-width . 5))

;; Everforest theme
(setq doom-theme 'doom-everforest)
(setq doom-everforest-background "medium")

;; IBM Plex Mono with extra symbols 󰋇 󰇳 󰋇 
(setq doom-font (font-spec :family "BlexMono Nerd Font" :size 16))

(setq display-line-numbers-type 'relative)

(map! "C-/" #'evilnc-comment-or-uncomment-lines)

(map! :leader
      "s" #'save-buffer
      "l" doom-leader-search-map)

(defun temp-dir ()
  "Open a new temporary directory"
  (interactive)
  (dired (make-temp-file "emacs." t))
  (call-interactively #'find-file))

(map! :map 'doom-leader-file-map
      "t" #'temp-dir)

(map! :localleader
      :mode 'python-mode
      ("p" #'poetry))

(after! python
  (setq
   lsp-pylsp-plugins-flake8-enabled nil
   lsp-pylsp-plugins-pylint-enabled t
   lsp-pylsp-plugins-pylint-args ["--init-hook='import pylint_venv; pylint_venv.inithook()'"
                                  "--max-line-length=88"
                                  "--enable=all"
                                  "--enable-all-extensions"]))

(use-package! grip-mode
  :defer t
  :custom
  (grip-preview-use-webkit nil))

(use-package! magit
  :defer t
  :config
  (map! :map 'doom-leader-git-map
        "p" #'magit-push-current-to-upstream))

(use-package! evil-motion-trainer
  :defer t
  :config
  (global-evil-motion-trainer-mode 1))
