### Code for remote machine, in my case Ubuntu Server "Hades"

`
#!bin/bash

case $1 in
        ipmi_start)
         ipmitool -H 192.168.13.150 -U control -P 1qaz2wsx power on
         ;;

        ipmi_stop)
         ipmitool -H 192.168.13.150 -U control -P 1qaz2wsx power off
         ;;

        test)
         echo "dziala" >> test.txt
         date >> test.txt
         echo "\n" >> test.txt
        ;;
esac
`

### Code for HomeAssistant, locate in /homeassistant

`bash
ssh -i /config/id_rsa -o StrictHostKeyChecking=no wiszu@192.168.13.10 "sh /home/wiszu/scripts/home_assistant_api.sh $1"
`

### Line in configuration.yaml

`yml
shell_command:
  home_assistant_api_hades: "sh /homeassistant/hades_api.sh echo '{{data}}'"
`
