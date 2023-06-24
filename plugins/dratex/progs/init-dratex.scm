
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; MODULE      : init-dratex.scm
;; DESCRIPTION : Initialize DraTex plugin
;; COPYRIGHT   : (C) 2005       Nicolas Ratier
;;               (C) 2019-2020  Darcy Shen
;;
;; This software falls under the GNU general public license version 3 or later.
;; It comes WITHOUT ANY WARRANTY WHATSOEVER. For details, see the file LICENSE
;; in the root directory or <http://www.gnu.org/licenses/gpl-3.0.html>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (dratex-serialize lan t)
    (with u (pre-serialize lan t)
      (with s (texmacs->code (stree->tree u) "SourceCode")
        (string-append s "\n<EOF>\n"))))

(define (dratex-entry)
  (if (url-exists? "$TEXMACS_HOME_PATH/plugins/tmpy")
      (system-url->string "$TEXMACS_HOME_PATH/plugins/tmpy/session/tm_dratex.py")
      (system-url->string "$TEXMACS_PATH/plugins/tmpy/session/tm_dratex.py")))

(define (dratex-launcher)
  (string-append (python-command) " " (dratex-entry)))

(plugin-configure dratex
  (:require (python-command))
  (:require (url-exists-in-path? "latex"))
  (:launch ,(dratex-launcher))
  (:serializer ,dratex-serialize)
  (:session "DraTex"))
