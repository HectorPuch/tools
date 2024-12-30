# Active Network Scanner

This Bash script allows you to scan a local network to find active devices using the `ping` utility. It takes a partial IP address as input (e.g., `192.168.1`) and scans all the hosts in the address range `1-254` to check which ones are active.

## Requirements

- A Linux or similar system with Bash support.
- Access to the network you want to scan.
- Permissions to execute the script.

## Usage

To use the script, you must provide the network address as an argument. For example, to scan the `192.168.1` network, you would run the following command:

```bash
./activeNetworkScanner.sh 192.168.1
```

## Improvements and Suggestions

- This script can be improved for better efficiency by fine-tunning the parallel process control.
- It can be customized to perform more specific scans (e.g., scanning ports or performing more detailed connectivity testings).

## Contributions

If you would like to contribute to this project, please open a *pull request* or submit an *issue* with suggestions or fixes.

## License

This project is licensed under the **GPL-3.0 license**. See the **LICENSE** file for more details.