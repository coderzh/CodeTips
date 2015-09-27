// Learning GoLang
package main

import (
	"fmt"
	"log"
	"os"
	// "errors"
	"math"
)

// 0. 注释
/*
块注释
*/
// 行注释

// 1. Hello World
func helloWorld() {
	fmt.Println("Hello, 世界")
}

// 2.变量类型
func typeDemo() {
	// 变量申明
	var v1 int
	var (
		v2 int
		v3 string
	)

	// 变量初始化
	var v4 int = 10
	// 等价于:
	var v5 = 10
	// 一般这样就好
	v6 := 10

	// 赋值，多重赋值
	v1 = 10
	v2, v3 = 20, "test"
	// 匿名变量 _
	_, v4 = v5, v6

	fmt.Println(v1, v2, v3, v4)

	// 常量
	const Pi float64 = 3.1415926
	const MaxPlayer = 10

	// 枚举
	const (
		Sunday = iota // iota从0递增
		Mondy
		Tuesday
		// ...
	)

	// 类型
	// 1. 布尔
	var b1 bool
	b1 = true
	b1 = (1 == 2)

	fmt.Println(b1)

	// 2. 整形
	// int8 uint8 int16 uint16 int32 uint32 int64 uint64 int uint uintptr
	var i32 int32
	// 强制转换
	i32 = int32(64)
	// 运算：+, -, *, /, %（求余）
	// 比较：>, <, ==, >=, <=, !=
	// 位运算：x << y, x >> y, x ^ y, x & y, x | y, ^x （取反）

	fmt.Println(i32)

	// 3. 浮点
	// float32, float64
	var f1 float64 = 1.0001
	var f2 float64 = 1.0002
	// 浮点比较
	isEqual := math.Dim(f1, f2) < 0.0001

	fmt.Println(isEqual)

	// 4. 字符串
	var s1 string
	s1 = "abc"
	// 字符串连接
	s1 = s1 + "ddd"
	// 取长度
	n := len(s1)
	// 取字符
	c1 := s1[0]

	fmt.Println(c1)

	// 字节遍历
	for i := 0; i < n; i++ {
		ch := s1[i]
		fmt.Println(ch)
	}
	// Unicode字符遍历
	for i, ch := range s1 {
		fmt.Println(i, ch)
	}

	// 5. 数组
	var arr1 [32]int
	//var arr2 [3][8]int // 二维数组
	// 初始化
	arr1 = [32]int{0}
	array := [5]int{1, 2, 3, 4, 5}
	// 数组遍历
	for i := 0; i < len(array); i++ {
		fmt.Println(array[i])
	}
	for i, v := range arr1 {
		fmt.Println(i, v)
	}
	// 数组是值类型，每次参数传递都是一份拷贝

	// 数组切片Slice
	var mySlice []int = array[:2]
	mySlice1 := make([]int, 5)
	mySlice2 := make([]int, 5, 10)

	fmt.Println("len(mySlice2:", len(mySlice2)) // 5
	fmt.Println("cap(mySlice2:", cap(mySlice2)) // 10

	mySlice3 := append(mySlice, 2, 3, 4)
	mySlice4 := append(mySlice, mySlice1...)

	copy(mySlice3, mySlice4)

	// 6. Map
	var m map[int]string
	m[1] = "ddd"
	m1 := make(map[int]string)
	m2 := map[int]string{
		1: "a",
		2: "b",
	}

	delete(m2, 1)

	value, ok := m1[1]
	if ok {
		fmt.Println(value)
	}

	for k, v := range m2 {
		fmt.Println(k, v)
	}

}

// 3. 流程控制
func flowDemo() {
	// if else
	a := 10
	if a < 10 {
		// ..
	} else {
		// ..
	}

	// switch
	switch a {
	case 0:
		fmt.Println("0")
	case 10:
		fmt.Println("10")
	default:
		fmt.Println("default")
	}

	switch {
	case a < 10:
		fmt.Println("<10")
	case a < 20:
		fmt.Println("<20")
	}

	// 循环
	for i := 0; i < 10; i++ {
	}
	// 无限循环
	sum := 0
	for {
		sum++
		if sum > 10 {
			break
			// 指定break
			// break JLoop
		}
	}

	goto JLoop

JLoop:
	// break to here

}

// 4. 函数
// func 函数名(参数列表)(返回值列表) {
// }
func sum1(value1 int, value2 int) (result int, err error) {
	// err = errors.New("xxxx")
	return value1 + value2, nil
}

func sum2(value1, value2 int) int {
	return value1 + value2
}

// 不定参数
// myFunc(1, 2, 3, 4, 5)
func myFunc(args ...int) {
	for _, arg := range args {
		fmt.Println(arg)
	}
	// 传递
	// myFunc2(args...)
	// myFunc2(args[1:]...)
}

// 任意类型的不定参数
func myPrintf(args ...interface{}) {
	for _, arg := range args {
		switch arg.(type) {
		case int:
			fmt.Println(arg, " is int")
		case string:
			fmt.Println(arg, " is string")
		default:
			fmt.Println(arg, " is unknown")
		}
	}
}

// 匿名函数
func anonymousFunc() {
	f := func(a, b int) int {
		return a + b
	}

	f(1, 2)
}

// defer
func copyFile(path string) {
	f, err := os.Open(path)
	if err != nil {
		return
	}

	defer f.Close()
	// or
	defer func() {
		if r := recover(); r != nil {
			fmt.Println("Runtime error caught: %v", r)
		}
	}()
}

// 结构体
type Rect struct {
	// 小写为private
	x, y float64
	// 大写为public
	Width, Height float64
}

// 大写方法为public，小写为private
func (r *Rect) Area() float64 {
	return r.Width * r.Height
}

func netRect(x, y, width, height float64) *Rect {
	// rect1 := new(Rect)
	// rect2 := &Rect{}
	// rect3 := &Rect{Width:100, Height:200}
	return &Rect{x, y, width, height}
}

// 匿名组合
type Base struct {
	Name string
}

func (base *Base) Foo() {}
func (base *Base) Bar() {}

type Foo struct {
	Base
	*log.Logger
}

func (foo *Foo) Bar() {
	foo.Base.Bar()
	// ...
}

// 非侵入式接口
type IFile interface {
	Read(buf []byte) (n int, err error)
	Write(buf []byte) (n int, err error)
}

type File struct {
}

func (file *File) Read(buf []byte) (n int, err error) {
	return 0, nil
}

func (file *File) Write(buf []byte) (n int, err error) {
	return 0, nil
}

func interfaceDemo() {
	// 只要实现了Read, Write方法即可
	var file IFile = new(File)

	// 接口查询
	// 是否实现了IFile接口
	if file2, ok := file.(IFile); ok {
		file2.Read([]byte{})
	}
	// 实例类型是否是File
	if file3, ok := file.(*File); ok {
		file3.Read([]byte{})
	}

	// 类型查询
	switch v := file.(type) {
	}
}

func main() {
	helloWorld()
}
