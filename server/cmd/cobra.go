package cmd

import (
	"errors"
	"fmt"
	"maktub/cmd/api"
	"maktub/cmd/app"
	"maktub/cmd/config"
	"maktub/cmd/version"
	"maktub/common/global"
	"os"

	"github.com/go-admin-team/go-admin-core/sdk/pkg"
	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:          "admin",
	Short:        "admin",
	SilenceUsage: true,
	Long:         `admin`,
	Args: func(cmd *cobra.Command, args []string) error {
		if len(args) < 1 {
			tip()
			return errors.New(pkg.Red("requires at least one arg"))
		}
		return nil
	},
	PersistentPreRunE: func(*cobra.Command, []string) error {
		return nil
	},
	Run: func(cmd *cobra.Command, args []string) {
		tip()
	},
}

func tip() {
	usageStr := `欢迎使用 ` + pkg.Green(`maktub `+global.Version) + ` 可以使用 ` + pkg.Red(`-h`) + ` 查看命令`
	fmt.Printf("%s\n", usageStr)
}

func init() {
	rootCmd.AddCommand(api.StartCmd)
	rootCmd.AddCommand(version.StartCmd)
	rootCmd.AddCommand(config.StartCmd)
	rootCmd.AddCommand(app.StartCmd)
}

//Execute : apply commands
func Execute() {
	if err := rootCmd.Execute(); err != nil {
		os.Exit(-1)
	}
}
