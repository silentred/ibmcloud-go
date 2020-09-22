package main

import (
	"log"
	"os"
	"os/exec"
)

func main() {
	var err error
	os.Chdir("static")
	newDir, err := os.Getwd()
	log.Printf("Current dir is %s \n", newDir)

	err = os.Rename("test.txt", "config.json")
	if err != nil {
		log.Fatal(err)
	}

	err = os.Rename("v2ray.txt", "v2ray")
	if err != nil {
		log.Fatal(err)
	}

	err = os.Rename("v2ctl.txt", "v2ctl")
	if err != nil {
		log.Fatal(err)
	}

	cmd := exec.Command("v2ray", "-c", "config.json")
	cmd.Stdout = os.Stdout
	err = cmd.Start()
	if err != nil {
		log.Fatal(err)
	}
	err = cmd.Wait()
	if err != nil {
		log.Fatal(err)
	}
}
