package main 
import (
	"fmt"
	"net/http"
	"log"
)

type Counter struct {
	n int
}

func (ctr *Counter) ServerHTTP(c http.ResponseWriter,req *http.Requst) {
	ctr.n++
	fmt.Fprintf(c,"counter + %d\n",ctr.n)
}

func main() {
	http.Handle("/counter",new(Counter))
	log.Fatal("LlistenAndServer: ",http.ListenAndServe(":12345",nil))
}