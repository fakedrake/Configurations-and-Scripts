;;;; -*- mode: emacs-lisp -*-

;;; Εκκίνηση του server, που επιτρέπει σύνδεση emacsclient. Για κάτι αντίστοιχο
;;; του vi σε editing στο τερματικό, δες το zile (είναι standalone).

;;; Το winner mode είναι ένα καθολικό minor mode για πλοήγηση και διαχείριση
;;; παραθύρων (windows) εντός του emacs. Μην ξεχνάς ότι το "παράθυρο" του X
;;; καταλαμβάνεται από ένα emacs frame.
;;; (winner-mode t)

;;; Επιλογή γραμματοσειράς. Προσωπικά χρησιμοποιώ μόνο τις 6x13 και 7x14. Για μια
;;; λίστα των επιλογών δώσε M-x set-default-font TAB TAB... Εναλλακτικά, Shift +
;;; αριστερό κλικ.
(set-default-font "7x14")

;;; Καλό για εύρεση λαθών από compiler warnings και errors.
(column-number-mode t)

;;; Τα επόμενα ουσιαστικά θέτουν την greek ως την πρωτεύουσα εναλλακτική μέθοδο
;;; εισαγωγής. Σημειωτέον οτι δεν είναι η μοναδική για τα ελληνικά (M-x
;;; list-input-methods -- όπως θα δείς έχει και πολυτονικό), ενώ εξαιρετική είναι
;;; και η TeX (δοκίμασε να εισάγεις με αυτήν: "\int \maltese \c_1". Μην ξεχνάς
;;; όμως και την εντολή ucs-insert (C-x 8 RET (+ TAB για λίστα)).
(set-input-method 'greek)
(toggle-input-method)

;;; Αυτόματη ενημέρωση των buffer σε τυχόν αλλαγή των αρχείων στο δίσκο.
(global-auto-revert-mode t)

;;; Ό,τι λέει η εντολή (π.χ. εκτέλεση interactive εντολής (M-x ...) κατά τη
;;; διάρκεια αναζήτησης (C-s ή C-r) -- δηλαδή minibuffer του minibuffer).
(setq enable-recursive-minibuffers t)

;;; Για αυτόματη εφαρμογή major mode στο άνοιγμα αρχείων με την αντίστοιχη
;;; κατάληξη.
(setq auto-mode-alist
      (append '(("\\.pl$" . prolog-mode) ("\\.m$" . octave-mode)
                ("\\.imath$" . imath-mode) ("\\.gp$" . gnuplot-mode)
                ("\\.ly$" . LilyPond-mode) ("\\.*ml$" . nxml-mode) ("\\.pt$" . html-mode)
                ("\\.Rnw$" . latex-mode))
              auto-mode-alist))

;;; Για recursive πρόσθεση καταλόγων κάτω από τον "~/.emacs-lisp" στο load-path.
;;; (progn (cd "~/.emacs-lisp")
;;;        (normal-top-level-add-subdirs-to-load-path)
;;;        (cd "~"))

;;; Κατά τη γνώμη μου κάνουν το scrolling πιο ευχάριστο
(setq scroll-conservatively 1000
      scroll-preserve-screen-position t)

;;; Ido mode
;; (ido-mode t)
;; (ido-everywhere t)
;; (setq ido-enable-flex-matching t
;;       ido-auto-merge-delay-time 1000)

;;; Αυτόματη προσθήκη της κατάστασης της μπαταρίας στη mode line, σε περίπτωση
;;; που δεν είναι φορτισμένη.
(require 'battery)
(setq automatic-display-of-battery-info
      (run-with-timer 0 60 #'(lambda ()
                               (let ((state (cdr (assoc ?B (battery-linux-proc-acpi)))))
                                 (display-battery-mode (if (string= state "charged") -1 1))))))
(setq battery-update-interval 10)

;;; Πλοήγηση στα παράθυρα. Εάν γίνει καμιά βλακεία, μην ξεχνάς τις winner-undo,
;;; winner-redo.

;; (global-set-key (kbd "M-F") 'windmove-right)
;; (global-set-key (kbd "M-B") 'windmove-left)
;; (global-set-key (kbd "M-P") 'windmove-up)
;; (global-set-key (kbd "M-N") 'windmove-down)

;;; Να ψεύγει το τρωκτικό από τη μέση...
;;; (mouse-avoidance-mode 'banish)

;;; Οι hooks είναι λίστες συναρτήσεων που εκτελούνται με τη σειρά μετά από
;;; κάποιο συγκεκριμένο γεγονός. Παραδείγματα:
(add-hook 'help-mode-hook 'scroll-lock-mode)
(add-hook 'info-mode-hook 'scroll-lock-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)

;;; Θέλουμε το LaTeX να παράγει pdf και όχι dvi.
(eval-after-load "tex" '(TeX-global-PDF-mode t))

;;; Αυτήν πρέπει ήδη να την ξέρεις.
(global-set-key (kbd "<Scroll_Lock>") 'scroll-lock-mode)

;;;; Τέλος, και σημαντικότερο απ' όλα: 'C-h ?'

(provide 'aris)

;; Local Variables:
;; fill-column: 80
;; End:
