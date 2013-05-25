package main

import (
	"os"
	"fmt"
)

type Fetcher interface {
	// Fetch returns the body of URL and
	// a slice of URLs found on that page.
	Fetch(url string) (body string, urls []string, err os.Error)
}

type UrlData struct {
	url   string
	depth int
}

type FetchData struct {
	err os.Error
	url string
	body string
}

// Crawl uses fetcher to recursively crawl
// pages starting with url, to a maximum of depth.
func Crawl(url string, depth int, fetcher Fetcher, data chan<- *FetchData, new_url chan<- *UrlData, quit chan<- int) {
	// TODO: Fetch URLs in parallel.
	// TODO: Don't fetch the same URL twice.
	// This implementation doesn't do either:
	defer func() { quit <- 1 }()

	if depth <= 0 {
		return
	}
	body, urls, err := fetcher.Fetch(url)
	data <- &FetchData{err, url, body}

	for _, u := range urls {
		new_url <- &UrlData{u, depth - 1}
	}
	return
}

func CrawlLoop(url chan *UrlData, output chan<- *FetchData, fetcher Fetcher) {
	defer func() { close(output) }()

	url_cache := make(map[string]bool)
	quit := make(chan int)

	for i := 0; ; {
		select {
		case <-quit:
			i--
			if i == 0 {
				return
			}
		case data := <-url:
			if url_cache[data.url] {
				break
			}
			url_cache[data.url] = true
			go Crawl(data.url, data.depth, fetcher, output, url, quit)
			i++
		}
	}
}

func CrawlWeb(start_url string, depth int, fetcher Fetcher) <-chan *FetchData {
	output := make(chan *FetchData)
	url := make(chan *UrlData)

	go CrawlLoop(url, output, fetcher)

	url <- &UrlData{start_url, depth}

	return output
}

func main() {
	for data := range CrawlWeb("http://golang.org/", 4, fetcher) {
		if data.err == nil {
			fmt.Println("found:", data.url, data.body)
		} else {
			fmt.Println("not found:", data.url)
		}
	}
}

// fakeFetcher is Fetcher that returns canned results.
type fakeFetcher map[string]*fakeResult

type fakeResult struct {
	body string
	urls []string
}

func (f *fakeFetcher) Fetch(url string) (string, []string, os.Error) {
	if res, ok := (*f)[url]; ok {
		return res.body, res.urls, nil
	}
	return "", nil, fmt.Errorf("not found: %s", url)
}

// fetcher is a populated fakeFetcher.
var fetcher = &fakeFetcher{
	"http://golang.org/": &fakeResult{
		"The Go Programming Language",
		[]string{
			"http://golang.org/pkg/",
			"http://golang.org/cmd/",
		},
	},
	"http://golang.org/pkg/": &fakeResult{
		"Packages",
		[]string{
			"http://golang.org/",
			"http://golang.org/cmd/",
			"http://golang.org/pkg/fmt/",
			"http://golang.org/pkg/os/",
		},
	},
	"http://golang.org/pkg/fmt/": &fakeResult{
		"Package fmt",
		[]string{
			"http://golang.org/",
			"http://golang.org/pkg/",
		},
	},
	"http://golang.org/pkg/os/": &fakeResult{
		"Package os",
		[]string{
			"http://golang.org/",
			"http://golang.org/pkg/",
		},
	},
	"http://golang.org/cmd/": &fakeResult{
		"Commands",
		[]string{
			"http://golang.org/cmd/6g",
			"http://golang.org/cmd/8g",
			"http://golang.org/cmd/",
			"http://golang.org/",
		},
	},
	"http://golang.org/cmd/6g": &fakeResult{
		"Command 6g",
		[]string{
			"http://golang.org/cmd/",
			"http://golang.org/",
		},
	},
}