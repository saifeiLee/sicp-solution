(define (lookup given-key set-of-records)
    (if (null? set-of-records)
        false
        (let ((record (entry set-of-records)))
            (let ((k (key record)))
                (cond ((= k given-key) (record))
                    ((< k given-key)
                    (lookup given-key (left-branch set-of-records)))
                    (else
                    (lookup given-key (right-branch set-of-records))))))))
