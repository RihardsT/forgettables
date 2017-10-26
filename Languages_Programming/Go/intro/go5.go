package main

import ( "fmt"
  "net/http" )

func index_handler(w http.ResponseWriter, r *http.Request) {
  fmt.Fprint(w, "Go go og go")
}

func about_handler(w http.ResponseWriter, r *http.Request) {
  fmt.Fprint(w, "Go some more")
}

func main() {
  http.HandleFunc("/", index_handler)
  http.HandleFunc("/about", about_handler)
  http.ListenAndServe(":8000", nil)
  // localhost:8000
}
