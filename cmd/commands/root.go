package commands

import (
	"github.com/maasumiyaat/idomatic"
	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:     "idomatic",
	Short:   "idomatic is a tool for managing idiomatic code",
	Version: idomatic.Version,
}

func init() {
	rootCmd.AddCommand(serverCmd)
	rootCmd.AddCommand(workerCmd)
	rootCmd.AddCommand(migrateCmd)
}

func Execute() error {
	return rootCmd.Execute()
}
