package main

import (
	"os"

	"github.com/k0kubun/pp"
	"github.com/maasumiyaat/idomatic/cmd/commands"
)

func main() {
	if err := commands.Execute(); err != nil {
		pp.Println(err)
		os.Exit(1)
	}
}
