package main

import (
	"encoding/xml"
	"fmt"
	"io/ioutil"
	"net/http"
)
type SitemapIndex struct {
	Locations []string `xml:"sitemap>loc"` // get loc tag under sitemap tag
}

type News struct {
  Titles []string `xml:"url>news>title"`
  Keywords []string `xml:"url>news>keywords"`
  Locations []string `xml:"url>loc"`
}

func main() {
  var s SitemapIndex
  var n News

  resp, _ := http.Get("https://www.washingtonpost.com/news-sitemap-index.xml")
	bytes, _ := ioutil.ReadAll(resp.Body)

	xml.Unmarshal(bytes, &s) // Into memory of s variable
	// fmt.Println(s.Locations)
	for _, Location := range s.Locations {
    resp, _ := http.Get(Location)
  	bytes, _ := ioutil.ReadAll(resp.Body)
  	xml.Unmarshal(bytes, &s)
	}
  resp.Body.Close()
}
