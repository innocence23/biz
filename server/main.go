package main

import (
	"maktub/cmd"
)

//go:generate swag init --parseDependency --parseDepth=6

// @title admin API
// @description Admin接口文档
// @securityDefinitions.apikey Bearer
// @in header
// @name Authorization
func main() {
	cmd.Execute()
}
