(require 'demo-it)
(require 'org-tree-slide)

(setq my-demo/ejemplos-dir (expand-file-name "ejemplos"))


;; funciones para esta presentación

(defun my-demo-step/show-code ()
  "funciones que muestran algo de código y avanza
la presentación al mismo tiempo"
  ;;(demo-it-load-side-window "ejemplos/ejemplo.py")
  (demo-it-presentation-advance))

(defun limpiar ()
  (interactive)
  (ignore-errors
    (kill-buffer "prueba.org")
    (kill-buffer "prueba1.org")
    (kill-buffer "prueba2.org")
    (kill-buffer "prueba3.org")
    (kill-buffer "titulo.org")
    (kill-buffer "fin.org")))

(defun titulo()
  "Muestra el título de la presentación"
  (demo-it-title-screen "titulo.org" 3))

(defun final()
  "Muestra el título de la presentación"
  (demo-it-title-screen "fin.org" 3))



;; Funciones para esta presentación

(demo-it-create :advance-mode :fullscreen
                :insert-fast :show-block-headers
                (titulo)
                (demo-it-presentation "literate-devops.org")
                (demo-it-load-file "pruebas/prueba.org")
                (demo-it-insert "#+TITLE:\n#+AUTHOR:\n#+EMAIL:\n\n\n")
                (demo-it-insert "* Prueba sencilla\n\n")
                (demo-it-insert "Ejecutando comando para ver el listado de ficheros y directorios:\n\n")
                (demo-it-insert "#+BEGIN_SRC sh\nls -la\n#+END_SRC")
                (goto-line 10)
                (end-of-line)
                (demo-it-insert " :exports code")
                (forward-line 2)
                (mark-whole-buffer)
                (delete-active-region)
                (demo-it-presentation-return)
                (demo-it-load-file "pruebas/prueba1.org")
                (demo-it-insert "#+TITLE:\n#+AUTHOR:\n#+EMAIL:\n\n\n")
                (demo-it-insert "* Documentando tanto código como resultado\n\n")
                (demo-it-insert "Saber si existe un usuario en concreto con el comando id:\n\n")
                (demo-it-insert "#+BEGIN_SRC sh\nid maxxcan\n#+END_SRC")
                (goto-line 10)
                (end-of-line)
                (demo-it-insert " :exports both")
                (demo-it-insert " :results code")
                (demo-it-presentation-return)
                (demo-it-load-file "pruebas/prueba2.org")
                (demo-it-insert "#+TITLE:\n#+AUTHOR:\n#+EMAIL:\n\n\n")
                (demo-it-insert "* Exportando código y documentación\n\n")
                (demo-it-insert "Instalando un servidor django con virtualenv\n\n")
                (demo-it-insert "#+BEGIN_SRC sh\nvirtualenv demo\nsource demo/bin/activate\npip install django\n#+END_SRC")
                (goto-line 10)
                (end-of-line)
                (demo-it-insert " :exports code")
                (demo-it-insert " :results code")
                (demo-it-insert " :tangle yes")
                (demo-it-presentation-return)
                (demo-it-load-file "pruebas/prueba3.org")
                (demo-it-insert "#+TITLE:\n#+AUTHOR:\n#+EMAIL:\n\n\n")
                (demo-it-insert "* Ejecutando comandos en un servidor\n\n")
                (demo-it-insert "Ejecutando comando para ver el listado de ficheros y directorios:\n\n")
                (demo-it-insert "#+BEGIN_SRC sh\nls -la\n#+END_SRC")
                (goto-line 10)
                (end-of-line)
                (demo-it-insert " :dir /ssh:maxxcan@servbiob.inf.um.es:/home/asoler/maxxcan")
                (goto-line 1)
                (demo-it-presentation-return)
                (demo-it-load-file "ejemplo-final.org")
                (demo-it-presentation-return)
                (final)
                )


(limpiar)

(demo-it-start)


