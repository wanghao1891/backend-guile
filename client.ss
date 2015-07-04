(use-modules (ice-9 popen))
(use-modules (ice-9 rdelim))

(let ((s (socket PF_INET SOCK_STREAM 0)))
  (connect s AF_INET (inet-pton AF_INET "192.168.56.3") 8000)
  (display "GET / HTTP/1.0\r\n\r\n" s)

  (do ((line (read-line s) (read-line s)))
      ((eof-object? line))
    (display line)
    (newline)))
