;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-inhibit-face-list
   '(font-lock-comment-delimiter-face font-lock-comment-face font-lock-doc-face font-lock-doc-string-face font-lock-string-face font-lock-keyword-face font-lock-type-face))
 '(align-indent-before-aligning t)
 '(auto-insert-alist
   '((("\\.\\([Hh]\\|hh\\|hpp\\|hxx\\|h\\+\\+\\)\\'" . "C / C++ header")
      (replace-regexp-in-string "[^A-Z0-9]" "_"
                                (replace-regexp-in-string "\\+" "P"
                                                          (upcase
                                                           (file-name-nondirectory buffer-file-name))))
      "#ifndef " str n "#define " str n n _ n "#endif" n)
     (("\\.\\([Cc]\\|cc\\|cpp\\|cxx\\|c\\+\\+\\)\\'" . "C / C++ program")
      nil "#include \""
      (let
          ((stem
            (file-name-sans-extension buffer-file-name))
           ret)
        (dolist
            (ext
             '("H" "h" "hh" "hpp" "hxx" "h++")
             ret)
          (when
              (file-exists-p
               (concat stem "." ext))
            (setq ret
                  (file-name-nondirectory
                   (concat stem "." ext))))))
      & 34 | -10)
     (("[Mm]akefile\\'" . "Makefile")
      . "makefile.inc")
     (html-mode lambda nil
                (sgml-tag "html"))
     (plain-tex-mode . "tex-insert.tex")
     (bibtex-mode . "tex-insert.tex")
     (latex-mode "options, RET: " "\\documentclass[" str & 93 | -1 123
                 (read-string "class: ")
                 "}\12"
                 ("package, %s: " "\\usepackage["
                  (read-string "options, RET: ")
                  & 93 | -1 123 str "}\12")
                 _ "\12\\begin{document}\12" _ "\12\\end{document}")
     (("/bin/.*[^/]\\'" . "Shell-Script mode magic number")
      lambda nil
      (if
          (eq major-mode
              (default-value 'major-mode))
          (sh-mode)))))
 '(auto-insert-directory "~/.emacs.d/insert/")
 '(buffers-menu-show-status nil)
 '(c++-font-lock-extra-types
   '("auto" "bit_vector" "const_iterator" "const_reference" "const_reverse_iterator" "(c|w|s|ws)match" "deque" "FILE" "forward_list" "fstream" "hash" "hash_map" "hash_multimap" "hash_multiset" "hash_set" "ifstream" "ios" "istream" "istreambuf" "istrstream" "iterator" "jmp_buf" "lconv" "list" "map" "multimap" "multiset" "ofstream" "ostream" "ostreambuf" "ostrstream" "priority_queue" "queue" "reference" "reverse_iterator" "set" "span" "stack" "string" "strstream" "strstreambuf" "\\sw+_t" "tm" "type_info" "va_list" "vector" "w?regex"))
 '(c++-mode-hook
   '(irony-mode company-mode modern-c++-font-lock-mode
                (lambda nil
                  (local-set-key
                   (kbd "<f6>")
                   'cff-find-other-file))
                (lambda nil
                  (local-set-key
                   (kbd "<f7>")
                   'compile))))
 '(c-backslash-max-column 80)
 '(c-basic-offset 4)
 '(c-cleanup-list
   '(brace-else-brace brace-elseif-brace empty-defun-braces defun-close-semi list-close-comma scope-operator compact-empty-funcall))
 '(c-comment-only-line-offset '(0 . 0))
 '(c-echo-syntactic-information-p t)
 '(c-hanging-braces-alist
   '((defun-open before after)
     (defun-close after)
     (class-open after)
     (block-close . c-snug-do-while)
     (statement-cont)
     (substatement-open after)
     (brace-list-open)
     (brace-list-close)
     (brace-entry-open)
     (extern-lang-open after)
     (namespace-open after)
     (namespace-close after)
     (module-open after)
     (composition-open after)
     (inexpr-class-open after)
     (inexpr-class-close before)
     (arglist-cont-nonempty)))
 '(c-hanging-colons-alist
   '((case-label after)
     (access-label)
     (member-init-intro after)
     (inher-intro)))
 '(c-mode-common-hook
   '(whitespace-cleanup-mode c-toggle-hungry-state c-toggle-auto-newline highlight-numbers-mode highlight-operators-mode highlight-doxygen-mode))
 '(c-mode-hook
   '(irony-mode company-mode
                (lambda nil
                  (local-set-key
                   (kbd "<f6>")
                   'cff-find-other-file))
                (lambda nil
                  (local-set-key
                   (kbd "<f7>")
                   'compile))))
 '(c-noise-macro-names '("ALWAYS_INLINE" "constexpr"))
 '(c-offsets-alist
   '((inline-open . 0)
     (func-decl-cont . +)
     (topmost-intro-cont first c-lineup-topmost-intro-cont c-lineup-gnu-DEFUN-intro-cont)
     (inher-cont . c-lineup-multi-inher)
     (brace-list-intro first c-lineup-2nd-brace-entry-in-arglist c-lineup-class-decl-init-+ +)
     (statement-case-open . 0)
     (substatement-open . 0)
     (case-label . +)
     (namespace-open . 0)))
 '(column-number-mode t)
 '(company-backends
   '(company-irony company-irony-c-headers company-glsl company-keywords))
 '(company-clang-arguments '("-std=c++20"))
 '(company-clang-use-compile-flags-txt t)
 '(company-frontends
   '(company-pseudo-tooltip-unless-just-one-frontend company-echo-metadata-frontend company-preview-if-just-one-frontend))
 '(compilation-always-kill t)
 '(compilation-ask-about-save nil)
 '(compilation-mode-hook '((lambda nil (local-set-key (kbd "<f7>") 'compile))))
 '(compilation-read-command nil)
 '(compilation-scroll-output 'first-error)
 '(compile-command "make ")
 '(compiler-explorer-output-filters
   '(:binary nil :commentOnly t :demangle t :directives t :intel nil :labels nil :libraryCode t :trim nil))
 '(cua-delete-copy-to-register-0 nil)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(tangotango-dko))
 '(custom-safe-themes t)
 '(default-frame-alist '((fullscreen . maximized) (alpha-background . 90)))
 '(display-line-numbers-grow-only t)
 '(ecb-options-version "2.50")
 '(ediff-use-faces nil)
 '(fast-but-imprecise-scrolling t)
 '(fill-column 90)
 '(fira-code-mode-disabled-ligatures
   '("[]" "x" "++" "--" "{-" "-}" "<>" "<-" "and" "or" "lambda"))
 '(font-use-system-font t)
 '(garbage-collection-messages t)
 '(gcmh-mode t)
 '(gcmh-verbose t)
 '(gdb-display-io-nopopup t)
 '(global-ede-mode t)
 '(global-hl-line-mode t)
 '(glsl-additional-built-ins '("gl_FragDepth" "gl_SampleMask"))
 '(highlight-indent-guides-method 'bitmap)
 '(highlight-indent-guides-responsive 'top)
 '(imenu-use-popup-menu t)
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(irony-additional-clang-options '("-std=c++20"))
 '(irony-supported-major-modes '(c++-mode c-mode objc-mode))
 '(jit-lock-defer-time 0.2)
 '(line-number-display-limit 5000)
 '(makefile-mode-hook '((lambda nil (local-set-key (kbd "<f7>") 'compile))))
 '(menu-bar-mode nil)
 '(modern-c++-types
   '("unsigned" "char32_t" "char16_t" "wchar_t" "char8_t" "signed" "double" "short" "float" "void" "long" "char" "bool" "int" "__int128" "__float128"))
 '(mouse-buffer-menu-maxlen 25)
 '(mouse-buffer-menu-mode-mult 10)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount
   '(5
     ((shift)
      . hscroll)
     ((meta)
      . 0.5)
     ((control)
      . text-scale)))
 '(org-capture-templates
   '(("c" "Cookbook" entry
      (file "~/org/recipes/cookbook.org")
      "%(org-chef-get-recipe-from-url)" :empty-lines 2)
     ("m" "Manual Cookbook" entry
      (file "~/org/recipes/cookbook.org")
      "* %^{Recipe title: }\12  :PROPERTIES:\12  :source-url:\12  :servings:\12  :prep-time:\12  :cook-time:\12  :ready-in:\12  :END:\12** Ingredients\12   %?\12** Directions\12\12" :empty-lines 2)))
 '(org-hide-emphasis-markers t)
 '(org-hide-leading-stars t)
 '(org-html-html5-fancy t)
 '(org-html-postamble nil)
 '(org-html-postamble-format
   '(("en" "<p class=\"author\">Author: %a (%e)</p>\12<p class=\"date\">Date: %d</p>")))
 '(org-image-actual-width nil)
 '(org-latex-image-default-width "")
 '(org-support-shift-select t)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("nongnu" . "https://elpa.nongnu.org/nongnu/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(org-chef zoom-window company-irony-c-headers company-irony gnu-elpa-keyring-update license-templates license-snippets vala-mode totp-auth firefox-javascript-repl json-mode js2-mode js-auto-format-mode meson-mode unicode-math-input unicode-escape gcmh dpkg-dev-el dockerfile-mode docker-compose-mode yaml-mode markdown-preview-eww markdown-mode exec-path-from-shell systemd multi-vterm vterm rmsbolt compiler-explorer org-auto-tangle unicode-fonts use-package ini-mode po-mode highlight-parentheses column-enforce-mode highlight-operators highlight-indent-guides auto-highlight-symbol vc-hgcmd lua-mode chess ecb ggtags udev-mode ucs-utils company-glsl glsl-mode company-auctex python-mode mips-mode lisp-extra-font-lock ssh-config-mode modern-cpp-font-lock latex-pretty-symbols latex-unicode-math-mode latex-math-preview fillcode filladapt rebox2 paradox demangle-mode disaster swiper flycheck-clang-tidy company cff highlight-numbers highlight-doxygen whitespace-cleanup-mode))
 '(paradox-github-token t)
 '(prog-mode-hook '(display-line-numbers-mode))
 '(python-mode-hook
   '(#[0 "\10\211\21\207"
         [py--imenu-create-index-function imenu-create-index-function]
         2]
     (lambda nil
       (local-set-key
        (kbd "DEL")
        nil))) t)
 '(python-shell-interpreter "python3")
 '(rebox-style-loop '(21 23 25 27 213 215 223 233 235 241 243))
 '(rmsbolt-asm-format "att")
 '(rmsbolt-automatic-recompile 'on-save)
 '(rmsbolt-command "g++ -std=c++20")
 '(safe-local-variable-values
   '((c-file-offsets
      (innamespace . 0)
      (inextern-lang . 0))
     (c-file-offsets
      (innamespace . 0))
     (encoding . utf-8)
     (c-file-offsets
      (block-close . 0)
      (brace-list-close . 0)
      (brace-list-entry . 0)
      (brace-list-intro . +)
      (case-label . 0)
      (class-close . 0)
      (defun-block-intro . +)
      (defun-close . 0)
      (defun-open . 0)
      (else-clause . 0)
      (inclass . +)
      (label . 0)
      (statement . 0)
      (statement-block-intro . +)
      (statement-case-intro . +)
      (statement-cont . +)
      (substatement . +)
      (topmost-intro . 0))))
 '(scalable-fonts-allowed t)
 '(scroll-conservatively 101)
 '(scroll-margin 3)
 '(sort-fold-case t)
 '(tab-always-indent 'complete)
 '(tool-bar-style 'text-image-horiz)
 '(unicode-fonts-block-font-mapping '(("Letterlike Symbols" ("FreeSans"))))
 '(vterm-max-scrollback 8000)
 '(x-stretch-cursor t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(buffer-menu-buffer ((t nil)))
 '(highlight-operators-face ((t (:inherit font-lock-builtin-face :weight bold))))
 '(hl-line ((t nil)))
 '(linum ((t (:inherit (shadow default) :foreground "#8b8bcd" :family "SauceCodePro Nerd Font Mono"))))
 '(menu ((t nil)))
 '(term-color-blue ((t (:background "blue2" :foreground "#5080ff")))))


;; Enable upcase/downcase functions.
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)


;; MANUAL CONFIGS BELOW THIS LINE

;; Auto install/update packages.
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages t)


;; Extra modes to attach whitespace-cleanup-mode:
;; - glsl
;; - ld-script
;; - asm
;; - python
;; - js2
(add-hook 'glsl-mode-hook 'whitespace-cleanup-mode)
(add-hook 'ld-script-mode-hook 'whitespace-cleanup-mode)
(add-hook 'asm-mode-hook  'whitespace-cleanup-mode)
(add-hook 'python-mode-hook 'whitespace-cleanup-mode)
(add-hook 'js2-mode-hook 'whitespace-cleanup-mode)


;; Always turn on spell-checking for markdown.
(add-hook 'markdown-mode-hook  'flyspell-mode)


;; Use js2-mode for JevaScript.
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook 'js2-imenu-extras-mode)


;; Shortcuts for splitting frames:
;; - <super> + 0: close current view
;; - <super> + 1: close all but the current view
;; - <super> + o: create view below (horizontal split)
;; - <super> + e: create view to the rigt (vertical split)
;; - <super> + 5: close current emacs frame
;; - <ctrl> + <shift> + <tab>: navigate opposite of <ctrl> + <tab>
(keymap-global-set "s-0" 'delete-window)
(keymap-global-set "s-1" 'delete-other-windows)
(keymap-global-set "s-o" 'split-window-below)
(keymap-global-set "s-e" 'split-window-right)
(keymap-global-set "s-5" 'delete-frame)
(keymap-global-set "C-S-<iso-lefttab>" 'switch-prev-window)


(defun switch-prev-window ()
  (interactive)
  (other-window -1))


;; Functions to insert text from templates.

(defun insert-gpl-c ()
  "Insert GPLv3 into a C/C++ source file."
  (interactive)
  (insert-file-contents "~/.emacs.d/insert/gpl-header.h"))

(defun insert-company ()
  "Insert compile_flags.txt rule in a Makefile."
  (interactive)
  (insert-file-contents "~/.emacs.d/insert/company.makefile"))

(defun insert-ac-config ()
  "Insert common autoconf config macros."
  (interactive)
  (insert-file-contents "~/.emacs.d/insert/ac-config.ac"))

(defun insert-ac-cpp ()
  "Insert common autoconf C++ macros."
  (interactive)
  (insert-file-contents "~/.emacs.d/insert/ac-cpp.ac"))

(defun insert-iostream ()
  "Insert C++ iostream using declarations for cout, clog, cerr, endl."
  (interactive)
  (insert-file-contents "~/.emacs.d/insert/iostream.cpp"))

(defun insert-spdx-mit ()
  "Insert SPDX-License-Identifier header for MIT license."
  (interactive)
  (insert-file-contents "~/.emacs.d/insert/spdx-mit.h"))

(defun insert-spdx-gpl ()
  "Insert SPDX-License-Identifier header for GPLv3 license."
  (interactive)
  (insert-file-contents "~/.emacs.d/insert/spdx-gpl.h"))


;; Convenience functions to set up current directory and default compile command.
;; This allows for quick compilation with <F7>.

(defun set-make-here ()
  "Set the compile-command variable to compile in the current directory."
  (interactive)
  (set-variable 'compile-command (format "make -C %s " default-directory))
)

(defun cd-project ()
  "Enter a directory and setup directory for compilation."
  (interactive)
  (call-interactively 'cd)
  (set-make-here)
)


;; Set up irony-mode.
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)


;; Workaround for slow scrolling
(setq auto-window-vscroll nil)


;; Set up unicode-fonts package.
(unicode-fonts-setup)


;; Set copy-paste keys in vterm-mode.
(eval-after-load 'vterm
  '(progn
     (define-key vterm-mode-map (kbd "S-C-v") 'vterm-yank)
     (define-key vterm-mode-map (kbd "S-<insert>") 'vterm-yank)
     ))


;; Set up exec-path-from-sell package.
(when (daemonp)
  (exec-path-from-shell-initialize))

