/* PM Client Dashboard project
    - testing some backend logic. Implemented in Go. */ 
package main
import (
  shell "os/exec"
  f "fmt" 
)
const pm_backend string = "ProcessMedic Client Dashboard"
const opt_confirm string = "Select an option from the menu: "
const arch_server string = "Arch Linux" 
const ubuntu_server string = "Ubuntu"
const arch-detect-comm string = "which pacman" 
const ubuntu-detect-comm string = "which apt" 
var VERSION float64 
var LAST_UPDATE string
var isArch bool // boolean for if Arch is detected
var isUbuntu bool // boolean for if Ubuntu is detected
// Arch specifics: 
const ARCH_UPDATE string = "sudo pacman -Syu"
// Ubuntu specifics: 
const UBUNTU_UPDATE string = "sudo apt-get update && sudo apt get-upgrade -y"
// make a list of options for the user to select from.
var opt_list[6]string
opt_list[0] = "Deploy a WordPress website." // deploys a WP instance on the server.
opt_list[1] = "Deploy a Ghost website." // deploys a Ghost instance on the server.
opt_list[2] = "Manage website backups." // downloads and saves a snapshot of the site.
opt_list[3] = "Flush website cache." // handles tasks related to flushing the site cache.
opt_list[4] = "Check for and apply server updates." // downloads and installs updates for the server.
opt_list[5] = "View documentation resources and find help." // loads and lists help files, docs, and resources for support.
// qs, "quicksleep" func for halting sys ops 1 sec
func qs() {
  const secs int = 1
  shell.Command("sleep %d", secs).Run()
}
func detectOS(arch_server, ubuntu_server) {
  const detecting string = "Detecting GNU/Linux version of this server..."
  var avail_update_pkgs int // the number of updates that will be applied - this number is dynamic
  const run_Update string = "Applying the proper update now..."
  if arch-detect-comm {
    
  }
}
// functions for each option in opt_list
func Arch_Site_Update() {
  var detect string = "Detected server operating system: "
  
  shell.Command().Run()
}
func main() {
  f.Println("%s", pm_backend)
  qs()
  f.Println("%s", opt_confirm)
  for opts := range opt_list {
    f.Println(opts)
  }
  // user will select one from the list.
}

