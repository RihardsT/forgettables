package main

import (
	"encoding/xml"
	"fmt"
	"html/template"
	"io/ioutil"
	"net/http"
	"sync"
)

var wg sync.WaitGroup

type SitemapIndex struct {
	Locations []string `xml:"sitemap>loc"` // get loc tag under sitemap tag
}

type News struct {
	Titles    []string `xml:"url>news>title"`
	Keywords  []string `xml:"url>news>keywords"`
	Locations []string `xml:"url>loc"`
}

type NewsMap struct {
	Keyword  string
	Location string
}

type NewsAggPage struct {
	Title string
	News  map[string]NewsMap
}

func newsRoutine(c chan News, Location string) {
  defer wg.Done()
  var n News
  resp, _ := http.Get(Location)
  bytes, _ := ioutil.ReadAll(resp.Body)
  xml.Unmarshal(bytes, &n)
  resp.Body.Close()
  c <- n
}

func newsAggHandler(w http.ResponseWriter, r *http.Request) {
	var s SitemapIndex
	news_map := make(map[string]NewsMap)
	resp, _ := http.Get("https://www.washingtonpost.com/news-sitemap-index.xml")
	bytes, _ := ioutil.ReadAll(resp.Body)
	xml.Unmarshal(bytes, &s) // Into memory of s variable
	// fmt.Println(s.Locations)

  queue := make(chan News, 30)
	resp.Body.Close()
	for _, Location := range s.Locations {
    wg.Add(1)
    go newsRoutine(queue, Location)
	}
  wg.Wait()
  close(queue)

  for elem := range queue {
    for idx, _ := range elem.Titles {
      news_map[elem.Titles[idx]] = NewsMap{elem.Keywords[idx], elem.Locations[idx]}
    }
  }
	p := NewsAggPage{Title: "News Aggregator", News: news_map}
	t, _ := template.ParseFiles("go17template.html")
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
