package commands

import "github.com/spf13/cobra"

var serverCmd = &cobra.Command{
	Use:   "server",
	Short: "Manage the server",
	Long:  "Manage the server",
	Run: func(cmd *cobra.Command, args []string) {
		//TODO: Implement server management logic here
	},
}
