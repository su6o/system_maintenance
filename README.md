<h3>System Maintenance & Security Automation Script for Kali Linux</h3>

This Bash script automates essential system maintenance and security checks on Kali Linux. It simplifies common tasks like system updates, disk cleanup, firewall status checks, network scanning, and security audits.

<h4>Features</h4>
<ul>
    <li><strong>System Update & Upgrade:</strong> Automatically updates and upgrades your system.</li>
    <li><strong>Disk Cleanup:</strong> Cleans logs, cache, and unnecessary files.</li>
    <li><strong>Security Audits:</strong> Runs tools like <code>chkrootkit</code>, <code>lynis</code>, and <code>clamav</code> to check for vulnerabilities.</li>
    <li><strong>Firewall Status Check:</strong> Verifies the status of <code>ufw</code> or <code>iptables</code> firewall.</li>
    <li><strong>Network Scan:</strong> Performs a quick <code>nmap</code> scan to check for open ports.</li>
    <li><strong>Sudo Privileged Users Check:</strong> Lists users with sudo privileges.</li>
    <li><strong>SSH Configuration Check:</strong> Reviews SSH settings for secure configuration.</li>
    <li><strong>Reboot/Shutdown Option:</strong> Option to reboot or shutdown after completing tasks.</li>
</ul>

<h4>Prerequisites</h4>
<ul>
    <li>Kali Linux (or any Debian-based Linux distro)</li>
    <li><code>chkrootkit</code></li>
    <li><code>lynis</code></li>
    <li><code>clamav</code></li>
    <li><code>nmap</code></li>
    <li><code>ufw</code> or <code>iptables</code></li>
</ul>

<h4>Installation</h4>
<ol>
    <li>Clone the repository:
        <pre><code>git clone https://github.com/su6o/system-maintenance-script.git</code></pre>
    </li>
    <li>Go to directory:
        <pre><code>cd system-maintenance-script</code></pre>
    </li>
    <li>Make the script executable:
        <pre><code>chmod +x system_maintenance.sh</code></pre>
    </li>
    <li>Enjoy:
        <pre><code>./system_maintenance.sh</code></pre>
    </li>
</ol>
