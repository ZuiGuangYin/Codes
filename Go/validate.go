/*
go语言使用正则匹配中国手机号码
*/

package main 

import (
	"regexp"
)

const (
	regular = "^(13[0-9]|14[57]|15[0-35-9]|18[07-9])\\d{8}$"
)

func validate(mobileNum string) bool {
	reg := regexp.mustCompile(regexp)
	return reg.MatchString(mobileNum)
}

func main() {
	if validate("1388888888") {
		Println("是手机号码")
		return 
	}
	Println("不是手机号码")
}