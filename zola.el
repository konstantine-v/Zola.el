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

;;;###autoload
(defgroup zola nil
  "Support for Zola static site generator."
  :tag "zola"
  :group 'tools)

(defcustom zola-executable (or (executable-find "zola") "/usr/bin/zola")
  "The location of the Zola executable."
  :group 'zola
  :tag "Zola Executable"
  :type 'string)

;;;###autoload
(defun zola-run-zola-serve (hostname port &optional project-dir) ;TODO: Rename function to something better
  "Run Zola with zola serve in minibuffer.
`HOSTNAME': Hostname or IP address you want the web server to be.
`PORT': Port to be used to zola serve.
`PROJECT-DIR': Path to Project root directory.

Project root directory is found via Magit when none is specified."
  (interactive
   (list
    (read-string "Hostname: " "127.0.0.1")
    (read-number "Port: " 1111)))
  (shell-command-to-string (format "zola serve -u %s -p %d" hostname port)))
;; NOTE: Zola server starts but hangs after it successfully starts the server.
;; TODO: Add confirmation (message) to the buffer to let user know what is going on
;; TODO: Add command to shutdown server like (defun zola-stop-server)

(provide 'zola)
;;; zola.el ends here
