package main 
import (
	"io"
	"net/http"
	"log"
)

func HelloServer(w http.ResponseWriter,req *http.Request) {
	io.WriteString(w,"hello,world!\n")
}

func main() {
	http.HandleFunc("/hello",HelloServer)
	err := http.ListenAndServer(":12345",nil)
	if err != nill {
		log.Fatal("ListenAndServer: ",err)
	}
}