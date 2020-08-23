;;; zola.el --- description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 @MaterialFuture
;;
;; Author: MaterialFuture <http://github/MaterialFuture>
;; Maintainer: MaterialFuture <http://github/MaterialFuture>
;; Created: August 18, 2020
;; Modified: August 18, 2020
;; Version: 0.0.2
;; Keywords: zola
;; Homepage: https://github.com/MaterialFuture/zola
;; Package-Requires: ((emacs 26.3) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  description
;;
;;; Code:

(defgroup zola nil
  "Support for Zola static site generator."
  :tag "zola"
  :group 'tools)

(defcustom zola-executable (or (executable-find "zola") "/usr/bin/zola")
  "The location of the Zola executable."
  :group 'zola
  :tag "Zola Executable"
  :type 'string)

(defcustom zola-default-server-url "127.0.0.1"
  "Local URL of Zola HTTP server (zola serve)."
  :group 'zola
  :tag "Default Zola Web Server URL"
  :type 'string)

(defcustom zola-default-server-port 1111
  "Port number of Zola HTTP server (zola serve)."
  :group 'zola
  :tag "Default Zola Web Server Port"
  :type 'integer)

(defvar buff-command "zola serve")
(defvar buff-name nil)

;;;###autoload
(defun zola-start-server (hostname port)
  "Run Zola with zola serve in minibuffer.
`HOSTNAME': Hostname or IP address you want the web server to be.
`PORT': Port to be used to zola serve.

Project root directory is found via Magit when none is specified."
  (interactive
   (list
    (read-string "Hostname: " zola-default-server-url)
    (read-number "Port: " zola-default-server-port)))
  (setq buff-command (format "zola serve -u %s -p %s" hostname port))
  (setq buff-name (format "Zola Server on %s:%s" hostname port))
  (start-process-shell-command
   "Start server"
   buff-name
   buff-command))
;; TODO: Refactor the (start-process-shell-command)

;;;###autoload
(defun zola-stop-server (&optional process)
  "Kill the Zola PROCESS that you started with (zola-start-server) or otherwise."
  (interactive
   (list
    (read-string "Process: " "zola")))
  (setq buff-command (format "pkill %s" process))
  (setq buff-name "Killed Process")
  (start-process-shell-command
   "Stop Process"
   buff-name
   buff-command))

(provide 'zola)
;;; zola.el ends here
