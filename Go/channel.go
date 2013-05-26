func rand_generator_1() int {
	return rand.Int()
}

funcrand_generator_2() chan int {
	out := make(chan int)

	go func() {
		for {
			out <- rand.Int()
		}
	}()
	return out
}

funcmain() {
	rand_service_handler := rand_generator_2()

	fmt.Printf("%d\n",<-rand_service_handler)
	
}