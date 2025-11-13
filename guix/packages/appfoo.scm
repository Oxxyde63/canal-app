(define-module (canal-app packages appfoo)
  #:use-module (guix packages)
  #:use-module (guix build-system trivial)
  #:use-module (gnu packages)
  #:use-module (gnu packages base)
  #:use-module (canal-base packages libfoo))  ;; ← dépendance inter-canal

(define-public appfoo
  (package
    (name "appfoo")
    (version "1.0")
    (source #f)
    (build-system trivial-build-system)
    (inputs (list libfoo))
    (arguments
     '(#:builder (begin
                   (use-modules (guix build utils))
                   (mkdir-p %output)
                   (call-with-output-file (string-append %output "/appfoo.txt")
                     (lambda (p)
                       (display "Appfoo built with libfoo!\n" p))))))
    (synopsis "Fake app depending on libfoo")
    (description "Demonstration package depending on libfoo from another channel.")
    (license gpl3+)
    (home-page "https://example.org/appfoo")))
