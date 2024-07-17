# ShellPass: Advanced Shell Script for Secure Command Execution and Evasion
https://github.com/user-attachments/assets/21ea7bbb-a7e5-44a4-81bd-60d56c8c555c
## Overview
ShellPass is a sophisticated Bash script engineered to enhance security and stealth during command-line operations. This tool is particularly useful for penetration testers and security professionals who need to execute commands without leaving traces in command history, ensuring operational security and reducing the risk of detection.
### Features
- [x] History Evasion: Completely disables command history logging, preventing forensic analysis of executed commands.
- [x] Auto-Completion: Implements TAB-based command auto-completion to streamline command input.
- [x] Privilege Escalation Handling: Transparently attempts to re-execute commands with sudo if initial execution fails due to insufficient permissions.
- [x] Visual Enhancement: Utilizes colored prompts for better readability and quick visual parsing of terminal output.
- [x] Seamless Directory Navigation: Maintains full shell functionality, allowing easy navigation and file system interaction.

### Installation
1. Clone the repository:

```bash
git clone https://github.com/symbolexe/ShellPass.git
```

2. Navigate to the directory:

```bash
cd ShellPass
```

( this tool hae 777 permission )

### Usage
#### Execute the script:

```bash
./ShellPass.sh
```

You will enter a secure shell environment designed for stealth operations. Commands will not be logged in history. Type quit_shell to exit the secure shell.
Example

```sh
Welcome to the secure shell. Type 'quit_shell' to exit.
Enter your command: ls -la
Enter your command: sudo apt-get update
Enter your command: cd /etc
Enter your command: cat passwd
Enter your command: quit_shell
Exiting shell...
```
### Technical Details
- [x] History Control: The script unsets all history-related environment variables and modifies history file permissions to read-only, ensuring no commands are logged.
- [x] Command Execution: Commands are executed with a leading space to evade history logging. If a command fails due to permissions, it is retried with sudo.
- [x] Auto-Completion: Bash bind is used to enable TAB-based auto-completion.
- [x] Colored Prompts: Custom PS1 settings are applied to enhance prompt visibility.
