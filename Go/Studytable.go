//function errors.New() 
//check the source through godoc
//command as below
//godoc fmt Errorf -src=true
//strconv package 
//strocnv.Atoi
//Atoi(string ) int 
 
package main
 
import (
        "fmt"
  	"os"
	//	"errors"
		"time"
		"strconv"
)
 
type Timetable struct {
     ID string
     One string
     Two string
     Three string
     Four string
}
/*
const (
 A = iota +1 // 1
 B 
 C 
 D
 E          //5 
 F
 G
 )
*/
 func search() {
 
 //var timetable_t map[string] Timetable
 timetable_t := make(map[string] Timetable,7)
 
timetable_t["1"]=Timetable{"1","1-604,1-20,En","empty","3-303,1-20,MacroEco","empty"}
timetable_t["2"]=Timetable{"2","empty","empty","empty","empty"}
timetable_t["3"]=Timetable{"3","empty","1-604,1-20,En","empty","empty"}
timetable_t["4"]=Timetable{"4","empty","5-201,1-20,Internation-eco","empty","empty"}
timetable_t["5"]=Timetable{"5","empty","3-209,1-18,Mao","1-504,1-20,Social eco count","empty"}
timetable_t["6"]=Timetable{"6","ho","li","da","y"}
 
           if len(os.Args) < 2 {
		   Version()
		   } else {
		   day , _ := strconv.Atoi(os.Args[1])
	// args := os.Args[1]
	// day ,err := getday_t() 
	 // if err != nil {
	 //     fmt.Println(err)
	//	  } else {
      t1 := time.Now() //begin to count the time 
	  Showbar()
	       
	 switch day {
	 case 1 :
           tt,ok := timetable_t["1"]
            if ok {
            fmt.Println(tt.ID, tt.One, tt.Two,  tt.Three,  tt.Four)
	           } 
	 case 2 :
          tt,ok := timetable_t["2"]
		   if ok {
		   fmt.Println(tt.ID,     tt.One,     tt.Two,    tt.Three,     tt.Four)
		   }
	 case 3 :
	      tt,ok := timetable_t["3"]
		   if ok {
		   fmt.Println(tt.ID,     tt.One,      tt.Two,     tt.Three,    tt.Four)
		   }
	 case 4 :
	      tt,ok := timetable_t["4"] 
		   if ok {
		   fmt.Println(tt.ID,     tt.One,       tt.Two,     tt.Three,     tt.Four)
		   }
	 case 5 :
	      tt,ok := timetable_t["5"]
		   if ok {
		   fmt.Println(tt.ID,     tt.One,       tt.Two,     tt.Three,      tt.Four)
		   }
	 case 6 ,7 :
          
           fmt.Println("Holiday now")
     default :
           fmt.Println("Input Error")	 
		   
	    }
		t2 := time.Now() //get the finish time t2 
		fmt.Println("The program costs ", t2.Sub(t1) ,"to complete") //get the time to run the program 
		
	}
 
}
 
 
var Version = func() {
    fmt.Println("TT <argument>\n" +
	          "Usages: to get timetable of the Class 8, Eco 2011\n" +
		  "1->monday,2->tusday,3->wednesday,4->thusday,5->friday,6->saturday,7->sunday\n")
	  }
 
 
var Showbar = func () {
   fmt.Println("ID         One           Two                  Three              Four ")
   }
 
func main() {
search()
}
 
/*
func getday_t() (int,error) { //add error type to return 
 
 if len(os.Args) == 1 {
     fmt.Println("TT <argument>")
	 fmt.Println("<argument> is A,B,C,D,E,F,G")
	 } else {
 
 if os.Args[1] == "A" {
   return A, nil
  }
 if os.Args[1] == "B" {
  return B, nil
  }
 if os.Args[1] == "C" {
  return C, nil
  }
 if os.Args[1] == "D" {
  return D, nil
  }
 if os.Args[1] == "E" {
 return E, nil
  }
 if os.Args[1] == "F" || os.Args[1] == "G" {
  return F, nil
  }
  
 }
 return 10 ,errors.New("you didn't input a <argument> or input error\n")
 
 }
 */
 
  
 
  
   
 