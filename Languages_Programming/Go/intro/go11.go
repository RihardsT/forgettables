package main

import ("fmt"
        "net/http"
        "io/ioutil"
        "encoding/xml")

//var washPostXML = []byte(`THEXMLGOESHERE`)

type SitemapIndex struct {
  Locations []Location `xml:"sitemap"`
}
// [5]type == array. Fixed array
// []type == slice.

type Location struct {
  Loc string `xml:"loc"`
}

func (l Location) String() string{
  return fmt.Sprintf(l.Loc)
}

func main() {
  resp, _ := http.Get("https://www.washingtonpost.com/news-sitemap-index.xml")
  bytes, _ := ioutil.ReadAll(resp.Body)
  // bytes := washPostXML // From hardcoded XML in variable
  resp.Body.Close()

  var s SitemapIndex
  xml.Unmarshal(bytes, &s) // Into memory of s variable
  fmt.Println(s.Locations)

}
