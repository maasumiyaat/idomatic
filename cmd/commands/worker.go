package commands

import "github.com/spf13/cobra"

var workerCmd = &cobra.Command{
	Use:   "worker",
	Short: "Manage the worker",
	Run: func(cmd *cobra.Command, args []string) {
		//TODO: Implement worker management logic here
	},
}
