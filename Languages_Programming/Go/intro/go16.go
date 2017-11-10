package main

import ("fmt"
	     "net/http"
       "html/template")

type NewsAggPage struct {
  Title string
  News string
}

func newsAggHandler(w http.ResponseWriter, r *http.Request) {
  p := NewsAggPage{Title: "News Aggregator", News: "Some jumbo"}
  t, _ := template.ParseFiles("go16basictemplating.html")
  // fmt.Println(t.Execute(w, p)) // To check out the error, if temlate has .Titles
  t.Execute(w, p)
}

func indexHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "<h1>Go is fine I guess</h1>")
}

func main() {
	http.HandleFunc("/", indexHandler)
  http.HandleFunc("/agg/", newsAggHandler)
	http.ListenAndServe(":8000", nil)
}
