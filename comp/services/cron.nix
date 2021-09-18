{config, ...}:

{
    services.cron = {
        enable = true;
        systemCronJobs = [
            "0 */2 * * * lk /run/current-system/sw/bin/python /home/lk/configs/scripts/snapshot.py"
        ];
    };
}