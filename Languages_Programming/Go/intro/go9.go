package main

import ("fmt"
        "net/http")

func indexHandler(w http.ResponseWriter, r *http.Request){
  fmt.Fprintf(w, "<h2>Hello World, again!</h2>")
  fmt.Fprintf(w, "<p>Hello World, again!</p>")
  fmt.Fprintf(w, "<p>Get some %s in your stuff, in a way that I don't like.</p>", "vars") // passing variables with %s

  fmt.Fprintf(w, `<h2>Hello World, again!</h2>
    <h3>Hiaa</h3>
<h4>Hellooooo</h4> `) // Multi line print

}

func main(){
  http.HandleFunc("/", indexHandler)
  http.ListenAndServe(":8000", nil)
}
